class User < ActiveRecord::Base
  def self.login (email, password)
    user = where(email: email).first
    if user && user.password == password
      user
    else
      nil
    end
  end
end
