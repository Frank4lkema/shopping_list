class AddCollectedToListProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :list_products, :collected, :boolean
  end
end
