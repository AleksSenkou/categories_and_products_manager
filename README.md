### Main part of the task:
```Ruby
class Product < ActiveRecord::Base
  belongs_to :category, counter_cache: true
  has_many :fields, through: :category
  serialize :properties, Hash
end

class Category < ActiveRecord::Base
  has_many :products, dependent: :nullify
  has_many :fields, class_name: 'CategoryField' #, dependent: :destroy
  accepts_nested_attributes_for :fields, allow_destroy: true
end

class CategoryField < ActiveRecord::Base
  FIELD_TYPES = %w(text check_box number)

  belongs_to :category
end
```
#### Annotation:
```
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

# Table name: categories
#
#  id             :integer          not null, primary key
#  name           :string
#  products_count :integer          default(0)
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
```
