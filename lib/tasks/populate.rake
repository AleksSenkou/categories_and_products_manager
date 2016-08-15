require "colorize"
require "faker"
require "populator"

CATEGORIES_COUNT = 10
PRODUCTS_COUNT = 30

namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    clean_database
    puts 'Making categories'.cyan
    make_categories
    puts 'Done'.green
  end
end

def clean_database
  [Category, Product].each(&:delete_all)
end

def make_categories
  Category.populate CATEGORIES_COUNT do |c|
    c.name = Faker::Lorem.word
  end
end
