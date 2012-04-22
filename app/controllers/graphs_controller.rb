



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
	
	
	
  
	# @categories = Category.all(:group=>"id, categorytype, ").collect{|c| [c.categorytype, Category.sum("expense", :conditions=>"categorytype='#{c.categorytype}' and month_name = '#{Category.get_month_name}'")] }
	@categories = Category.where("categorytype = ? and month_name = ?", c.categorytype, Category.get_month_name ).select("categorytype, SUM(expense) expse").group("categorytype")
  	@categories.each do |category|
   		bar_.data << category[1]
		
  		g.data_sets << bar_

  	end



  	@categorytypes = []
  	@categories.each do |x|
  		@categorytypes << Category::TYPES[x[0].to_i]
  	end 
	
	@dates = Category.find(:all, :select => 'DISTINCT date_spent', :conditions=>"month_name = '#{Category.get_month_name}'", :order => 'date_spent')

	
	if !@dates.empty?
		g.set_x_labels(@categorytypes)
	end
	g.set_bg_color('#FFFFFF')
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
	@dates = Category.find(:all, :select => 'DISTINCT date_spent', :conditions=>"month_name = '#{Category.get_month_name}'", :order => 'date_spent')


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
	

	counter = 1
	
	@dates.each do |d|
		@categories = Category.all(:group=>"categorytype", :order=> 'categorytype').collect{|c| [c.categorytype, Category.sum("expense", :conditions=>"categorytype='#{c.categorytype}' and date_spent='#{d.date_spent}'")] }

		@categories.each do |category|
				cat_id = category[0].to_i
				if cat_id == 0 
					bar0.data << category[1]
					val0[id0]= category[1]
					id0+=1
					
				elsif cat_id == 1 
					bar1.data << category[1]
					val1[id1]= category[1]
					id1+=1

				elsif cat_id == 2 
					bar2.data << category[1]
					val2[id2]= category[1]
					id2+=1

				elsif cat_id == 3 
					bar3.data << category[1]
					val3[id3]= category[1]
					id3+=1
					
				elsif cat_id == 4 
					bar4.data << category[1]
					val4[id4]= category[1]
					id4+=1
					
				elsif cat_id == 5 
					bar5.data << category[1]
					val5[id5]= category[1]
					id5+=1
					
					
				elsif cat_id == 6 
					bar6.data << category[1]
					val6[id6]= category[1]
					id6+=1

				elsif cat_id == 7 
					bar7.data << category[1]
					val7[id7]= category[1]
					id7+=1

				end
			
				
			
		end
	end
	
	



	cattypes = []
	id = 0
	@categorytypes = Category.find(:all, :select => 'DISTINCT categorytype', :order => 'categorytype')
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
	g.set_bg_color('#FFFFFF')
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




