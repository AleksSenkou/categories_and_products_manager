# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#  price       :integer
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#

class Product < ActiveRecord::Base
  belongs_to :category, counter_cache: true

  validates :name, presence: true, length: { in: 2..60 }
  validates :price, presence: true, numericality: { greater_than: 0 }
end
