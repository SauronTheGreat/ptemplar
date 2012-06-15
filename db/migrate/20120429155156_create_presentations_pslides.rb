class CreatePresentationsPslides < ActiveRecord::Migration
  def change
    create_table :presentations_pslides do |t|
      t.integer :presentation_id
      t.integer :pslide_id
      t.integer :sequence_number

      t.timestamps
    end
  end
end
