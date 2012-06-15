class AddInBankToPslide < ActiveRecord::Migration
  def change
    add_column :pslides, :in_bank, :boolean ,:default=>false
  end
end
