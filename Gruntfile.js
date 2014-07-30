module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    watch: {
      options: {
        livereload: true,
      },
      any: {
        files: ['**/*.coffee','**/*.html','**/*.css','!**/_site/**'],
        tasks: ['coffee','jekyll:dev']
      }
    },
    coffee: {
      compile: {
        files: {
          'app.js': 'app.coffee', // 1:1 compile
        }
      }
    },
    jekyll: {
      server: {
        options: {
          config: '_config.yml',
          serve: true,
          server_port : 8000,
        }
      },
      dev: {
        options: {
          config: '_config.yml'
        }
      }
    }
  });

  require('load-grunt-tasks')(grunt);

  grunt.registerTask('default', ['coffee','jekyll:dev','watch']);

  grunt.registerTask('serve', ['coffee','jekyll:server']);

};
