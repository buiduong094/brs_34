class BookStatus < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, model){controller && controller.current_user}

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
