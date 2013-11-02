class AddCoverToGame < ActiveRecord::Migration
  def change
    add_column :games, :cover, :string

  end
end
