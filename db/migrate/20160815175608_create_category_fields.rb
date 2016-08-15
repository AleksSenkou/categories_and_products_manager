class CreateCategoryFields < ActiveRecord::Migration
  def change
    create_table :category_fields do |t|
      t.string :name
      t.string :field_type
      t.belongs_to :category, index: true

      t.timestamps null: false
    end
  end
end
