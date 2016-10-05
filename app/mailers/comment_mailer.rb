class CommentMailer < ApplicationMailer
  def send_email_comment_on_review comment
    @comment = comment
    mail to: @comment.review.user.email, subject: t("comments.new_comment")
  end
end
