class User < ActiveRecord::Base

  has_many :rounds

  validates :user_name, presence: { message: "username must be present" }
  validates_uniqueness_of :email, :message => "in use"
  validates_uniqueness_of :user_name, :message => "taken"

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(username, password_attempt)
    user = User.find_by(user_name: username)
    if user.password == password_attempt
      true
    else
      false
    end
  end

end
