class User < ActiveRecord::Base
  validates_presence_of :username, :password, :password_salt
end
