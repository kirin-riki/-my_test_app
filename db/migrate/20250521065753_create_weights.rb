class CreateWeights < ActiveRecord::Migration[7.2]
  def change
    create_table :weights do |t|
      t.date :recorded_on
      t.float :weight
      t.float :fat_rate

      t.timestamps
    end
  end
end
