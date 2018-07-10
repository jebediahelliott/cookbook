class User < ActiveRecord::Base
  has_many :recipes
  has_secure_password
  extend Slug::ClassMethods
  include Slug::InstanceMethods
end
