class Product < ActiveRecord::Base

	def self.by_section(section)
		where(section: section)
	end

	def self.by_name(search)
    	where("name ILIKE ?", "%#{search}%",)
  	end
end
