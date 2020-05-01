class AddUserId < ActiveRecord::Migration[5.2]
  def change
    
    add_column :jan_dates, :user_id, :integer
    add_column :feb_dates, :user_id, :integer
    add_column :mar_dates, :user_id, :integer
    add_column :apr_dates, :user_id, :integer
    add_column :may_dates, :user_id, :integer
    add_column :jun_dates, :user_id, :integer
    add_column :jul_dates, :user_id, :integer
    add_column :aug_dates, :user_id, :integer
    add_column :sep_dates, :user_id, :integer
    add_column :oct_dates, :user_id, :integer
    add_column :nov_dates, :user_id, :integer
    add_column :dec_dates, :user_id, :integer
    
  end
end
