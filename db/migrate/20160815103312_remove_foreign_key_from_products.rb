class RemoveForeignKeyFromProducts < ActiveRecord::Migration
  def change
    remove_foreign_key :products, :categories
  end
end
