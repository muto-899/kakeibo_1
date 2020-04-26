class CreateAugDates < ActiveRecord::Migration[5.2]
  def change
    create_table :aug_dates do |t|
      t.string :category
      t.integer :income
      t.integer :pay

      t.timestamps
    end
  end
end
