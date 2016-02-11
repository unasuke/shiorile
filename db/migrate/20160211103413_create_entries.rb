class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.integer :bookmark_id
      t.string :title
      t.string :url

      t.timestamps
    end
    add_index :entries, :bookmark_id
  end
end
