class CreateShibas < ActiveRecord::Migration[5.0]
  def change
    create_table :shibas do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.references :creator, null:false

      t.timestamps
    end
  end
end
