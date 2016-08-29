/*
 The modules in this gruntfile are organized alphabetically from top to bottom.  Each module has corresponding notes.
 */


/*jslint node: true */
'use strict';

module.exports = function(grunt){
    // load all grunt tasks matching the ['grunt-*', '@*/grunt-*'] patterns
    require('load-grunt-tasks')(grunt);

    //these define the folders and files that are watched by the "grunt dev" command
    var watchFiles = {
        mainJs: [
            'js/**/*.js'
        ],
        baseSass: [
            'sass/app.base.scss',
            'sass/lib/**/*.scss'
        ],
        mainSass: [
            'sass/**/*.scss',
            '!sass/app.base.scss',
            '!sass/lib/**/*.scss'
        ],
        handlebars: [
            'handlebars/**/*.hbs'
        ],
        images: [
            'assets/images/**/*'
        ]
    };
    grunt.initConfig({
        /*
         Copies assets into the build folder
         https://github.com/gruntjs/grunt-contrib-copy
         */
        copy :{
            fonts: {
                expand: true,
                src: [
                    'assets/fonts/**'
                ],
                dest: 'build/assets/fonts/',
                flatten: true,
                filter: 'isFile'
            }
        },
        /*
         Precompiles handlebars templates for faster rendering.  Handlebars template names are based off of file names
         https://github.com/gruntjs/grunt-contrib-handlebars
         */
        handlebars: {
            compile: {
                src: watchFiles.handlebars,
                dest: 'build/app.handlebars.min.js'
            },
            options: {
                namespace: 'Handlebars.templates',
                processName: function(filePath) {
                    var pathPieces = filePath.split('/'),//get filename from path
                        filePieces = pathPieces[pathPieces.length-1].split('.');//return name of file without extension
                    return filePieces[0];
                }
            }
        },
        /*
         Minifies image files and moves them to the build folder
         https://github.com/gruntjs/grunt-contrib-imagemin
         */
        imagemin: {
            default: {
                files: [{
                    expand: true,
                    cwd: 'assets/images/',// Src matches are relative to this path
                    src: ['**/*.{png,jpg,gif}'],// Actual patterns to match
                    dest: 'build/assets/images/'// Destination path prefix
                }]
            }
        },
        /*
         Validates JavaScript syntax before compiling.
         Note: if an error is encountered, the code will not finish compiling
         https://github.com/gruntjs/grunt-contrib-jshint
         */
        jshint: {
            main: {
                src: [
                    watchFiles.mainJs
                ],
                options: {
                    jshintrc: true
                }
            }
        },
        /*
         Adds vendor-specific prefixes (where needed) to our compiled CSS
         https://github.com/nDmitry/grunt-postcss
         */
        postcss: {
            base: {
                options: {
                    map: true, // inline sourcemaps,
                    processors: [
                        require('autoprefixer')({browsers: 'last 2 versions'}) // add vendor prefixes
                    ]
                },
                dist: {
                    src: 'build/app.base.min.css'
                }
            },
            main: {
                options: {
                    map: true, // inline sourcemaps,
                    processors: [
                        require('autoprefixer')({browsers: 'last 2 versions'}) // add vendor prefixes
                    ]
                },
                dist: {
                    src: 'build/app.main.min.css'
                }
            }
        },
        /*
         Compiles Sass to CSS
         https://github.com/gruntjs/grunt-contrib-sass
         */
        sass: {
            base: {
                files: {
                    'build/app.base.min.css': 'sass/app.base.scss'
                },
                options: {
                    style: 'compressed',
                    trace: true
                }
            },
            main: {
                files: {
                    'build/app.main.min.css': 'sass/app.main.scss'
                },
                options: {
                    style: 'compressed',
                    trace: true
                }
            }
        },
        /*
         Concatenates and compresses our JavaScript into a single file
         https://github.com/gruntjs/grunt-contrib-uglify
         */
        uglify: {
            base: {
                files: {
                    'build/app.base.min.js': [
                        'bower_components/jquery/dist/jquery.min.js',
                        'bower_components/bluebird/js/browser/bluebird.min.js',
                        'bower_components/store-js/store.min.js',
                        'bower_components/handlebars/handlebars.min.js',
                        'bower_components/moment/min/moment.min.js',
                        'bower_components/velocity/velocity.min.js',
                        'bower_components/velocity/velocity.ui.min.js',
                        'bower_components/slick-carousel/slick/slick.min.js'
                    ]
                },
                options: {
                    banner: '/*! <%= grunt.template.today("yyyy-mm-dd") %> */\n',
                    sourceMap: true,
                    preserveComments: false,
                    compress: true,
                    mangle: false
                }
            },
            main: {
                files: {
                    'build/app.main.min.js': [
                        'js/app.js',
                        'js/lib/*.js',
                        'js/modules/*.js',
                        'js/**/*.js'
                    ]
                },
                options: {
                    banner: '/*! <%= grunt.template.today("yyyy-mm-dd") %> */\n',
                    sourceMap: true,
                    preserveComments: 'some',
                    mangle: false
                }
            }
        },
        /*
         Watches for file changes and then runs commands upon change
         https://github.com/gruntjs/grunt-contrib-watch
         */
        watch: {
            baseSass: {
                files: watchFiles.baseSass,
                tasks: ['sass:base','postcss:base'],
                options: {
                    livereload: true
                }
            },
            mainSass: {
                files: watchFiles.mainSass,
                tasks: ['sass:main','postcss:main'],
                options: {
                    livereload: true
                }
            },
            handlebars: {
                files: watchFiles.handlebars,
                tasks: ['handlebars:compile'],
                options: {
                    livereload: true
                }
            },
            mainJs: {
                files: watchFiles.mainJs,
                tasks: ['jshint:main','uglify:main'],
                options: {
                    livereload: true
                }
            },
            images: {
                files: watchFiles.images,
                tasks: ['newer:imagemin'],
                options: {
                    livereload: true
                }
            }
        }
    });

    // Development task.  After started, will monitor files for changes and then recompile as needed
    grunt.registerTask('dev', [
        'newer:copy',
        'newer:imagemin',
        'newer:handlebars:compile',
        'newer:uglify',
        'newer:sass',
        'postcss',
        'watch'
    ]);

    // Build task. For initializing environment after clone or for deploy in a remote environment
    grunt.registerTask('build', [
        'newer:copy',
        'newer:imagemin',
        'handlebars:compile',
        'uglify',
        'sass',
        'postcss'
    ]);

};