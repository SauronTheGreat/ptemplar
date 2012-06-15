class AddUsesBackgroundImageToPtemplate < ActiveRecord::Migration
  def change
    add_column :ptemplates, :uses_background_image, :boolean,:default=>false
  end
end
