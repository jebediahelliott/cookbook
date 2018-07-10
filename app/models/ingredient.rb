class Ingredient < ActiveRecord::Base
  extend Slug::ClassMethods
  include Slug::InstanceMethods
  belongs_to :recipe
end
