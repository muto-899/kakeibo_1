class CreateAprDates < ActiveRecord::Migration[5.2]
  def change
    create_table :apr_dates do |t|
      t.string :category
      t.integer :income
      t.integer :pay

      t.timestamps
    end
  end
end
