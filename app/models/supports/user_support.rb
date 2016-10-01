class Supports::UserSupport
  attr_reader :user

  def initialize user
    @user = user
  end

  def reads
    readed BookStatus.statuses[:read]
  end

  def readings
    readed BookStatus.statuses[:reading]
  end

  def favorites
    @user.book_status.favorites
  end

  private
  def readed status
    @user.book_status.readed(status).includes(:book)
  end
end
