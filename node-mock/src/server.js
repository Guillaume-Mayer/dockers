// Modules
const express = require('express')
const morgan = require('morgan')
const bodyParser = require('body-parser')

// Express app
const app = express()

// Log
app.use(morgan('combined'))
app.use(bodyParser.json())
app.use(function(req, res) {
    res.status(200).json({
        method: req.method,
        url: req.url,
        body: req.body
    })
})

// Start the server
const port = 8080
app.listen(port)
console.log('Server running at port ' + port)
