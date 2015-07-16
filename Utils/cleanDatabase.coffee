mongoose = require('mongoose');
dbUrl = 'mongodb://localhost:27017/kvstore'
mongoose.connect dbUrl, (err) ->
  mongoose.connection.db.dropDatabase (err) ->
    mongoose.connection.close (err) ->
      return