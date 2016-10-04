class BookStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  enum status: [:read, :reading]

  scope :favorite, -> user {
    where user_id: user.id, is_favourite: true
  }

  scope :readed, -> user, status {
    where user_id: user.id, reading_status: status
  }
end
