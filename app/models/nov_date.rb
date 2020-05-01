class NovDate < ApplicationRecord
  validates :user_id, {presence: true}
end
