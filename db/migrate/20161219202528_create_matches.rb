class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.references :shiba_one, null: false
      t.references :shiba_two, null: false
      t.references :creator, null: false
      t.references :winner
      t.references :loser
      t.boolean    :video, default: false

      t.timestamps
    end
  end
end
