set :output, "#{path}/log/cron_log.log"

every 1.minute do
  command "echo 'delete accepted request'"
  rake "delete:old_request"
end
