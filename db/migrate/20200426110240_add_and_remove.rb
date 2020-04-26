class AddAndRemove < ActiveRecord::Migration[5.2]
  def change
    add_column :jan_dates, :income_category, :string
    add_column :jan_dates, :pay_category, :string
    remove_column :jan_dates, :category, :string
    
    add_column :feb_dates, :income_category, :string
    add_column :feb_dates, :pay_category, :string
    remove_column :feb_dates, :category, :string
    
    add_column :mar_dates, :income_category, :string
    add_column :mar_dates, :pay_category, :string
    remove_column :mar_dates, :category, :string
    
    add_column :apr_dates, :income_category, :string
    add_column :apr_dates, :pay_category, :string
    remove_column :apr_dates, :category, :string
    
    add_column :may_dates, :income_category, :string
    add_column :may_dates, :pay_category, :string
    remove_column :may_dates, :category, :string
    
    add_column :jun_dates, :income_category, :string
    add_column :jun_dates, :pay_category, :string
    remove_column :jun_dates, :category, :string
    
    add_column :jul_dates, :income_category, :string
    add_column :jul_dates, :pay_category, :string
    remove_column :jul_dates, :category, :string
    
    add_column :aug_dates, :income_category, :string
    add_column :aug_dates, :pay_category, :string
    remove_column :aug_dates, :category, :string
    
    add_column :sep_dates, :income_category, :string
    add_column :sep_dates, :pay_category, :string
    remove_column :sep_dates, :category, :string
    
    add_column :oct_dates, :income_category, :string
    add_column :oct_dates, :pay_category, :string
    remove_column :oct_dates, :category, :string
    
    add_column :nov_dates, :income_category, :string
    add_column :nov_dates, :pay_category, :string
    remove_column :nov_dates, :category, :string
    
    add_column :dec_dates, :income_category, :string
    add_column :dec_dates, :pay_category, :string
    remove_column :dec_dates, :category, :string
  end
end
