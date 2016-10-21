RAILS_ROOT="/var/www/dev.eivey.ca/shop"
God.watch do |w|
  w.name = "delayed_job_dev"
  w.env = { 'RAILS_ENV'=>'development'}
  w.start = "RAILS_ENV=development #{RAILS_ROOT}/script/delayed_job start"
  w.stop = "RAILS_ENV=development #{RAILS_ROOT}/script/delayed_job stop"
  w.log = File.join(RAILS_ROOT,"log","eivey_delayed_job.log")
  w.dir = RAILS_ROOT
  w.pid_file = File.join(RAILS_ROOT,"tmp/pids","delayed_job.pid")
  w.keepalive
end

