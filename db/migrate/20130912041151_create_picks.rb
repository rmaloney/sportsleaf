class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :pick_result
      t.string :status
      t.boolean :key_pick

      t.timestamps
    end
  end
end
