# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# User.create!(name:  "admin", email: "bui.van.duong2@framgia.com",
#   password: "123456", role: 0, password_confirmation: "123456")

# 20.times do |n|
#   name  = Faker::Name.name
#   email = "account-#{n+1}@railstutorial.org"
#   password = "abc123"
#   User.create!(name:  name,
#     email: email,
#     password: password,
#     password_confirmation: password,
#     role: 1)
# end

Category.create!(name: "Toan Hoc")
Category.create!(name: "Van Hoc")
Category.create!(name: "Vat Ly")
Category.create!(name: "Hoa Hoc")
Category.create!(name: "Chuyen Co Tich")
Category.create!(name: "Qua Tang Cuoc Song")
Category.create!(name: "Truyen Cuoi")
Category.create!(name: "Sach Thieu Nhi")
Category.create!(name: "Khoa Hoc Ky Thuat")

Book.create!(title: "Không Lạ", author: " Doãn Công Dũng ",
 publish_date: "2002-02-02 00:00:00",
 number_of_page: 100,
 image: "bookstore.jpg", category_id: 1)

Book.create!(title: "Đường tới hạnh phúc",
 author: "michael scofield", publish_date:
  "2002-02-02 00:00:00", number_of_page: 100,
   category_id: 1)

Book.create!(title: "Đường tới hạnh phúc",
 author: "michael scofield", publish_date:
  "2002-02-02 00:00:00", number_of_page: 100,
   category_id: 1)

Book.create!(title: "Cảm lạnh mùa hè", author: "La Van Ba",
  publish_date: "2002-02-23 00:00:00", number_of_page: 1000,
  image: "cam_lanh_mua_he.jpg", category_id: 1)

Book.create!(title: "Lớp học quản gia",
  author: "Shitsuji-sama-no-Okiniiri",
   publish_date: "2002-02-02 00:00:00",
    number_of_page: 100,
     category_id: 1)

Book.create!(title: "Yêu Như Là Sống", author: "Tâm Phan",
  publish_date: "2002-02-23 00:00:00", number_of_page: 200,
  image: "yeu-nhu-la-song.jpg", category_id: 1)

Book.create!( title: "Ván Cờ Người", author: " Vương Thụ Hưng", publish_date: "2012-02-02 00:00:00", number_of_page: 202, image: "vanconguoi.jpg", category_id: 6)
Book.create!( title: "Người Sói Mowgli", author: "Rudyard Kipling", publish_date: "1993-02-23 00:00:00", number_of_page: 300, image: "nguoisoi.jpg", category_id: 7)
Book.create!(title: "Theo Dấu Loa Kèn", author: "Kiều Bích Hậu", publish_date: "2012-03-02 00:00:00", number_of_page: 222, image: "Book-Centre-Trieste_Sono-Architects_dezeen_sqa.jpg", category_id: 6)
Book.create!(title: "Khám Phá Bí Mật Ở Trong Nhà Gấu Con", author: " Françoise Le Glohaec ", publish_date: "2002-02-02 00:00:00", number_of_page: 101, image: "6_kham_pha_bi_mat_o_hang_nha_gau_con.jpg", category_id: 7)
Book.create!(title: "qua tang", author: "cuoc song", publish_date: "2002-02-02 00:00:00", number_of_page: 1000, image: "cam_lanh_mua_he.jpg", category_id: 1)


Book.create!(title: "Không Lạ", author: " Doãn Công Dũng ",
 publish_date: "2002-02-02 00:00:00",
 number_of_page: 100,
 image: "bookstore.jpg", category_id: 1)

Book.create!(title: "Đường tới hạnh phúc",
 author: "michael scofield", publish_date:
  "2002-02-02 00:00:00", number_of_page: 100,
   category_id: 1)

Book.create!(title: "Đường tới hạnh phúc",
 author: "michael scofield", publish_date:
  "2002-02-02 00:00:00", number_of_page: 100,
   category_id: 1)

Book.create!(title: "Cảm lạnh mùa hè", author: "La Van Ba",
  publish_date: "2002-02-23 00:00:00", number_of_page: 1000,
  image: "cam_lanh_mua_he.jpg", category_id: 1)

Book.create!(title: "Lớp học quản gia",
  author: "Shitsuji-sama-no-Okiniiri",
   publish_date: "2002-02-02 00:00:00",
    number_of_page: 100,
     category_id: 1)

Book.create!(title: "Yêu Như Là Sống", author: "Tâm Phan",
  publish_date: "2002-02-23 00:00:00", number_of_page: 200,
  image: "yeu-nhu-la-song.jpg", category_id: 1)

Book.create!( title: "Ván Cờ Người", author: " Vương Thụ Hưng", publish_date: "2012-02-02 00:00:00", number_of_page: 202, image: "vanconguoi.jpg", category_id: 6)
Book.create!( title: "Người Sói Mowgli", author: "Rudyard Kipling", publish_date: "1993-02-23 00:00:00", number_of_page: 300, image: "nguoisoi.jpg", category_id: 7)
Book.create!(title: "Theo Dấu Loa Kèn", author: "Kiều Bích Hậu", publish_date: "2012-03-02 00:00:00", number_of_page: 222, image: "Book-Centre-Trieste_Sono-Architects_dezeen_sqa.jpg", category_id: 6)
Book.create!(title: "Khám Phá Bí Mật Ở Trong Nhà Gấu Con", author: " Françoise Le Glohaec ", publish_date: "2002-02-02 00:00:00", number_of_page: 101, image: "6_kham_pha_bi_mat_o_hang_nha_gau_con.jpg", category_id: 7)
Book.create!(title: "qua tang", author: "cuoc song", publish_date: "2002-02-02 00:00:00", number_of_page: 1000, image: "cam_lanh_mua_he.jpg", category_id: 1)


