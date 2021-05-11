class Genus < ApplicationRecord
    has_many :users_genu
    has_many :users, through: :users_genu
    has_many :species 
end
