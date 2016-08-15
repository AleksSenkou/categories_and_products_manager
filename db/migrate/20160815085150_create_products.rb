class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.references :category, index: true, foreign_key: true
    end
  end
end
