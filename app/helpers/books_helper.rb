module BooksHelper
  def get_picture book
    image_url = book.image.present? ? book.image : Settings.admin.books.url
  end
end
