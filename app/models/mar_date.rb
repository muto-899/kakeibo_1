class MarDate < ApplicationRecord
  validates :user_id, {presence: true}
end
