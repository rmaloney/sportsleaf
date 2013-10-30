class AddSelectionToPick < ActiveRecord::Migration
  def change
    add_column :picks, :selection, :string

  end
end
