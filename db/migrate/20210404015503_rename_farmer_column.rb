class RenameFarmerColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :items, :type, :itemtype
  end
end
