class JanDate < ApplicationRecord
  validates :user_id, {presence: true}
end
