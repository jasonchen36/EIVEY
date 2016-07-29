# EIVEY #

## Description ##

* This is a peer-to-peer marketplace CMS forked from [Sharetribe](https://github.com/sharetribe/sharetribe) core.

## Software Architecture (High Level) ##

* Built upon Ruby and Rails and MySQL

## How to Set Up a Dev Environment ##

* Follow the instructions listed on the [Sharetribe ReadMe](https://github.com/sharetribe/sharetribe)
    * If needed, upgrade your Ruby version using [these](https://gorails.com/setup/osx/10.11-el-capitan) instructions. 
    * "Can't connect to local MySQL server through socket"
        * If you are using AMPPS, run this command
        * sudo ln -s /Applications/AMPPS/var/mysql.sock /tmp/mysql.sock
* Use a FQDN like dev.eivey.com to avoid problems caused by localhost
* Update your config/config.yml config file with config/config.dev.yml for development
* Sphinx indexing issues?  [Sharetribe response](https://github.com/sharetribe/sharetribe/issues/2334)

## How to Deploy ##

* todo

