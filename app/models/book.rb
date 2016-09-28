class Book < ActiveRecord::Base
  belongs_to :category
  has_many :book_status, dependent: :destroy
  has_many :reviews, dependent: :destroy

  mount_uploader :image, AvatarUploader

  validates :title, presence: true
  validate :publish_date_validate
  validates :author, presence: true
  validates :number_of_page, presence: true
  validate :image_size

  def rate_average
    reviews.average(:rating).to_f if reviews.any?
  end

  private
  def image_size
    if image.size > Settings.admin.books.image_size
      errors.add(:image, I18n.t("models.book.validate_picture"))
    end
  end

  def publish_date_validate
    if publish_date.presence.nil?
      errors.add(:publish_date, I18n.t("models.book.invalidate_publish_date"))
    end
  end
end
