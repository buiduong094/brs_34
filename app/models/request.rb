class Request < ActiveRecord::Base
  belongs_to :user

  enum status: [:waitting, :denied, :accepted]

  validates :book_name, presence: true, uniqueness: true
end
