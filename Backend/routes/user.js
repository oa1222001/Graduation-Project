const { deleteaccount, editphone, deletecontact, addcontact, deleteguardian, editpassword, addguardian, getContacts, getGuardian } = require('../controllers/user');
const { body } = require('express-validator');

const router = require('express').Router();



router.put('/editphone',
    body('number').custom((value, { req }) => {
        // this is custom validation for egyptian phone numbers

        const egyptianNumberRegex = /^(01)[0125]\d{8}$/; // Regex pattern for Egyptian phone numbers
        return egyptianNumberRegex.test(value);

    }),
    body('password')
        .trim()
        .isLength({ min: 8, max: 100 }),
    editphone)

router.delete('/deletecontact',
    body('number').custom((value, { req }) => {
        // this is custom validation for egyptian phone numbers

        const egyptianNumberRegex = /^(01)[0125]\d{8}$/; // Regex pattern for Egyptian phone numbers
        return egyptianNumberRegex.test(value);

    }),
    deletecontact)

router.post('/addcontact',
    body('name')
        .trim()
        .isLength({ max: 50 })
        .not()
        .isEmpty(),
    body('email', 'Provide a valid Email.')
        .trim()
        .isEmail()

    ,
    body('number').custom((value, { req }) => {
        // this is custom validation for egyptian phone numbers

        const egyptianNumberRegex = /^(01)[0125]\d{8}$/; // Regex pattern for Egyptian phone numbers
        return egyptianNumberRegex.test(value);

    })
    ,
    addcontact)

router.delete('/deleteguardian',
    deleteguardian)

router.put('/editpassword',
    body('old_password')
        .trim()
        .isLength({ min: 8, max: 100 }),
    body('new_password')
        .trim()
        .isLength({ min: 8, max: 100 }),
    editpassword)

router.post('/addguardian',
    body('email', 'Provide a valid Email.')
        .trim()
        .isEmail()
    ,
    body('name')
        .trim()
        .isLength({ max: 50 })
        .not()
        .isEmpty(),
    body('number').custom((value, { req }) => {
        // this is custom validation for egyptian phone numbers

        const egyptianNumberRegex = /^(01)[0125]\d{8}$/; // Regex pattern for Egyptian phone numbers
        return egyptianNumberRegex.test(value);

    })
    ,
    addguardian)

router.delete('/deleteaccount',
    body('password')
        .trim()
        .isLength({ min: 8, max: 100 }),
    deleteaccount)

router.get('/getcontacts', getContacts)

router.get('/getguardian', getGuardian)

module.exports = router