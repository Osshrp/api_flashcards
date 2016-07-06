class AddIntervalToCards < ActiveRecord::Migration
  def change
    add_column :cards, :interval, :integer, null: false, default: 1
  end
end
