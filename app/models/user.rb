class User < ApplicationRecord
    has_many :users_specy
    has_many :species, through: :users_specy
    has_many :users_genu
    has_many :genus, through: :users_genu
end
