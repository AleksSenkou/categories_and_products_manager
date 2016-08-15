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
end
