class CartedProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  
  
  def index
    if current_user && current_user.currently_carted.any?
      @carted_products = current_user.currently_carted.order(:row_order)
      unless params[:order] = "assigned"
        @carted_products.order(:priority).reverse_order
        p "unless"
      else
        @carted_products.order(:row_order).reverse_order
        p "else"
      end
    else
      p "nothing in cart"
      flash[:warning] = "Please add items to cart."
      redirect_to '/'
    end

    duration_array = []
    @sum = 0

    @carted_products.each do |carted_product|
      duration_array << carted_product.job.duration
    end
    
    duration_array.each { |e| @sum += e }

  end


 

  def create
    CartedProduct.create(job_id: params[:job_id],
                         user_id: current_user.id, 
                         priority: 0,                  
                         status: "carted")

    
    flash[:success] = "Jobs Added To Route"
    redirect_to '/carted_products'
  end

  def show
    @carted_product = CartedProduct.find(params[:id])
  end

  def edit
    @carted_product = CartedProduct.find_by(id: params[:id])
  end

  def update
    @carted_product = CartedProduct.find(params[:id])
    @carted_product.update(priority: params[:priority])


    redirect_to "/carted_products"
  end

  def update_row_order
    puts params[:ids]
    puts "********************"
    puts "********************"
    puts "********************"
    p params[:ids]
    collection = []
    params[:ids].each_with_index do |id, i|
      @carted_product = CartedProduct.find(id.to_i)
      @carted_product.row_order = (i + 1)
      @carted_product.save
      collection << @carted_product
    end
    p collection
    puts "********************"
    puts "********************"
    puts "********************"


   
    render json: collection, code: 200
  end

  def distance
    @carted_products = current_user.currently_carted



    @jobs_hash = []
    @carted_products.each do |carted_product|
    @carted_hash = 
              {
                "job_id" => carted_product.job.id,
                "name" => carted_product.job.name,
                "priority" => carted_product.priority,
                "address" => carted_product.job.full_address,
                "city" => carted_product.job.city,
                "last_service" => carted_product.job.days_between,
                "in_progress" => carted_product.job.in_progress,
                "to_coordinates" => carted_product.job.to_coordinates,
                "row_order" => carted_product.row_order
              }
              
              
              @jobs_hash.push(@carted_hash)

      
  end


    @name = @jobs_hash.sort_by { |a, b| a['name'] }

    @priority = @jobs_hash.sort_by { |a, b| -a['priority'] }

    @job = @jobs_hash.sort_by { |a, b| a['num'] } 

    @in_progress = []

    @priority.each do |priority|
      if priority['in_progress'] == true
        @in_progress << priority
      end
    end

    @in_progress = @in_progress.sort_by { |a, b| -a['priority'] }

    @priority.each do |priority|
      if @in_progress.include?(priority) == false
        @in_progress << priority
      end
    end

    


    @first_job = @in_progress.take(1)[0]
    @first_city = @first_job['city']

    @destinations = []
    @in_progress.each do |job|
      if @first_job.include?(job) == false
        @destinations << job
      end
    end



    @destination_coord = []

    

    @destinations.each do |destination|
      @destination_coord << destination['to_coordinates'][0].to_s + ',' + destination['to_coordinates'][1].to_s + '|'
    end


   

    @distance = []
    
    @job_count = @in_progress.count



 


    @dist_count = 0
    @next_dist = @dist_count


    
    @in_progress.length.times do 
      @dist = Geocoder::Calculations.distance_between(@in_progress[@dist_count]['to_coordinates'], @in_progress[@next_dist]['to_coordinates'])
      @in_progress[@dist_count]['distance'] = @dist
      @dist_count += 1
    end

 

    @dist_sort = @in_progress.sort_by { |a| a['distance'] }

    @priority_sort = @in_progress.sort_by { |a| -a['priority'] }



  

 


  


    @final_order = []

    @in_progress.each do |job|
      if job['in_progress'] == true
        @final_order << job
      end
    end

    @in_progress.each do |job|
      if @final_order.include?(job) == false 
        @final_order << job
      end

    end



    @final_order = @final_order.sort_by { |i| i["row_order"]}

    @city_list = []

    @final_order.each do |job|
      if @city_list.include?(job['city']) == false
        @city_list << job['city']
      end
    end

    @dist_count = 0
    @next_dist = @dist_count

    @final_order.length.times do 
      @dist = Geocoder::Calculations.distance_between(@final_order[@dist_count]['to_coordinates'], @final_order[@next_dist]['to_coordinates'])
      @final_order[@dist_count]['distance'] = @dist 
      @dist_count +=1
    end


  


    # @weather = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22'#{@city}'%2C%20il%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body

    # @conditions = @weather['query']['results']['channel']['item']['forecast'][0]['text']

    @weather_stuff =[]

    @city_list.each do |city|
     @weather_stuff << city
     city = @city
     @weather_stuff << @conditions
    end

    # @final_order.each do |job|
      


  

    @remaining = []

    @remaining = @remaining.sort_by { |a| -a['priority'] }

    # @final_order = @final_order.sort_by { |a| -a['priority'] }

    # @nearby = Job.near(@final_order[0]['address'], 3, distance)

    count = 0

    @jobs_hash.each do |job|
      @cities = {
        'city' => job['city'],
        'forecast' => "this is the forecast"

      }
    end



    # @weather = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22'#{@city}'%2C%20il%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body

    # @city = 'westmont'
    # @conditions = @weather['query']['results']['channel']['item']['forecast']



    # @job_forecast = @conditions[0]['text'] + ' ' + "high: " + @conditions[0]['high'] + ' ' + "low: " + @conditions[0]['low']



    # @dist_count = 0

    # @final_order.each do |job|
    #   @city = job['city']
    #   @weather = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22'#{@city}'%2C%20il%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
    #   @conditions = @weather['query']['results']['channel']['item']['forecast']
    #   @final_order << job['forecast']
    #   @dist_count += 1
    # end

    # @dist_count = 0
    # @next_dist = @dist_count + 1

    # @final_order_dist = []

    # @final_order.length.times do 
    #   @dist = Geocoder::Calculations.distance_between(@in_progress[@dist_count]['to_coordinates'], @final_order[@next_dist]['to_coordinates'])
    #   @final_order[@dist_count]['distance'] = @dist
    #   @dist_count += 1
    # end



  end


  def destroy
    @carted_product = CartedProduct.find(params[:id])
    @carted_product.update(status: "removed")

    flash[:success] = "Job Removed From Route"
    redirect_to "/carted_products"
  end
end

