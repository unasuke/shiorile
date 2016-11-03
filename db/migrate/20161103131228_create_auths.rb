class CreateAuths < ActiveRecord::Migration[5.0]
  def change
    create_table :auths do |t|
      t.references :user, foreign_key: true
      t.string :provider
      t.string :uid
      t.string :screen_name
      t.string :name

      t.timestamps
    end
  end
end
