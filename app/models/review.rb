class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  has_many :comments

  validate :check_rating

  private
  def check_rating
    if rating.to_i < 1 || rating.to_i > 5
      errors.add :rating, I18n.t("model.reivew.validate_rating")
    end
  end
end
