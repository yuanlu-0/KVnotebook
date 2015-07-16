config = require('config')
express = require('express')
mongoose = require('mongoose')
bodyParser = require('body-parser')
passport = require('passport')
authController = require('./controllers/auth')
cardController = require('./controllers/card')
userController = require('./controllers/user')

# Connect to database
dbUrl = config.get('mongodb.url')
mongoose.connect(dbUrl)

# Create our Express application
app = express()

# Use the body-parser package in our application
app.use bodyParser.urlencoded({
  extended: true})

# Use the passport package in our application
app.use passport.initialize()

# Use environment defined port
port = config.get('server.port')
# Create our Express router
router = express.Router()

# Create endpoint handlers for /cards
router.route('/cards')
.post(authController.isAuthenticated, cardController.postCard)
.get(authController.isAuthenticated, cardController.getCards);

# Create endpoint handlers for /cards/:card_id
router.route('/cards/:card_id')
.get(authController.isAuthenticated, cardController.getCard)
.put(authController.isAuthenticated, cardController.putCard)
.delete(authController.isAuthenticated, cardController.deleteCard);

# Create endpoint handlers for /users
router.route('/users')
.post(userController.postUsers)
.get(authController.isAuthenticated, userController.getUsers);

# Register all our routes with /api
app.use '/api', router
# Start the server
app.listen port
console.log "Running server on port: " + port
