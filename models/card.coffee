mongoose = require('mongoose')

CardSchema = new mongoose.Schema({
  topic:
    type: String
    required: true
  key:
    type: String
    unique: true
    required: true
  value:
    type: String
    required: true
  userId:
    type: String
    unique: true
    required: true
})

module.exports = mongoose.model('Card', CardSchema)