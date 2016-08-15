require "colorize"
require "faker"
require "populator"

CATEGORIES_COUNT = 10
PRODUCTS_COUNT = 20

namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    clean_database
    puts 'Making categories'.cyan
    make_categories
    puts 'Making products'.cyan
    make_products
    puts 'Done'.green
  end
end

def clean_database
  [Category, Product].each(&:delete_all)
end

def make_categories
  Category.populate CATEGORIES_COUNT do |c|
    c.name = Faker::Lorem.word
    c.products_count = 0
  end
end

def make_products
  categories_ids = Category.ids

  PRODUCTS_COUNT.times do
    Product.create(
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price,
      category_id: categories_ids.sample
    )
  end
end
