class AddFieldsToPool < ActiveRecord::Migration
  def change
  	add_column :pools, :manager, :integer
  	add_column :pools, :title, :string
  	add_column :pools, :visibility, :string
  	add_column :pools, :description, :string

  end
end
