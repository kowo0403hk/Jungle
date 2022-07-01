class User < ApplicationRecord
  # using the bcrypt library
  has_secure_password
end
