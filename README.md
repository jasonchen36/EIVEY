# EIVEY #

## Description ##

This site is built using two different CMSs: [WordPress](https://wordpress.org/) and [Sharetribe](https://github.com/sharetribe/sharetribe).  

The WordPress site is up to date with the latest WordPress version and plugin dependencies.

The Sharetribe site is forked from the Sharetribe core as of 08/2016 and no longer receives updates from the master repository.

## Software Architecture (High Level) ##

The WordPress site is built upon PHP.

The Sharetribe site is built upon Ruby on Rails and is installed in a subdirectory of the WordPress site, /shop.

Both sites are run using Apache.  The config is located locally in /apache_config.txt and remotely in /etc/apache2/sites-enabled/eivey.ca.conf  [Passenger](https://www.phusionpassenger.com/library/) is used to run Sharetribe and is part of the Apache config.

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

* Note, do not start the app using foreman.  Instead, change your shop/Passengerfile.json environment to be "development" and start the app using Passenger:

```
bundle exec passenger start
```

WordPress will be available at [dev.eivey.com](http://dev.eivey.com)

Sharetribe will be available at [dev.eivey.com:3000](http://dev.eivey.com:3000)

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

```
cd frontend
npm install
bower install
grunt build
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
