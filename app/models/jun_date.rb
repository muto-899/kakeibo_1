class JunDate < ApplicationRecord
  validates :user_id, {presence: true}
end
