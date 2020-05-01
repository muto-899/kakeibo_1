class AugDate < ApplicationRecord
  validates :user_id, {presence: true}
end
