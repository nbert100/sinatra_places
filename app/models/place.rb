class Place < ActiveRecord::Base
 
  belongs_to :user   
  
  def formatted_name
    self.city_name.downcase.gsub(" ", "+")
  end
  
end
