# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#  price       :integer
#  properties  :text
#
# Indexes
#
#  index_products_on_category_id  (category_id)
#

class Product < ActiveRecord::Base
  belongs_to :category, counter_cache: true
  has_many :fields, through: :category
  serialize :properties, Hash

  with_options if: :general_info_step? do |product|
    product.validates :name, presence: true, length: { in: 2..60 }
    product.validates :price, presence: true, numericality: { greater_than: 0 }
  end

  attr_writer :current_step

  def general_info_step?
    current_step == 'general_info'
  end

  def next_step
    @current_step = steps[steps.index(current_step) + 1]
  end

  def previous_step
    @current_step = steps[steps.index(current_step) - 1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end

  def current_step
    @current_step || steps.first
  end

  def steps
    %w(general_info select_category category_info)
  end
end
