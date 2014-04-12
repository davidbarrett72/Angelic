class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :name
      t.datetime :complete_by
      t.boolean :completed

      t.timestamps
    end
  end
end
