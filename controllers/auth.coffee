# Load required packages
passport = require('passport')
BasicStrategy = require('passport-http').BasicStrategy
User = require('../models/user')

passport.use new BasicStrategy((username, password, callback) ->
  User.findOne { email: username }, (err, user) ->
    if err
      return callback(err)
    # No user found with that username
    if !user
      return callback(null, false)
    # Make sure the password is correct
    user.verifyPassword password, (err, isMatch) ->
      if err
        return callback(err)
      # Password did not match
      if !isMatch
        return callback(null, false)
      # Success
      return callback null, user

)
exports.isAuthenticated = passport.authenticate('basic', session: false)
