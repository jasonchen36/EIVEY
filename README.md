# EIVEY #

## Description ##

This site is built using two different CMSs: [WordPress](https://wordpress.org/) and [Sharetribe](https://github.com/sharetribe/sharetribe).  

The WordPress site is up to date with the latest WordPress version and plugin dependencies.

The Sharetribe site is forked from the Sharetribe core as of 08/2016 and no longer receives updates from the master repository.


## Software Architecture (High Level) ##

The WordPress site is built upon PHP.
The Sharetribe site is built upon Ruby on Rails and is installed in a subdirectory of the WordPress site, /shop.

An Ubuntu server is used for production


## Devops ##

### Ubuntu ###
Use Ubuntu 14 (tested with 14.04.5) - install on AWS (see links)

We need to install a number of things, so make sure ubuntu apt-get is updated.

apt-get update


### Apache ###
Install Apache. 
```
sudo apt-get install apache
```

PHP and Rails are both run using Apache.  The config is located locally in /devops/apache.conf and remotely in /etc/apache2/sites-enabled/eivey.ca.conf  [Passenger](https://www.phusionpassenger.com/library/) is used to run Sharetribe and is part of the Apache config

### PHP ###

 (TODO: version?)

TODO: line to install PHP and dependencies in Ubuntu

### MYSQL adapter ###
make sure you have mysql adapter
```
apt-get install libmysqlclient-dev
```
If you don't you will run into issues with bundle

### Wordpress ###

TODO: how to set up wordpress

### ImageMagick ###
install imagemagick
```
sudo apt-get install imagemagick
```

Be sure to install [ImageMagick](http://www.imagemagick.org/script/index.php) on Ubuntu 14 using apt-get.  Installing it via source tarball means that it misses the convert and identify commands' config needed for images  
[Help Docs](https://www.digitalocean.com/community/questions/rails-4-paperclip-imagemagick-content-type-error-for-images)

### Sphinx ###
TODO: do we need sphinx?
```
sudo apt-get install sphinxsearch
```
### Git ###
Install git
```
sudo apt-get install git
```

### Ruby ###
The version of ruby for this sharetribe is 2.3.1
[Rbenv](https://github.com/rbenv/rbenv) is used to manage the Ruby version locally and on the remote server.  This is to prevent permissions issues and version conflicts between gems

other install link:
https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-14-04

Add rbenv to your profile, and then add it to yoru bash profile so it is loaded on start 
(NOTE: This is for ubuntu desktop.  .bashrc is startup script for this OS.  If you are using a different version of linux, you may need to change .bashrc in the following commands to .bash_profile)

Rbenv has a ton of dependencies.  install them (I hope you trust this line!)
```
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
```

Now that you have dependencies, get rbenv
```
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source .bashrc
```

NOw that rbenv is installed, install rbenv build (for rbenv install command)

```
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

```

Great! now we can finally install Ruby

```
rbenv install -v 2.3.1
```
Check that ruby is installed, and Set your global to use ruby 2.3.1
```
ruby -v
rbenv global 2.3.1
```

### Sharetribe Delayed Worker ###

Install god
```
gem install god
```

[God](http://godrb.com/) is used to keep the delayed workers alive.  The config is located in /shop/script/delayed_job.god.

First start god by loading the appropriate config into it
```
god -c script/delayed_job.god
```

Then start the delayed job using

```
god start delayed_job
```

You can check God's status using

```
god status
```

and check the status of the delayed worker using

```
ps aux | grep "delay"
```


### Add SSH keys so that you can clone repo ###
make sure your ssh keys are added to the repo, so we can pull the repo onto this remote server.
NOTE: if this is your personal computer, you should use your existing credentials


https://help.github.com/articles/generating-an-ssh-key/
NOTE: You will need eivey.web admin permissions to add your key to the repo.

(from instructions above, assuming ssh keys not generated)

```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

start ssh agent in background
```
eval "$(ssh-agent -s)"
```

add key
```
ssh-add ~/.ssh/id_rsa
```

use your text editor to copy the key to your clipboard, then paste it in the project on bitbucket as s deploy key.
```
vim ~/.ssh/id_rsa.pub
```
Go to bitbucket and find the eivey.web project (as admin)
```
go to settings>deployment keys >add key
```
paste that key into the new key and name it appropriately


### Clone repo to /var/www ###

clone the repo into your folder.

```
git clone git@bitbucket.org:ellefsontech/eivey.web.git
```

rename that cloned repo to a more descriptive one, and move the folder into your apache www folder, which should be /var/www
```
mv eivey.web dev.eivey.web
sudo mv dev.eivey.web /var/www
```




## How to Set Up a Dev Environment ##

### Common ###

Clone the repo 

```
git clone https://bitbucket.org/ellefsontech/eivey.web dev.eivey.com
cd dev.eivey.com
```

Generate frontend files

```
cd frontend
npm install
./node_modules/.bin/bower install
grunt build
cd ../
```

Start Grunt workflow

```
cd frontend
grunt dev
cd ../
```

### WordPress ###

Create /wp-config.php and update with the correct database credentials.

```
cp wp-config-sample.php wp-config.php
```

### Sharetribe installs ###

go to the sharetribe folder
```
cd shop
```

install bundler

```
gem install bundler
```

install sphinx
```
sudo apt-get install sphinxsearch
```

install node
```
sudo apt-get install node
sudo apt-get install npm
```

Install n globally (node version manager)
```
[sudo] npm install n -g
```

use the accepted version of node
```
[sudo] n 6.1
node -v
```
Version should show v6.1.0 if not, restart your terminal.
Install npm packages
```
npm install
```
If this fails, delete your node_modules folder, make sure you have the right version of node, and try again.


### Sharetribe ###

Enter the Sharetribe directory

```
cd shop
```

Follow the instructions listed on the [Sharetribe ReadMe](https://github.com/sharetribe/sharetribe)
TODO: We need to break this file down and list here, as we are no longer using everything.  


Run foreman once to generate the webpack folder in /shop/app/assets/webpack

```
foreman start -f Procfile.static
```

* Note, after generating the webpack folder, do not start the app using foreman.  Instead, change your shop/Passengerfile.json environment to be "development" and start the app using Passenger:

* Note, you will probably want to comment out/remove hardcoded references to "/shop" like in /shop/config/application.rb and update the "prefix" variable to point to your local php instance in files like shop/app/views/layouts/_head.haml and shop/app/views/layouts/_footer.haml.  Just be sure not to check those changes into Git!

```
bundle exec passenger start
```

### Config files ###
TODO: make sure all the config changes are listed here.
Make sure that the following are updated:
In shop':
/config/database.yml (use database.yml.example as example)
/config/paypal_adaptive.yml
/config/paypal_payments.yml
/Passenger.json

### Sharetribe site ###

WordPress will be available at [dev.eivey.com](http://dev.eivey.com)

Sharetribe will be available at [localhost:3000](http://localhost:3000)

#### Sharetribe Delayed Worker ####
Run the following to daemonize the worker (update the ENV variable to the appropriate environment).  This relies on the [daemons](https://github.com/thuehlinger/daemons) gem

```
RAILS_ENV=production script/delayed_job start
```

You can check the status of the task using

```
ruby script/delayed_job status
```


#### Debugging ####

You can debug Sharetribe using [Pry](http://pryrepl.org/) and [Pry Remote](https://github.com/mon-ouie/pry-remote/)

Anywhere in Ruby that you want to add a breakpoint, add

```
binding.remote_pry
```

In your console window, you should see

```
App 74317 stdout: [pry-remote] Waiting for client on druby://127.0.0.1:9876
```

Open a new terminal window and connect with the debugger using

```
pry-remote
```

## How to Deploy ##

Update from Git

```
cd dev.eivey.com
git pull
```

Generate common frontend files

* Note, do not run with "sudo"!

```
cd frontend
npm install
bower install
grunt build
cd ../
```

Install Sharetribe dependencies

* Note, do not run with "sudo"!

```
cd shop
bundle install
cd ../
```

Generate Sharetribe CSS manually
   
```
cd shop
bundle exec rake sharetribe:generate_customization_stylesheets_immediately
cd ../
```

Restart Passenger

```
cd shop
passenger-config restart-app $(pwd)
cd ../
```


## General ##

### Passenger ###

Check if passenger is runnning

```
sudo /usr/sbin/passenger-memory-stats
```

### MySql ###

"Can't connect to local MySQL server through socket".  If you are using AMPPS, run:

```
sudo ln -s /Applications/AMPPS/var/mysql.sock /tmp/mysql.sock
```

### Rake (Rails) ###

List all available tasks

```
bundle exec rake --tasks
```

### Sphinx ###

Indexing issues? [Sharetribe response](https://github.com/sharetribe/sharetribe/issues/2334)
