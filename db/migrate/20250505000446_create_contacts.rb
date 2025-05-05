class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email, null: false
      # only supported by postgresql
      t.string :tags, array: true, default: []

      t.timestamps
    end

    add_index :contacts, :email, unique: true
    add_index :contacts, :tags, using: :gin
  end
end
