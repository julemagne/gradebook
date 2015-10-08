class Parent < ActiveRecord::Base
  belongs_to :student
  has_secure_password
end
