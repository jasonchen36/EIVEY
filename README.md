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
Use Ubuntu 14 (tested with 14.04.5)

### Apache ###
PHP and Ruby are both run using Apache.  The config is located locally in /devops/apache.conf and remotely in /etc/apache2/sites-enabled/eivey.ca.conf  [Passenger](https://www.phusionpassenger.com/library/) is used to run Sharetribe and is part of the Apache config

### ImageMagick ###
Be sure to install [ImageMagick](http://www.imagemagick.org/script/index.php) on Ubuntu 14 using apt-get.  Installing it via source tarball means that it misses the convert and identify commands' config needed for images  
[Help Docs](https://www.digitalocean.com/community/questions/rails-4-paperclip-imagemagick-content-type-error-for-images)

### Sharetribe Delayed Worker ###
[Monit](https://mmonit.com/) is used to keep the delayed workers alive.  The config is located locally in /devops/monit.conf and remotely in /etc/monit/conf.d/delayedjob.conf. Logs are located in /var/log/monit.log.  The core program configuration has been modified and is located locally in /devops/monitrc and remotely in /etc/monit/monitrc

Monit can be started using

```
sudo service monit start all
```

You can check Monit's status using

```
sudo service monit status
```

and check the status of the delayed worker using

```
ps aux | grep "delay"
```


### Ruby ###
[Rbenv](https://github.com/rbenv/rbenv) is used to manage the Ruby version locally and on the remote server.  This is to prevent permissions issues and version conflicts between gems


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
bower install
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


### Sharetribe ###

Enter the Sharetribe directory

```
cd shop
```

Follow the instructions listed on the [Sharetribe ReadMe](https://github.com/sharetribe/sharetribe)

Run foreman once to generate the webpack folder in /shop/app/assets/webpack

```
foreman start -f Procfile.static
```

* Note, after generating the webpack folder, do not start the app using foreman.  Instead, change your shop/Passengerfile.json environment to be "development" and start the app using Passenger:

* Note, you will probably want to comment out/remove hardcoded references to "/shop" like in /shop/config/application.rb and update the "prefix" variable to point to your local php instance in files like shop/app/views/layouts/_head.haml and shop/app/views/layouts/_footer.haml.  Just be sure not to check those changes into Git!

```
bundle exec passenger start
```

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
