class Ingredient < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods
  has_many :recipes, through: :amounts
  has_many :amounts
end
