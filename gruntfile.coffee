#配置自动重启
module.exports = (grunt) ->
  #console.log grunt
  grunt.initConfig
    watch :
      jade :
        files : ['views/**']
        options:
          livereload : on
      js :
        files : ['resource/scripts/**','models/**/*.coffee','schemas/**/*.coffee']
        #tasks : ['jshint']
        options :
          livereload : on
    nodemon :
      dev :
        options :
          file : 'app.coffee'
          args : []
          exec: 'coffee app.coffee',
          ignoreFiles :['README.md','node_modules/**','.DS_Store']
          watchedExtensions:['coffee','js']
          watchedFolders : ['app','config']
          debug : on
          delayTime : 1
          env :
            PORT : 3000
          cmd : __dirname
    concurrent:
      tasks:['nodemon','watch']
      options:
        logConcurrentOutput : on
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-nodemon'
  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-coffee'
  grunt.option 'force', on
  grunt.registerTask 'default', ['concurrent']