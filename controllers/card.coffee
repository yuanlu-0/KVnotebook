# Load required packages
Card = require('../models/card')

# Create endpoint /api/cards for POSTS
exports.postCard = (req, res) ->
  card = new Card
  # Set the card properties that came from the POST data
  card.topic = req.body.topic
  card.key = req.body.key
  card.value = req.body.value
  card.userId = req.user._id
  # Save the card and check for errors
  card.save (err) ->
    if err
      res.send err
    res.json
      message: 'Card added!'
      data: card

# Create endpoint /api/cards for GET
exports.getCards = (req, res) ->
  card.find (err, cards) ->
    if err
      res.send err
    res.json card

# Create endpoint /api/cards/:card_id for GET
exports.getCard = (req, res) ->
  Card.findById req.params.card_id, (err, card) ->
    if err
      res.send err
    res.json card

# Create endpoint /api/cards/:card_id for PUT

exports.putCard = (req, res) ->
  Card.findById req.params.card_id, (err, card) ->
    if err
      res.send err
    # TODO: Update the existing card

    # Save the card and check for errors
    card.save (err) ->
      if err
        res.send err
      res.json card

# Create endpoint /api/cards/:card_id for DELETE
exports.deleteCard = (req, res) ->
  # Use the card model to find a specific card and remove it
  Card.findByIdAndRemove req.params.card_id, (err) ->
    if err
      res.send err
    res.json message: 'card removed!'

