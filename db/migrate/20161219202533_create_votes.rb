class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :voter, null: false
      t.references :shiba, null: false
      t.references :match, null: false

      t.timestamps
    end
  end
end
