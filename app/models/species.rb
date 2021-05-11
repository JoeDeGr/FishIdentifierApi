class Species < ApplicationRecord
    has_many :users_specy
    has_many :users, through: :users_specy
    belongs_to :genus
end
