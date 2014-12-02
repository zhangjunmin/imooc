#
#hHTTP SERVER
#

express = require 'express'
port    = process.env.PORT || 3000
path = require 'path'
mongoose = require 'mongoose'
_ = require 'underscore'
Movie = require './models/movie'

mongoose.connect('mongodb://localhost/imooc')
app = express()
app.set 'views', './views/pages'
app.set 'view engine', 'jade'

app.use express.bodyParser()
app.use express.static(path.join(__dirname,'bower_components'))

app.listen port, ->
  console.log("server is running at port: #{port}")

#
## router
#

#index
app.get '/', (req, res) ->
  Movie.fetch (err,movies)->
    return console.log(err) if err
    res.render 'index',
      title : 'immooc 首页'
      movies : movies

#detail
app.get '/movies/:id', (req, res) ->
  id = req.params.id
  Movie.findById id,(err,movie) ->
    console.log(movie)
    return console.log(err) if err
    res.render 'detail',
      title : 'immooc 详情页'
      movie :  movie

#admin
app.get '/admin/movie', (req, res) ->
  res.render 'admin',
    title : 'immooc 后台录入页'
    movie :
      doctor: ''
      country:''
      title:''
      language:''
      year :''
      poster:''
      flash :''
      summary:''

#admin update
app.get '/admin/update/:id',(req,res)->
  id = req.params.id
  if id?
    Movie.findById id, (err,movie) ->
      res.render 'admin',
        title : 'imooc 后台更新页'
        movie : movie

#admin post

app.post '/admin/movie/new', (req, res) ->

  id = req.body.movie._id
  movieObj = req.body.movie
  _movie = null
  if id isnt 'undefined'
    Movie.findById id, (err,movie) ->
      return console.log(err) if err
      _movie = _.extend movie, movieObj
      _movie.save (err,movie)->
        return console.log(err) if err
        res.redirect "/movies/#{movie._id}"
  else
    console.log 'new'
    _movie = new Movie
      doctor : movieObj.doctor
      title : movieObj.title
      country : movieObj.country
      language : movieObj.language
      year : movieObj.year
      poster : movieObj.poster
      summary : movieObj.summary
      flash : movieObj.flash
    _movie.save (err,movie)->
      return console.log(err) if err
      res.redirect "/movies/#{movie._id}"
#list
app.get '/admin/list', (req, res) ->
  Movie.fetch (err,movies)->
    return console.log(err) if err
    res.render 'list',
      title : 'immooc 后台列表页'
      movies : movies