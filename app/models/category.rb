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

  validates :name, presence: true, uniqueness: true, length: { maximum: 40 }
end
