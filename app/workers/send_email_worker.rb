class SendEmailWorker
  include Sidekiq::Worker

  def perform request_id
    request = Request.find_by id: request_id
    RequestMailer.send_email_accepted_request(request).deliver_now
  end
end
