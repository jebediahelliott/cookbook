module Slug

  module InstanceMethods

    def slug
      self.name.gsub(" ", "-").gsub(/[^\w-]/, '').downcase
    end

    def slug_username
      self.username.gsub(" ", "-").gsub(/[^\w-]/, '').downcase
    end

  end

  module ClassMethods

    def find_by_slug(value)
      self.all.detect{ |a| a.slug == value}
    end

    def find_by_slug_username(value)
      self.all.detect{ |a| a.slug_username == value}
    end

  end

end
