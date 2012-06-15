class AddUsesBackgroundToPslide < ActiveRecord::Migration
  def change
    add_column :pslides, :uses_background, :boolean
  end
end
