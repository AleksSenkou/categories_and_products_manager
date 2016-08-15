# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  name           :string
#  products_count :integer          default(0)
#

class Category < ActiveRecord::Base
  has_many :products, dependent: :nullify
  has_many :fields, class_name: 'CategoryField' #, dependent: :destroy
  accepts_nested_attributes_for :fields, allow_destroy: true

  validates :name, presence: true, uniqueness: true, length: { in: 2..40 }
end
