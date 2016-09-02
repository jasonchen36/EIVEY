# EIVEY #

## Description ##

* This is a peer-to-peer marketplace CMS forked from [Sharetribe](https://github.com/sharetribe/sharetribe) core.

## Software Architecture (High Level) ##

* Built upon Ruby and Rails and MySQL

## How to Set Up a Dev Environment ##

* Follow the instructions listed on the [Sharetribe ReadMe](https://github.com/sharetribe/sharetribe)
    * If needed, upgrade your Ruby version using [these](https://gorails.com/setup/osx/10.11-el-capitan) instructions. 
* Use a FQDN like dev.eivey.com to avoid problems caused by localhostw
* Update your config/config.yml config file with config/config.dev.yml for development

### MySql ###
* "Can't connect to local MySQL server through socket"
    * If you are using AMPPS, run this command
    * sudo ln -s /Applications/AMPPS/var/mysql.sock /tmp/mysql.sock

### Rake (Rails) ###
* List all available tasks
    * bundle exec rake --tasks
* Generate missing CSS files or rebuild after Sass modifications
    * bundle exec rake sharetribe:generate_customization_stylesheets_immediately
    
### Sphinx ###
* Indexing issues?
   * [Sharetribe response](https://github.com/sharetribe/sharetribe/issues/2334)

## How to Deploy (Wordpress) ##
*checkout code
git clone {repo url} html
sudo chown -R ubuntu:ubuntu  html/

*install node
sudo apt-get update
sudo apt-get install nodejs
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get install npm

*install bower & grunt
sudo npm install -g bower grunt-cli

*install ruby & sass
sudo apt-get install ruby
sudo gem install sass

*on every deploy
cd frontend/
npm install
bower install
grunt build



UPDATE `table_name` SET `field_name` = replace(same_field_name, 'old address', 'new address')

run on:
wp_options table on option_value
wp_postmeta table on meta_value
wp_posts table on post_content

enable mod rewrite on the server: https://www.digitalocean.com/community/tutorials/how-to-set-up-mod_rewrite-for-apache-on-ubuntu-14-04
