namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    make_users
    make_diaries
    make_products
  end
end

def make_users
  99.times do |n|
    nickname = "tester#{n + 1}"
    email = "example-#{n + 1}@example.com"
    password = 'password'
    User.create!(nickname: nickname,
                 email:    email,
                 password: password)
  end
end

def make_diaries
  50.times do
    title = Faker::Book.title
    body = Faker::Lorem.sentence(5)
    User.limit(6).each do |user|
      user.diaries.create!(title: title,
                           body: body)
    end
  end
end

def make_products
  50.times do
    name = Faker::Commerce.product_name
    price = rand(1..999) * 100
    description = Faker::Lorem.sentence(5)
    order = rand(1..9999)
    Product.create!(name: name,
                    price: price,
                    description: description,
                    order: order)
  end
end
