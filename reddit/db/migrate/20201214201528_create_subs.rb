class CreateSubs < ActiveRecord::Migration[6.1]
  def change
    create_table :subs do |t|
      t.string :title, null: false, unique: true
      t.string :description, null: false
      t.integer :mod_id, null: false

      t.timestamps
    end
  end
end
