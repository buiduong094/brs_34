namespace :delete do
  task old_request: :environment do
    puts "Delete requests accepted"
    Request.accepted.destroy_all
  end
end
