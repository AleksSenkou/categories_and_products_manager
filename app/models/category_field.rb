# == Schema Information
#
# Table name: category_fields
#
#  id          :integer          not null, primary key
#  name        :string
#  field_type  :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_category_fields_on_category_id  (category_id)
#

class CategoryField < ActiveRecord::Base
  FIELD_TYPES = %w(text check_box number)

  belongs_to :category
end
