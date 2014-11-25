#
#hHTTP SERVER
#

express = require 'express'
port    = process.env.PORT || 3000
path = require 'path'

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
  res.render 'index',
    title : 'immooc 首页',
    movies :[{
      title:'机械战警',
      _id : 1,
      poster:'http://r4.ykimg.com/0515000054730D3A6737B37AED092F66'
    },{
      title:'机械战警',
      _id : 1,
      poster:'http://r4.ykimg.com/0515000054730D3A6737B37AED092F66'
    },{
      title:'机械战警',
      _id : 1,
      poster:'http://r4.ykimg.com/0515000054730D3A6737B37AED092F66'
    },{
      title:'机械战警'
      _id : 1
      poster:'http://r4.ykimg.com/0515000054730D3A6737B37AED092F66'
    },{
      title:'机械战警'
      _id : 2
      poster:'http://r4.ykimg.com/0515000054730D3A6737B37AED092F66'
    },{
      title:'机械战警'
      _id : 3
      poster:'http://r4.ykimg.com/0515000054730D3A6737B37AED092F66'
    },{
      title:'机械战警'
      _id : 4
      poster:'http://r4.ykimg.com/0515000054730D3A6737B37AED092F66'
    },{
      title:'机械战警'
      _id : 5,
      poster:'http://r4.ykimg.com/0515000054730D3A6737B37AED092F66'
    },{
      title:'机械战警'
      _id : 6
      poster:'http://r4.ykimg.com/0515000054730D3A6737B37AED092F66'
    }]

#detail
app.get '/movies/:id', (req, res) ->
  res.render 'detail',
    title : 'immooc 详情页'
    movie :
      doctor: '迈克尔.贝'
      country:'美国'
      title:'机械战警'
      language:'英语'
      year :2014
      poster:'http://r4.ykimg.com/0515000054730D3A6737B37AED092F66'
      flash :'http://static.youku.com/v1.0.0485/v/swf/loader.swf'
      summary:'诱骗少女奸杀案”二审维持原判 丈夫死刑妻子无期 141124'

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

#list
app.get '/admin/list', (req, res) ->
  res.render 'list',
    title : 'immooc 后台列表页'
    movies: [{
      _id:1
      doctor: '迈克尔.贝'
      country:'美国'
      title:'机械战警'
      language:'英语'
      year :2014
      poster:'http://r4.ykimg.com/0515000054730D3A6737B37AED092F66'
      flash :'http://static.youku.com/v1.0.0485/v/swf/loader.swf'
      summary:'诱骗少女奸杀案”二审维持原判 丈夫死刑妻子无期 141124'
    },{
      _id:2
      doctor: '迈克尔.贝'
      country:'美国'
      title:'机械战警'
      language:'英语'
      year :2014
      poster:'http://r4.ykimg.com/0515000054730D3A6737B37AED092F66'
      flash :'http://static.youku.com/v1.0.0485/v/swf/loader.swf'
      summary:'诱骗少女奸杀案”二审维持原判 丈夫死刑妻子无期 141124'
    }]