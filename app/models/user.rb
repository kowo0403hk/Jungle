class User < ApplicationRecord
  # using the bcrypt library
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    processed_email = email.delete(" ").downcase
    @user = User.find_by_email(processed_email)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
  
  # we don't see :password and :password_confirmation in the schema because bcrypt hides them away. Even though they are not displayed, they are still there, so we can set validations for these two fields
  validates :password, :password_confirmation, presence: true
  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, :password_confirmation, length: {minimum: 3}

  # rails 6.1.5 does not support comparison validator method, so we have to create a custom validator
  validate :password_equals_password_confirmation? 

  def password_equals_password_confirmation?
    if password != password_confirmation
      errors.add("Password and password confirmation", "do not match")
    end
  end
end

