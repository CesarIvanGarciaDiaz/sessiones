class User < ActiveRecord::Base
  # validaciones de nombre, email,password
  validates :name, presence: true
  validates :password, presence: true
  validates :email,presence:true, uniqueness: true

  private
  def self.authenticate(email, password)
    user = User.find_by(email: email, password: password)
    user == nil ? nil : user

  end
end
