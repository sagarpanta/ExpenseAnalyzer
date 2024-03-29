



class GraphsController < ApplicationController
  # GET /categories/1
  # GET /categories/1.json
 def index
     @grph = open_flash_chart_object(564,252, "graphs/categorydateview")
	 @grph1 = open_flash_chart_object(564,252, "graphs/categoryview")

  end
  

 def jan 
     Category.set_month_name("January")
     @grph = open_flash_chart_object(564,252, "categorydateview")
	 @grph1 = open_flash_chart_object(564,252, "categoryview")
  end
  
  def feb
	Category.set_month_name("February")
     @grph = open_flash_chart_object(564,252, "categorydateview")
	 @grph1 = open_flash_chart_object(564,252, "categoryview")
  end
  
  
 def mar 
     Category.set_month_name("March")
     @grph = open_flash_chart_object(564,252, "categorydateview")
	 @grph1 = open_flash_chart_object(564,252, "categoryview")
  end
  
  def apr
	Category.set_month_name("April")
     @grph = open_flash_chart_object(564,252, "categorydateview")
	 @grph1 = open_flash_chart_object(564,252, "categoryview")
  end
  
  
 def may 
     Category.set_month_name("May")
     @grph = open_flash_chart_object(564,252, "categorydateview")
	 @grph1 = open_flash_chart_object(564,252, "categoryview")
  end
  
  def jun
	Category.set_month_name("June")
     @grph = open_flash_chart_object(564,252, "categorydateview")
	 @grph1 = open_flash_chart_object(564,252, "categoryview")
  end
  
  
  def jul 
     Category.set_month_name("July")
     @grph = open_flash_chart_object(564,252, "categorydateview")
	 @grph1 = open_flash_chart_object(564,252, "categoryview")
  end
  
  def aug
	Category.set_month_name("August")
     @grph = open_flash_chart_object(564,252, "categorydateview")
	 @grph1 = open_flash_chart_object(564,252, "categoryview")
  end
  
  
 def sep 
     Category.set_month_name("September")
     @grph = open_flash_chart_object(564,252, "categorydateview")
	 @grph1 = open_flash_chart_object(564,252, "categoryview")
  end
  
  def oct
	Category.set_month_name("October")
     @grph = open_flash_chart_object(564,252, "categorydateview")
	 @grph1 = open_flash_chart_object(564,252, "categoryview")
  end
  
  
  def nov 
     Category.set_month_name("November")
     @grph = open_flash_chart_object(564,252, "categorydateview")
	 @grph1 = open_flash_chart_object(564,252, "categoryview")
  end
  
  def dec
	Category.set_month_name("December")
     @grph = open_flash_chart_object(564,252, "categorydateview")
	 @grph1 = open_flash_chart_object(564,252, "categoryview")
  end
  
  

  
 def categoryview
  	id = 0
	
  	bar_ = Bar.new(50, '#AA66CC')

	
  	g = Graph.new
  	g.title("Expenses by Category", "{font-size: 18px;}")
	
	
	
  
	#@categories = Category.all(:group=>"id, categorytype, ").collect{|c| [c.categorytype, Category.sum("expense", :conditions=>"categorytype='#{c.categorytype}' and month_name = '#{Category.get_month_name}'")] }
	@categories = Category.where("month_name = ? and user_id = ?",Category.get_month_name, current_user.id).group("categorytype").sum(:expense)
  	@categories.each do |category|
   		bar_.data << category[1]
		
  		g.data_sets << bar_

  	end



  	@categorytypes = []
  	@categories.each do |x|
  		@categorytypes << Category::TYPES[x[0].to_i]
  	end 
	
	@dates = Category.find(:all, :select => 'DISTINCT date_spent', :conditions=>"month_name = '#{Category.get_month_name}' and user_id = '#{current_user.id}'", :order => 'date_spent')

	
	if !@dates.empty?
		g.set_x_labels(@categorytypes)
	end
	g.set_bg_color('#FFCC00')
	g.set_inner_background('#E6E6FA', '#FFFFFF', 20)
  	g.set_x_label_style(10, '#9933CC', 0, 0)
  	g.set_x_axis_steps(0)
  	g.set_y_max(2000)
  	g.set_y_label_steps(10)
  	g.set_y_legend("Expenses", 12, "0x736AFF")

  	render :text => g.render
	
  end 
  

  def categorydateview
	bars = []
	colors = ['#6666FF' , '#FF9900', '#FF3300', '#6600CC', '#006FFC', '#00BBBC', '#006600' , '#FF66FF']
	id = 0
	
    bar0 = []
    bar1 = []
    bar2 = []
    bar3 = []	
    bar4 = []
    bar5 = []
    bar6 = []
    bar7 = []
	
	bar_data0 = []
	bar_data1 = []
	bar_data2 = []
	bar_data3 = []
	bar_data4 = []
	bar_data5 = []
	bar_data6 = []
	bar_data7 = []
	dates_and_types = []
	
	
	
	g = Graph.new
	g.title("Daily Expenses Grouped by Category", "{font-size: 18px;}")
	@dates = Category.find(:all, :select => 'DISTINCT date_spent', :conditions=>"month_name = '#{Category.get_month_name}' and user_id = '#{current_user.id}'", :order => 'date_spent')


	bar0 = Bar.new(50, colors[0])
	bar1 = Bar.new(50, colors[1])
	bar2 = Bar.new(50, colors[2])
	bar3 = Bar.new(50, colors[3])
	bar4 = Bar.new(50, colors[4])
	bar5 = Bar.new(50, colors[5])
	bar6 = Bar.new(50, colors[6])
	bar7 = Bar.new(50, colors[7])
	
	bar0.key(Category::TYPES[0],10)
	bar1.key(Category::TYPES[1],10)
	bar2.key(Category::TYPES[2],10)
	bar3.key(Category::TYPES[3],10)
	bar4.key(Category::TYPES[4],10)
	bar5.key(Category::TYPES[5],10)
	bar6.key(Category::TYPES[6],10)
	bar7.key(Category::TYPES[7],10)
	

	val0 = []
	val1 = []
	val2 = []
	val3 = []
	val4 = []
	val5 = []
	val6 = []
	val7 = []

	
	cat_id = 0
	id0 = id1 =id2 =id3 =id4 =id5 =id6 = id7 = 0
	date_counter = 0

	hash_length = []
	
	bar_id = []
	bar_values = Hash.new
	
	8.times do |x|
		@dates.each do |d|
			bar_values[d.date_spent] = 0	
		end
		bar_id[x] = bar_values

		bar_values = Hash.new
		
	end
	
	
	id = 0
	
	@dates.each do |d|
		@categories = Category.where("date_spent = ? and user_id = ?" , d.date_spent, current_user.id).group("categorytype").sum(:expense)
		#@categories = Category.all(:group=>"categorytype", :order=> 'categorytype').collect{|c| [c.categorytype, Category.sum("expense", :conditions=>"categorytype='#{c.categorytype}' and date_spent='#{d.date_spent}'")] }
		@categories.each do |category|
				cat_id = category[0].to_i
				if cat_id == 0 
					bar_id[cat_id][d.date_spent] = category[1]
								
					
				elsif cat_id == 1
					bar_id[cat_id][d.date_spent] = category[1]
				
				
				elsif cat_id == 2
					bar_id[cat_id][d.date_spent] = category[1]
	
				

				elsif cat_id == 3
					bar_id[cat_id][d.date_spent] = category[1]
				
					
				elsif cat_id == 4
					bar_id[cat_id][d.date_spent] = category[1]
				
					
				elsif cat_id == 5
					bar_id[cat_id][d.date_spent] = category[1]
				
					
				elsif cat_id == 6
					bar_id[cat_id][d.date_spent] = category[1]
				

				elsif cat_id == 7
					bar_id[cat_id][d.date_spent] = category[1]

				end
			
			
		id += 1		
			
		end
	end

	@dates.each do |d|
		bar0.data << bar_id[0][d.date_spent]
		bar1.data << bar_id[1][d.date_spent]
		bar2.data << bar_id[2][d.date_spent]
		bar3.data << bar_id[3][d.date_spent]
		bar4.data << bar_id[4][d.date_spent]
		bar5.data << bar_id[5][d.date_spent]
		bar6.data << bar_id[6][d.date_spent]
		bar7.data << bar_id[7][d.date_spent]
	end
	


	cattypes = []
	id = 0
	@categorytypes = Category.find(:all, :select => 'DISTINCT categorytype', :conditions=>"user_id = '#{current_user.id}' " , :order => 'categorytype')
	@categorytypes.each do |category|
		cattypes[id] = category.categorytype
		id +=1
	end
		
	if  cattypes.include?('0') and !@dates.empty?
		g.data_sets << bar0
	else 
		bar0 = nil
	end
	
	if  cattypes.include?('1') and !@dates.empty?
		g.data_sets << bar1
	else 
		bar1 = nil
	end
		
	if  cattypes.include?('2') and !@dates.empty?
		g.data_sets << bar2
	else 
		bar2 = nil
	end
	
	if  cattypes.include?('3') and !@dates.empty?
		g.data_sets << bar3
	else 
		bar3 = nil
	end
	
	if  cattypes.include?('4') and !@dates.empty?
		g.data_sets << bar4
	else 
		bar4 = nil
	end

	
	if  cattypes.include?('5') and !@dates.empty?
		g.data_sets << bar5
	else 
		bar5 = nil
	end
	
	
	if  cattypes.include?('6') and !@dates.empty?
		g.data_sets << bar6
	else 
		bar6 = nil
	end
		
	if  cattypes.include?('7') and !@dates.empty?
		g.data_sets << bar7
	else 
		bar7 = nil
		
	end
	

	date_counter = 0
	@date_spent = []
	@dates.each do |x|
		@date_spent << x.date_spent
		date_counter += 1
	end 
	g.set_bg_color('#FFCC00')
	g.set_inner_background('#E6E6FA', '#FFFFFF', 20)
	g.set_x_labels(@date_spent)
	
	orientation = 0
	if date_counter>5 and date_counter<=25
		orientation = 2
	elsif date_counter>25
		orientation=1
	end
		
	g.set_x_label_style(10, '#9933CC', orientation, 0)
	g.set_x_axis_steps(1)
	g.set_y_max(2000)
	g.set_y_label_steps(10)
	g.set_y_legend("Expenses", 12, "0x736AFF")
	render :text => g.render
	
  end
  
end




