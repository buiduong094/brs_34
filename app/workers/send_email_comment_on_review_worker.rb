class SendEmailCommentOnReviewWorker
  include Sidekiq::Worker

  def perform comment_id
    comment = Comment.find_by id: comment_id
    CommentMailer.send_email_comment_on_review(comment).deliver_now
  end
end
