class AddMarkupToPresentation < ActiveRecord::Migration
  def change
    add_column :presentations, :markup, :text
  end
end
