const { signUp, forgotPass, login, verifyEmail, verifyForgotPass, verifyNumber } = require('../controllers/auth');
const { body } = require('express-validator');

const router = require('express').Router();

router.post('/signup',
    body('password', 'Password must be Alphanumeric between 8 and 100 characters.')
        .trim()
        .isLength({ min: 8, max: 100 })
    ,
    body('email', 'Provide a valid Email.')
        .trim()
        .isEmail()
    ,
    body('name')
        .trim()
        .isLength({ max: 50 })
        .not()
        .isEmpty()

    ,
    body('number').custom((value, { req }) => {
        // this is custom validation for egyptian phone numbers

        const egyptianNumberRegex = /^(01)[0125]\d{8}$/; // Regex pattern for Egyptian phone numbers
        return egyptianNumberRegex.test(value);

    })
    ,
    signUp)


router.post('/login',
    body('password', 'Password must be Alphanumeric between 8 and 100 characters.')
        .trim()
        .isLength({ min: 8, max: 100 })
    ,
    body('email', 'Provide a valid Email.')
        .trim()
        .isEmail()

    , login)

router.get('/emailverify/:token', verifyEmail)

router.get('/phoneverify/:token', verifyNumber)

router.post('/forgotpassword', body('email', 'Provide a valid Email.')
    .trim()
    .isEmail()
    , forgotPass)

router.post('/verifypassword', body('password', 'Password must be Alphanumeric between 8 and 100 characters.')
    .trim()
    .isLength({ min: 8, max: 100 }),
    verifyForgotPass)

module.exports = router