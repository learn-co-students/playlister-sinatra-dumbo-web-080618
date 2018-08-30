module Slugifiable
  module InstanceMethod
    def slug
      self.name.gsub(/[^a-zA-Z0-9]/, '-').downcase
    end
  end
  module ClassMethod
    #returns object of songs/artsts/genres from database
    def find_by_slug(slug)
      all.find{|instance| slug == instance.slug}
    end
  end
end
