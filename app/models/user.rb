class User < ActiveRecord::Base
  before_create :rand_token
  
  has_secure_password
  
  validates :first_name , presence: true
  validates :last_name , presence: true
  validates :email , presence: true , uniqueness: true
  
  def to_s
     "#{first_name} #{last_name}"
  end
  def rand_token
    self.token = SecureRandom.uuid
  end
end
