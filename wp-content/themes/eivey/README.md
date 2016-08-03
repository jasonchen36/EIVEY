# ----- Overview ----- #
To use this project you need to do the following:

1. Clone this repo
2. Install Dependencies
3. Compile build files

This project is built upon a Grunt workflow (Gruntfile.js) and uses NPM and Bower as grunt-specific and frontend package managers, respectively.  We set fixed version numbers explicitly for each both NPM and Bower packages so that all packages have been tested to work together upon cloning from Git.  Update individual packages with this in mind.

## Clone Repo ##
```
#!bash
git clone https://{{username}}@bitbucket.org/ellefsontech/ellefsontech.frontend.git {{projectroot}}
```


## Install Dependencies ##
```
#!bash
cd {{projectroot}}
npm install
bower install
```

## Compile Build Files ##
```
#!bash
cd {{projectroot}}
grunt build
```


# ----- Running a Development Environment ----- #
After compiling the build files run:
```
#!bash
cd {{projectroot}}
grunt dev
```

# ----- Modules List ----- #

## Bluebird (Promises) ##
* http://bluebirdjs.com/
* JS global variables Promise and P (alias for Promise) are available
* Supports IE7+ http://bluebirdjs.com/docs/install.html

## MomentJS (Timestamps & Dates) ##
* http://momentjs.com/
* JS global function moment() is available
* Supports IE8+ http://momentjs.com/docs/

## StoreJS (Cookies) ##
* https://github.com/marcuswestin/store.js/
* JS global variable store is available
* Supports IE6+ https://github.com/marcuswestin/store.js/#support-browsers

## Handlebars (HTML Templating) ##
* http://handlebarsjs.com/
* JS global variable Handlebars is available
* Supports IE6+ https://github.com/wycats/handlebars.js

## Velocity (Animations) ##
* http://julian.com/research/velocity/
* velocity() method available on jQuery objects
* Supports IE8+ http://julian.com/research/velocity/#dependencies

## Slick (Carousel) ##
* http://kenwheeler.github.io/slick/
* slick() method available on jQuery objects
* Supports IE8+ https://github.com/kenwheeler/slick/issues/806

## Susy (Grid Framework) ##
* http://susy.oddbird.net/
* Intro doc https://css-tricks.com/build-web-layouts-easily-susy/
* Supports IE6+ https://groups.google.com/forum/#!topic/compass-users/10wavrSly_o


# ----- Style Guides ----- #
The following style guides are not intended as definitive rules but they are benchmarks to work towards.  It is important to maintain a consistent coding style throughout the project even if you deviate from the style guides.

* CSS https://docs.google.com/document/d/1ix1u56_wGyxvqTwcj_plzoNykVilFOqfWcpEgJ8aO6M/edit?usp=sharing
* HTML https://docs.google.com/document/d/1QjqasWbet-tcnxObvW7zwNq0Kfiiu2yM6k20tkqf0TY/edit?usp=sharing
* JavaScript https://docs.google.com/document/d/1jRybsfXCGTtNRbiM9Kyqnnw4wgsHKPICOQ1OWNQvV4I/edit?usp=sharing