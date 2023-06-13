const { validationResult } = require('express-validator');
const User = require('../model/user')
const { Vonage } = require('@vonage/server-sdk')
require('dotenv').config()
const bcrypt = require('bcryptjs')

function generateRandomString() {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    for (let i = 0; i < 6; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}

exports.editphone = async (req, res, next) => {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        const err = new Error('Validation Error')
        err.statusCode = 400
        return next(err)
    }

    const { email } = req.user
    const password = req.body.password
    const number = req.body.number

    const user = await User.findByEmail(email).catch(err => {
        let error = {}
        return next(error)
    })

    if (!user || !user.password) {
        return next({})
    }

    const isPasswordCorrect = await bcrypt.compare(password, user.password)

    if (!isPasswordCorrect) {
        const err = new Error('wrong password')
        err.statusCode = 400
        return next(err)
    }

    const isNumberExisted = await User.findByNumber('2' + number)

    if (!!isNumberExisted) {
        const err = new Error("Phone number already existed")
        err.statusCode = 400
        return next(err)
    }

    const token = generateRandomString()

    let linkForPhone = `${process.env.AWS_LINK + '/auth/phoneverify/' + token} `

    // link shortner

    const vonage = new Vonage({
        apiKey: process.env.VONAGE_KEY,
        apiSecret: process.env.VONAGE_SECRET
    })

    const text = `Woman Safety app verfication ${linkForPhone}`

    await vonage.sms.send({ to: "2" + number, from: "App", text })
        .catch(err => {
            return next({})
        });

    await User.changeNumber(email, '2' + number, token)

    res.status(200).json({ message: "done", number: number })
}

exports.deletecontact = async (req, res, next) => {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        const err = new Error('Validation Error')
        err.statusCode = 400
        return next(err)
    }
    await User.deleteContact(req.user.email, req.body.number).catch(err => {
        let error = {}
        return next(error)
    })
    res.status(200).json({ message: "deleted" })
}

exports.addcontact = async (req, res, next) => {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        const err = new Error('Validation Error')
        err.statusCode = 400
        return next(err)
    }
    await User.addContact(req.user.email, req.body.name, req.body.number, req.body.email).catch(err => {
        let error = {}
        return next(error)
    })

    res.status(200).json({ message: "done", name: req.body.name, number: req.body.number })
}

exports.deleteguardian = async (req, res, next) => {
    await User.deleteGuardian(req.user.email).catch(err => {
        let error = {}
        return next(error)
    })

    res.status(200).json({ message: "done" })
}

exports.editpassword = async (req, res, next) => {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        const err = new Error('Validation Error')
        err.statusCode = 400
        return next(err)
    }

    let { old_password, new_password } = req.body

    const user = await User.findByEmail(req.user.email).catch(err => {
        let error = {}
        return next(error)
    })

    if (!user) {
        return next({})
    }

    const isPasswordCorrect = await bcrypt.compare(old_password, user.password)
    if (!isPasswordCorrect) {
        const err = new Error('wrong old password')
        err.statusCode = 400
        return next(err)
    }
    const salt = await bcrypt.genSalt(12)
    let password = await bcrypt.hash(new_password, salt)

    await User.changePassword(req.user.email, password)

    res.status(200).json({ message: "done" })
}

exports.addguardian = async (req, res, next) => {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        const err = new Error('Validation Error')
        err.statusCode = 400
        return next(err)
    }

    const { name, number, email } = req.body

    await User.addGuardian(req.user.email, { name, number, email })

    res.status(200).json({ message: "done", name, number, email })
}

exports.deleteaccount = async (req, res, next) => {
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
        const err = new Error('Validation Error')
        err.statusCode = 400
        return next(err)
    }

    const password = req.body.password

    const user = await User.findByEmail(req.user.email).catch(err => {
        let error = {}
        return next(error)
    })

    if (!user) {
        return next({})
    }

    const isPasswordCorrect = await bcrypt.compare(password, user.password)

    if (!isPasswordCorrect) {
        const err = new Error('wrong password')
        err.statusCode = 400
        return next(err)
    }

    await User.deleteAccount(req.user.email);

    res.status(200).json({ message: "done" })
}

exports.getContactsGuardian = async (req, res, next) => {

    const { email } = req.user

    const user = await User.findByEmail(email).catch(err => {
        let error = {}
        return next(error)
    })

    if (!user) {
        return next({})
    }

    res.status(200).json({ contacts: user.contacts, guardian: user.guardian })
}
