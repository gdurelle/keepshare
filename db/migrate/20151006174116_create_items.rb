class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :content
      t.integer :list_id

      t.timestamps null: false
    end
    add_foreign_key :items, :list_id
  end
end
