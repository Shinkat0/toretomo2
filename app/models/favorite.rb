class Favorite < ApplicationRecord
  belongs_to :post_training
  belongs_to :user

  validates_uniqueness_of :post_training_id, scope: :user_id
end
