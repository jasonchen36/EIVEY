God.watch do |w|
  w.name = "delayed_job_staging"
  w.start = "RAILS_ENV=development /var/www/staging.eivey.ca/shop/script/delayed_job start"
  w.keepalive
end
