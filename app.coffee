#
#hHTTP SERVER
#

express = require 'express'
port    = process.env.PORT || 3000
path = require 'path'
mongoose = require 'mongoose'
_ = require 'underscore'
moment = require 'moment'
m_route = require './routes/movie'

mongoose.connect('mongodb://localhost/imooc')
app = express()
app.locals.moment = moment
app.set 'views', './views/pages'
app.set 'view engine', 'jade'

app.use express.bodyParser()
app.use express.static(path.join(__dirname,'bower_components'))

app.listen port, ->
  console.log("server is running at port: #{port}")

#
## router
#
m_route app