class Request < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: -> (controller, model){controller && controller.current_user}

  belongs_to :user

  enum status: [:waitting, :denied, :accepted]

  validates :book_name, presence: true, uniqueness: true

  scope :accepted, -> {where status: Request.statuses[:accepted]}
end
