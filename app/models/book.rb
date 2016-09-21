class Book < ActiveRecord::Base
  belongs_to :category
  has_many :marks, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
