class AddRepeatToCards < ActiveRecord::Migration
  def change
    add_column :cards, :repeat, :integer, null: false, default: 1
  end
end
