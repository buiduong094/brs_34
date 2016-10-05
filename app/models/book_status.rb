class BookStatus < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  enum status: [:read, :reading]

  scope :favorites, -> {
    where is_favourite: true
  }

  scope :readed, -> status {
    where reading_status: status
  }
end
