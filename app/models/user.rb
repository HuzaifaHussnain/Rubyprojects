class User < ApplicationRecord

  before_save :encrypt_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: 'true', uniqueness: true
  validates :password, presence: true, confirmation: true, length:{ in: 3..20}, on: :save


def encrypt_password
  self.password=Digest::SHA1.hexdigest(self.password)
end

def valid_password?(new_password)
  @password == Digest::SHA1.hexdigest(new_password)

end

end
