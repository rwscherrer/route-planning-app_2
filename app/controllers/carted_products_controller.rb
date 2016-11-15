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

    

    @testy = @carted_products.each do
      CartedProduct.rank(:row_order)
    end


    @first_job = @in_progress.take(1)[0]
    @first_city = @first_job['city']

    @destinations = []
    @in_progress.each do |job|
      if @first_job.include?(job) == false
        @destinations << job
      end
    end


    # @origin_coord = @first_job['to_coordinates'][0].to_s + ',' + @first_job['to_coordinates'][1].to_s

    @destination_coord = []

    

    @destinations.each do |destination|
      @destination_coord << destination['to_coordinates'][0].to_s + ',' + destination['to_coordinates'][1].to_s + '|'
    end


   

    @distance = []
    
    @job_count = @in_progress.count

    @google_directions = Unirest.get("https://maps.googleapis.com/maps/api/directions/json?origin=41.778273,-87.9754344&destination=41.802735,-87.928432&waypoints=41.7950638,-87.9762138|41.798179,-87.954478|41.801996,-87.927916|41.7788275,-87.9746218|41.7964038,-87.9756373&key=AIzaSyBmQv9dqyhd61nrOBPai-c68aKA6ZbvTdo").body

    @googer = 'distance ' + @google_directions['routes'][0]['legs'][0]['steps'][1]['distance']['text'] + ' ' + 'travel time ' + @google_directions['routes'][0]['legs'][0]['steps'][1]['duration']['text']


    # https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=41.778273,-87.9754344&destinations=41.7950638,-87.9762138|41.798179,-87.954478|41.801996,-87.927916&key=AIzaSyDl68biGLxKw0g3LwG2LlulP1YvuvcDALI
     

    # @dist = Geocoder::Calculations.distance_between(current_location, next_location)


    # 6010 Cass Ave., Westmont, IL, 60559 to 15 W. Quincy St., Westmont, IL, 60559
 


    @dist_count = 0
    @next_dist = @dist_count


    
    @in_progress.length.times do 
      @dist = Geocoder::Calculations.distance_between(@in_progress[@dist_count]['to_coordinates'], @in_progress[@next_dist]['to_coordinates'])
      @in_progress[@dist_count]['distance'] = @dist
      @dist_count += 1
    end

    # @test = Geocoder::Calculations.distance_between(@in_progress[0]['to_coordinates'], @in_progress[1]['to_coordinates'])

    @dist_sort = @in_progress.sort_by { |a| a['distance'] }

    @priority_sort = @in_progress.sort_by { |a| -a['priority'] }



    # @in_progress.each do |job|
    #   if job['in_progress'] = true
    #     job['in_progress'] = 1
    #   elsif job['in_progress'] = false
    #     job['in_progress'] = 0
    #   end
    # end


  


    # @distance_duration = Unirest.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=41.778273,-87.9754344|41.7950638,-87.9762138|41.798179,-87.954478|41.801996,-87.927916|41.7788275,-87.9746218|41.7964038,-87.9756373|41.816719,-88.010595&destinations=41.778273,-87.9754344|41.7950638,-87.9762138|41.798179,-87.954478|41.801996,-87.927916|41.7788275,-87.9746218|41.7964038,-87.9756373|41.816719,-88.010595&key=AIzaSyDl68biGLxKw0g3LwG2LlulP1YvuvcDALI").body

  #   @dist_dur = {"destination_addresses"=>["6015-6099 Cass Ave, Westmont, IL 60559, USA", "13-15 W Quincy St, Westmont, IL 60559, USA", "6-8 N Prospect Ave, Clarendon Hills, IL 60514, USA", "63 Village Pl, Hinsdale, IL 60521, USA", "6000 Cass Ave, Westmont, IL 60559, USA", "12-14 N Cass Ave, Westmont, IL 60559, USA", "1018 39th St, Downers Grove, IL 60515, USA"], "origin_addresses"=>["6015-6099 Cass Ave, Westmont, IL 60559, USA", "13-15 W Quincy St, Westmont, IL 60559, USA", "6-8 N Prospect Ave, Clarendon Hills, IL 60514, USA", "63 Village Pl, Hinsdale, IL 60521, USA", "6000 Cass Ave, Westmont, IL 60559, USA", "12-14 N Cass Ave, Westmont, IL 60559, USA", "1018 39th St, Downers Grove, IL 60515, USA"], "rows"=>[{"elements"=>[{"distance"=>{"text"=>"1 ft", "value"=>0}, "duration"=>{"text"=>"1 min", "value"=>0}, "status"=>"OK"}, {"distance"=>{"text"=>"1.2 mi", "value"=>1960}, "duration"=>{"text"=>"4 mins", "value"=>248}, "status"=>"OK"}, {"distance"=>{"text"=>"2.5 mi", "value"=>4060}, "duration"=>{"text"=>"6 mins", "value"=>385}, "status"=>"OK"}, {"distance"=>{"text"=>"4.2 mi", "value"=>6749}, "duration"=>{"text"=>"11 mins", "value"=>644}, "status"=>"OK"}, {"distance"=>{"text"=>"197 ft", "value"=>60}, "duration"=>{"text"=>"1 min", "value"=>4}, "status"=>"OK"}, {"distance"=>{"text"=>"1.3 mi", "value"=>2016}, "duration"=>{"text"=>"4 mins", "value"=>255}, "status"=>"OK"}, {"distance"=>{"text"=>"4.5 mi", "value"=>7188}, "duration"=>{"text"=>"12 mins", "value"=>738}, "status"=>"OK"}]}, {"elements"=>[{"distance"=>{"text"=>"1.3 mi", "value"=>2042}, "duration"=>{"text"=>"4 mins", "value"=>267}, "status"=>"OK"}, {"distance"=>{"text"=>"1 ft", "value"=>0}, "duration"=>{"text"=>"1 min", "value"=>0}, "status"=>"OK"}, {"distance"=>{"text"=>"1.5 mi", "value"=>2405}, "duration"=>{"text"=>"7 mins", "value"=>439}, "status"=>"OK"}, {"distance"=>{"text"=>"4.1 mi", "value"=>6590}, "duration"=>{"text"=>"12 mins", "value"=>728}, "status"=>"OK"}, {"distance"=>{"text"=>"1.2 mi", "value"=>1983}, "duration"=>{"text"=>"4 mins", "value"=>263}, "status"=>"OK"}, {"distance"=>{"text"=>"0.4 mi", "value"=>637}, "duration"=>{"text"=>"3 mins", "value"=>186}, "status"=>"OK"}, {"distance"=>{"text"=>"3.4 mi", "value"=>5395}, "duration"=>{"text"=>"11 mins", "value"=>656}, "status"=>"OK"}]}, {"elements"=>[{"distance"=>{"text"=>"2.5 mi", "value"=>4060}, "duration"=>{"text"=>"7 mins", "value"=>401}, "status"=>"OK"}, {"distance"=>{"text"=>"1.3 mi", "value"=>2053}, "duration"=>{"text"=>"5 mins", "value"=>328}, "status"=>"OK"}, {"distance"=>{"text"=>"1 ft", "value"=>0}, "duration"=>{"text"=>"1 min", "value"=>0}, "status"=>"OK"}, {"distance"=>{"text"=>"1.6 mi", "value"=>2505}, "duration"=>{"text"=>"6 mins", "value"=>368}, "status"=>"OK"}, {"distance"=>{"text"=>"2.5 mi", "value"=>4000}, "duration"=>{"text"=>"7 mins", "value"=>397}, "status"=>"OK"}, {"distance"=>{"text"=>"1.2 mi", "value"=>1976}, "duration"=>{"text"=>"5 mins", "value"=>283}, "status"=>"OK"}, {"distance"=>{"text"=>"4.3 mi", "value"=>6877}, "duration"=>{"text"=>"12 mins", "value"=>704}, "status"=>"OK"}]}, {"elements"=>[{"distance"=>{"text"=>"4.1 mi", "value"=>6628}, "duration"=>{"text"=>"11 mins", "value"=>652}, "status"=>"OK"}, {"distance"=>{"text"=>"2.7 mi", "value"=>4404}, "duration"=>{"text"=>"11 mins", "value"=>653}, "status"=>"OK"}, {"distance"=>{"text"=>"1.6 mi", "value"=>2534}, "duration"=>{"text"=>"7 mins", "value"=>390}, "status"=>"OK"}, {"distance"=>{"text"=>"1 ft", "value"=>0}, "duration"=>{"text"=>"1 min", "value"=>0}, "status"=>"OK"}, {"distance"=>{"text"=>"4.1 mi", "value"=>6568}, "duration"=>{"text"=>"11 mins", "value"=>648}, "status"=>"OK"}, {"distance"=>{"text"=>"2.7 mi", "value"=>4327}, "duration"=>{"text"=>"10 mins", "value"=>608}, "status"=>"OK"}, {"distance"=>{"text"=>"5.7 mi", "value"=>9186}, "duration"=>{"text"=>"16 mins", "value"=>972}, "status"=>"OK"}]}, {"elements"=>[{"distance"=>{"text"=>"197 ft", "value"=>60}, "duration"=>{"text"=>"1 min", "value"=>4}, "status"=>"OK"}, {"distance"=>{"text"=>"1.2 mi", "value"=>1900}, "duration"=>{"text"=>"4 mins", "value"=>243}, "status"=>"OK"}, {"distance"=>{"text"=>"2.5 mi", "value"=>4000}, "duration"=>{"text"=>"6 mins", "value"=>381}, "status"=>"OK"}, {"distance"=>{"text"=>"4.2 mi", "value"=>6689}, "duration"=>{"text"=>"11 mins", "value"=>640}, "status"=>"OK"}, {"distance"=>{"text"=>"1 ft", "value"=>0}, "duration"=>{"text"=>"1 min", "value"=>0}, "status"=>"OK"}, {"distance"=>{"text"=>"1.2 mi", "value"=>1956}, "duration"=>{"text"=>"4 mins", "value"=>251}, "status"=>"OK"}, {"distance"=>{"text"=>"4.4 mi", "value"=>7129}, "duration"=>{"text"=>"12 mins", "value"=>734}, "status"=>"OK"}]}, {"elements"=>[{"distance"=>{"text"=>"1.3 mi", "value"=>2016}, "duration"=>{"text"=>"4 mins", "value"=>241}, "status"=>"OK"}, {"distance"=>{"text"=>"0.1 mi", "value"=>205}, "duration"=>{"text"=>"1 min", "value"=>65}, "status"=>"OK"}, {"distance"=>{"text"=>"1.2 mi", "value"=>1976}, "duration"=>{"text"=>"5 mins", "value"=>292}, "status"=>"OK"}, {"distance"=>{"text"=>"2.7 mi", "value"=>4298}, "duration"=>{"text"=>"10 mins", "value"=>599}, "status"=>"OK"}, {"distance"=>{"text"=>"1.2 mi", "value"=>1956}, "duration"=>{"text"=>"4 mins", "value"=>237}, "status"=>"OK"}, {"distance"=>{"text"=>"1 ft", "value"=>0}, "duration"=>{"text"=>"1 min", "value"=>0}, "status"=>"OK"}, {"distance"=>{"text"=>"3.3 mi", "value"=>5363}, "duration"=>{"text"=>"9 mins", "value"=>545}, "status"=>"OK"}]}, {"elements"=>[{"distance"=>{"text"=>"4.6 mi", "value"=>7348}, "duration"=>{"text"=>"12 mins", "value"=>703}, "status"=>"OK"}, {"distance"=>{"text"=>"3.5 mi", "value"=>5570}, "duration"=>{"text"=>"10 mins", "value"=>603}, "status"=>"OK"}, {"distance"=>{"text"=>"4.3 mi", "value"=>6875}, "duration"=>{"text"=>"11 mins", "value"=>675}, "status"=>"OK"}, {"distance"=>{"text"=>"5.7 mi", "value"=>9223}, "duration"=>{"text"=>"16 mins", "value"=>955}, "status"=>"OK"}, {"distance"=>{"text"=>"4.5 mi", "value"=>7288}, "duration"=>{"text"=>"12 mins", "value"=>699}, "status"=>"OK"}, {"distance"=>{"text"=>"3.3 mi", "value"=>5365}, "duration"=>{"text"=>"9 mins", "value"=>538}, "status"=>"OK"}, {"distance"=>{"text"=>"1 ft", "value"=>0}, "duration"=>{"text"=>"1 min", "value"=>0}, "status"=>"OK"}]}], "status"=>"OK"}

 


  


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

