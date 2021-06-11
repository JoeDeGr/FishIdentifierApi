class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true 

    has_many :posts
    has_many :users_specy
    has_many :species, through: :users_specy
    has_many :users_genu
    has_many :genus, through: :users_genu
end