Book.create!(title: "Không Lạ", author: " Doãn Công Dũng ",
 publish_date: "2002-02-02 00:00:00",
 number_of_page: 100,
 image: "bookstore.jpg", category_id: 1)

Book.create!(title: "Đường tới hạnh phúc",
 author: "michael scofield", publish_date:
  "2002-02-02 00:00:00", number_of_page: 100,
   category_id: 1)

Book.create!(title: "Đường tới hạnh phúc",
 author: "michael scofield", publish_date:
  "2002-02-02 00:00:00", number_of_page: 100,
   category_id: 1)

Book.create!(title: "Cảm lạnh mùa hè", author: "La Van Ba",
  publish_date: "2002-02-23 00:00:00", number_of_page: 1000,
  image: "cam_lanh_mua_he.jpg", category_id: 1)

Book.create!(title: "Lớp học quản gia",
  author: "Shitsuji-sama-no-Okiniiri",
   publish_date: "2002-02-02 00:00:00",
    number_of_page: 100,
     category_id: 1)

Book.create!(title: "Yêu Như Là Sống", author: "Tâm Phan",
  publish_date: "2002-02-23 00:00:00", number_of_page: 200,
  image: "yeu-nhu-la-song.jpg", category_id: 1)

Book.create!( title: "Ván Cờ Người", author: " Vương Thụ Hưng", publish_date: "2012-02-02 00:00:00", number_of_page: 202, image: "vanconguoi.jpg", category_id: 6)
Book.create!( title: "Người Sói Mowgli", author: "Rudyard Kipling", publish_date: "1993-02-23 00:00:00", number_of_page: 300, image: "nguoisoi.jpg", category_id: 7)
Book.create!(title: "Theo Dấu Loa Kèn", author: "Kiều Bích Hậu", publish_date: "2012-03-02 00:00:00", number_of_page: 222, image: "Book-Centre-Trieste_Sono-Architects_dezeen_sqa.jpg", category_id: 6)
Book.create!(title: "Khám Phá Bí Mật Ở Trong Nhà Gấu Con", author: " Françoise Le Glohaec ", publish_date: "2002-02-02 00:00:00", number_of_page: 101, image: "6_kham_pha_bi_mat_o_hang_nha_gau_con.jpg", category_id: 7)
Book.create!(title: "qua tang", author: "cuoc song", publish_date: "2002-02-02 00:00:00", number_of_page: 1000, image: "cam_lanh_mua_he.jpg", category_id: 1)

Book.create!(title: "Không Lạ", author: " Doãn Công Dũng ",
 publish_date: "2002-02-02 00:00:00",
 number_of_page: 100,
 image: "bookstore.jpg", category_id: 1)

Book.create!(title: "Đường tới hạnh phúc",
 author: "michael scofield", publish_date:
  "2002-02-02 00:00:00", number_of_page: 100,
   category_id: 1)

Book.create!(title: "Đường tới hạnh phúc",
 author: "michael scofield", publish_date:
  "2002-02-02 00:00:00", number_of_page: 100,
   category_id: 1)

Book.create!(title: "Cảm lạnh mùa hè", author: "La Van Ba",
  publish_date: "2002-02-23 00:00:00", number_of_page: 1000,
  image: "cam_lanh_mua_he.jpg", category_id: 1)

Book.create!(title: "Lớp học quản gia",
  author: "Shitsuji-sama-no-Okiniiri",
   publish_date: "2002-02-02 00:00:00",
    number_of_page: 100,
     category_id: 1)

Book.create!(title: "Yêu Như Là Sống", author: "Tâm Phan",
  publish_date: "2002-02-23 00:00:00", number_of_page: 200,
  image: "yeu-nhu-la-song.jpg", category_id: 1)

Book.create!( title: "Ván Cờ Người", author: " Vương Thụ Hưng", publish_date: "2012-02-02 00:00:00", number_of_page: 202, image: "vanconguoi.jpg", category_id: 6)
Book.create!( title: "Người Sói Mowgli", author: "Rudyard Kipling", publish_date: "1993-02-23 00:00:00", number_of_page: 300, image: "nguoisoi.jpg", category_id: 7)
Book.create!(title: "Theo Dấu Loa Kèn", author: "Kiều Bích Hậu", publish_date: "2012-03-02 00:00:00", number_of_page: 222, image: "Book-Centre-Trieste_Sono-Architects_dezeen_sqa.jpg", category_id: 6)
Book.create!(title: "Khám Phá Bí Mật Ở Trong Nhà Gấu Con", author: " Françoise Le Glohaec ", publish_date: "2002-02-02 00:00:00", number_of_page: 101, image: "6_kham_pha_bi_mat_o_hang_nha_gau_con.jpg", category_id: 7)
Book.create!(title: "qua tang", author: "cuoc song", publish_date: "2002-02-02 00:00:00", number_of_page: 1000, image: "cam_lanh_mua_he.jpg", category_id: 1)
