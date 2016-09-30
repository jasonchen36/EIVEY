God.watch do |w|
  w.name = "delayed_job"
  w.start = "RAILS_ENV=production /var/www/eivey.ca/shop/script/delayed_job start"
  w.keepalive
end