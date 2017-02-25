class User < ApplicationRecord
    has_secure_password validation: false

    has_many :comments
    has_many :votes, as: :voteable
end
