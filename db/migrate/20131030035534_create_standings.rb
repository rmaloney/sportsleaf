class CreateStandings < ActiveRecord::Migration
  def change
    create_table :standings do |t|
      t.integer :pool_id
      t.integer :user_id
      t.integer :wins
      t.integer :losses
      t.integer :points

      t.timestamps
    end
  end
end
