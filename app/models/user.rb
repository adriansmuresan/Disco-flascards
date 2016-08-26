class User < ActiveRecord::Base

  has_many :rounds

  validates :user_name, presence: true
  validates_uniqueness_of :email, :message => "in use"

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

end
