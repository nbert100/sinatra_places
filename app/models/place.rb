class Place < ActiveRecord::Base
 
  belongs_to :user   
  
  def slug
    self.city_name.downcase.gsub(" ", "+")
  end
end
