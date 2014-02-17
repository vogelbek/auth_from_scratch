class User < ActiveRecord::Base
  attr_accessible :username, :password

  attr_accessor :password
  before_save :encrypt_password

  validates :username, :password, presence: true
  #validates :password, presence: true, on: :create
  validates :username, uniqueness: true

  def self.authenticate username, password
    user = User.find_by username: username
    puts user.to_s
    if right_password? user, password
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret password, password_salt
    end
  end

  private
  def self.right_password? user, password
    salt = user.password_salt
    correct_password_hash = BCrypt::Engine.hash_secret password, salt
    password_is_correct = user.password_hash == correct_password_hash

    user.exists? and password_is_correct
  end
end
