# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_fb915499a4  (category_id => categories.id)
#

class Product < ActiveRecord::Base
  belongs_to :category, counter_cache: true
end
