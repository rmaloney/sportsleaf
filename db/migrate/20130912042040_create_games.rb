class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :week
      t.string :home_team
      t.string :visitor_team
      t.string :favorite
      t.decimal :line
      t.date :start_date
      t.datetime :start_time
      t.string :kickoff
      t.integer :favorite_score
      t.integer :underdog_score

      t.timestamps
    end
  end
end
