require 'Date'



class Category < ActiveRecord::Base
  attr_accessible :categorytype, :date_spent, :expense, :month_id, :month_name, :week_id,  :year , :TYPES
  TYPES = ['Grocery', 'Gas' ,'Clothes' ,'Rent' , 'Insurance' , 'Household & Accessories' , 'Others' , 'Travelling']


 def self.set_month_name(monthname)
	@temp_month_name = monthname
 end
 
  def self.get_month_name
	return @temp_month_name
  end
  
 
# before_create :weekid
 
 # def weekid
 #	 week_id = date_spent.strftime("%w").to_i
 # end
  
 # def monthid
 #	 week_id = date_spent.strftime("%m").to_i
 # end
  
 # def monthname
 #	 week_id = Date::MONTHNAMES[date_spent.month]
 # end
  
 # def yearnum
 #	 week_id = date_spent.strftime("%y").to_i
 # end
  
  def date_spent=(date_spent)
	 write_attribute(:date_spent, date_spent)
 	 self.month_name = Date::MONTHNAMES[date_spent.month]
	 self.month_id = date_spent.strftime("%m").to_i
	 self.week_id = date_spent.strftime("%w").to_i
	 self.year = date_spent.strftime("%y").to_i
  end
  
end
