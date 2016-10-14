God.watch do |w|
  w.name = "delayed_job_dev"
  w.start = "RAILS_ENV=development /var/www/dev.eivey.ca/shop/script/delayed_job start"
  w.keepalive
end