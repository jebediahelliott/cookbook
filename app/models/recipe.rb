class Recipe < ActiveRecord::Base
  has_many :ingredients, through: :amounts
  has_many :amounts
  belongs_to :user
  extend Slug::ClassMethods
  include Slug::InstanceMethods
end
