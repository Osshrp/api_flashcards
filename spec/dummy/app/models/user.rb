class User < ActiveRecord::Base
  has_many :cards, dependent: :destroy
  has_many :blocks, dependent: :destroy
  validates :email, uniqueness: true

  def self.authenticate (email, password)
    user = where(email: email).first
    (user && user.password == password) ? user : nil
  end
end
