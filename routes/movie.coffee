#movie routes

Movie = require '../models/movie'

module.exports = (app)->

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

  #admin delete
  app.delete '/movies/:id',(req,res)->
    id = req.params.id
    Movie.remove id, (err,movie) ->
      return console.log(err) if err
      res.send(200)

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