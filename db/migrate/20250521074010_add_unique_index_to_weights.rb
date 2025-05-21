class AddUniqueIndexToWeights < ActiveRecord::Migration[7.2]
  def change
    add_index :weights, :recorded_on, unique: true
  end
end
