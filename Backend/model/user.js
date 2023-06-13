const mongodb = require('mongodb');
const getDb = require('../util/database').getDb;

class User {
    constructor(name, email, number, password, verifyEmailToken, verifyNumberToken) {
        this.name = name;
        this.email = email;
        this.password = password
        this.number = number
        this.verifiedEmail = false
        this.verifiedNumber = false
        this.contacts = []
        this.guardian = {}
        this.verifyEmailToken = verifyEmailToken
        this.verifyNumberToken = verifyNumberToken
        this.forgotPasswordToken = ''
        this.isInDanger = false;
        this.dangerToken = ''
        this.lastDanger = ''
        this.longitude = ''
        this.latitude = ''
    }

    // remember to always store any number in the form 20115240000

    //saves new user
    save() {
        const db = getDb();
        return db.collection('users')
            .insertOne(this)
            .catch(err => { throw {} });
    }


    static async findAndVerifyEmail(email, number) {
        const db = getDb()
        return db.collection('users').
            findOneAndUpdate({ email, number }, { $set: { verifiedEmail: true, verifyEmailToken: "" } }).then(us => { return us }).catch(err => { throw {} });
    }

    static async addContact(email, name, number, contactEmail) {
        const db = getDb()
        await this.deleteContact(email, number)
        return db.collection('users').updateOne(
            { email },
            { $push: { contacts: { name, number, email: contactEmail } } }
        )
            .then(result => {
                return result
            })
            .catch(err => {
                throw {}
            })
    }
    static async deleteContact(email, number) {
        const db = getDb()
        return db.collection('users').updateOne(
            { email, contacts: { $elemMatch: { number } } },
            { $pull: { contacts: { number } } }
        )
            .then(result => {
                return result
            })
            .catch(err => {
                throw {}
            })
    }
    static async findAndVerifyNumber(token) {
        const db = getDb()
        return db.collection('users').
            findOneAndUpdate({ verifyNumberToken: token }, { $set: { verifiedNumber: true, verifyNumberToken: "" } }, {
                returnNewDocument: true
            }).then(us => { return us }).catch(err => { throw {} });
    }


    static async findByEmail(email) {
        const db = getDb()
        return db.collection('users').findOne({ email }).then(us => { return us }).catch(err => { throw {} });
    }

    static async saveForgotPasswordToken(email, token) {
        const db = getDb()
        return db.collection('users').
            findOneAndUpdate({ email }, { $set: { forgotPasswordToken: token } }).then(us => { return us }).catch(err => { throw {} });
    }

    static async findForgotPasswordTokenUser(token) {
        const db = getDb()
        return db.collection('users').findOne({ forgotPasswordToken: token }).then(us => { return us }).catch(err => { throw {} });
    }

    static async deleteForgotPasswordTokenAndSavePassword(token, password) {
        const db = getDb()
        return db.collection('users').
            findOneAndUpdate({ forgotPasswordToken: token }, { $set: { forgotPasswordToken: '', password } }).then(us => { return us }).catch(err => { throw {} });
    }

    static async findByNumber(number) {
        const db = getDb()
        return db.collection('users').findOne({ number }).then(us => { return us }).catch(err => { throw {} });
    }


    static async findAndDeleteUnverified(email, number) {
        const db = getDb();
        await db.collection("users").deleteMany({ email, number, verifiedEmail: false }).catch(err => { throw {} })
        await db.collection("users").deleteMany({ email, number, verifiedNumber: false }).catch(err => { throw {} })
    }

    static async findAndDeleteUnverifiedInVerify(email, number) {
        const db = getDb();
        if (email) {

            await db.collection("users").deleteMany({ email, verifiedEmail: false }).catch(err => { throw {} })
        }
        if (number) {

            await db.collection("users").deleteMany({ number, verifiedNumber: false }).catch(err => { throw {} })
        }

    }

    static async deleteGuardian(email) {
        const db = getDb()
        return db.collection('users').findOneAndUpdate({ email }, { $set: { guardian: {} } }).then(us => { return us }).catch(err => { throw {} })

    }

    static async changeNumber(email, number, token) {
        const db = getDb()
        return db.collection('users').
            findOneAndUpdate({ email }, { $set: { verifyNumberToken: token, number: number, verifiedNumber: false } }).then(us => { return us }).catch(err => { throw {} });
    }

    static async changePassword(email, password) {
        const db = getDb()
        return db.collection('users').
            findOneAndUpdate({ email }, { $set: { password } }).then(us => { return us }).catch(err => { throw {} });
    }

    static async addGuardian(email, guardian) {
        await this.deleteGuardian(email)
        const db = getDb()
        return db.collection('users').
            findOneAndUpdate({ email }, { $set: { guardian } }).then(us => { return us }).catch(err => { throw {} });
    }

    static async deleteAccount(email) {
        const db = getDb()
        return db.collection('users').
            deleteOne({ email }).then(us => { return us }).catch(err => { throw {} });
    }


    static async findAndStoreDangerTokenAndLocation(email, token, longitude, latitude) {
        const db = getDb()
        // Create a new Date object with the current time
        const currentDate = new Date();


        const DateString = currentDate.toLocaleString();

        return db.collection('users').
            findOneAndUpdate({ email }, { $set: { lastDanger: DateString, dangerToken: token, isInDanger: true, longitude, latitude } }, {
                returnNewDocument: true
            }).then(us => { return us }).catch(err => { throw {} });
    }
    static async findAndUpdateLocation(email, longitude, latitude) {
        const db = getDb()


        return db.collection('users').
            findOneAndUpdate({ email }, { $set: { longitude, latitude } }, {
                returnNewDocument: true
            }).then(us => { return us }).catch(err => { throw {} });
    }

    static async findByDangerToken(token) {
        const db = getDb()
        return db.collection('users').findOne({ dangerToken: token }).then(us => { return us }).catch(err => { throw {} });
    }
    static async findAndDeleteLocation(email) {
        const db = getDb()
        return db.collection('users').
            findOneAndUpdate({ email }, { $set: { isInDanger: false, dangerToken: "", lastDanger: '', longitude: '', latitude: '' } }).then(us => { return us }).catch(err => { throw {} });
    }
}

module.exports = User;