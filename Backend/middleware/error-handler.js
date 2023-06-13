const errorHandlerMiddleware = (err, req, res, next) => {
  let customError = {
    // set default
    statusCode: err.statusCode || 500,
    msg: err.message || 'Internal Servar Error',
  }
  // if (err.errors) {
  //   return res.status(customError.statusCode).json({ msg: customError.msg, errors: err.errors })
  // }
  // else {
  return res.status(customError.statusCode).json({ message: customError.msg })
  // }

}

module.exports = errorHandlerMiddleware
