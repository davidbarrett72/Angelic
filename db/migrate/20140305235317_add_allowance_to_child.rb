class AddAllowanceToChild < ActiveRecord::Migration
  def change
    add_column :children, :allowance, :decimal
    add_column :children, :image_url, :string
  end
end
