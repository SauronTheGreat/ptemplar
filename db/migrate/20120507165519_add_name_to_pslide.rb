class AddNameToPslide < ActiveRecord::Migration
  def change
    add_column :pslides, :name, :string
  end
end
