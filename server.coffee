express = require("express")
mongoose = require("mongoose")
# Create our Express application
app = express()
# Use environment defined port or 3000
port = process.env.PORT or 3000
# Create our Express router
router = express.Router()
# Initial dummy route for testing
# http://localhost:3000/api
router.get '/', (req, res) ->
  res.json message: "Hello Coffee!"
  return
# Register all our routes with /api
app.use '/api', router
# Start the server
app.listen port
console.log "Running server on port: " + port
