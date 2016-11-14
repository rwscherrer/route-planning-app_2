class CartedProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user && current_user.currently_carted.any?
      @carted_products = current_user.currently_carted.order(:priority).reverse_order
    else
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

  def distance
    @carted_products = current_user.currently_carted

    # @carted_jobs = []

    # counter = 1
    # @carted_products.each do |carted_product|
    #   @carted_jobs << "job_#{counter}"
    #   @carted_jobs << carted_product.job.id
    #   @carted_jobs << carted_product.job.name 
    #   @carted_jobs << carted_product.job.full_address
    #   @carted_jobs << carted_product.priority
    #   @carted_jobs << carted_product.job.in_progress
    #   @carted_jobs << carted_product.job.to_coordinates

    #   counter += 1
    # end


    @jobs_hash = []
    @carted_products.each do |carted_product|
      @carted_hash = 
              {
                "num" => carted_product.job.id,
                "name" => carted_product.job.name,
                "priority" => carted_product.priority,
                "in_progress" => carted_product.job.in_progress,
                "to_coordinates" => carted_product.job.to_coordinates
              }
              
              
              @jobs_hash.push(@carted_hash)

        
    end


    # @hash_hash = @hash_hash.sort_by{|k,v |v}

    @hash_flatten = @jobs_hash.flatten

    # @hash = @hash_test[0]['to_coordinates']

    @name = @jobs_hash.sort_by { |a, b| a['name'] }

    @priority = @jobs_hash.sort_by { |a, b| -a['priority'] }

    @job = @jobs_hash.sort_by { |a, b| a['num'] } 

    @in_progress = []

    @priority.each do |priority|
      if priority['in_progress'] == true
        @in_progress << priority 
      end
    end

    @priority.each do |priority|
      if @in_progress.include?(priority) == false
        @in_progress << priority
      end
    end







    # @cart_hash = []


    # @carted_test = []



    # counter = 1
    # @carted_products.each do |carted_product|
    #   @carted_test << [carted_product.job.id, carted_product.priority]
    #     counter += 1
    # end

   
    

    # @sorted = @carted_test.sort! { |k| k[0] }

    # @sorted1 = @carted_jobs.slice(0..6)


    # @sorted_count = @sorted.count


    

    # @sort_test_1 = @sorted[0][0]


    # @sorty = @sort_test_1

    # @sort_test_2 = @carted_test[1]

    

    # count = 1
    # @carted_products.each do |carted_product|
    #   @cart_hash["job_num"] << carted_product.job.id
    #   @cart_hash["priority"] << carted_product.priority
    #   count += 1
    # end


    # @carted_job_count = @carted_products.count
    # @carted_element_count = @carted_jobs.length / @carted_products.count
    

    # @test_stuff = @carted_jobs.in_groups(@carted_job_count)


    # @job_number_position = 0
    # @id_position = 1
    # @job_name_position = 2
    # @full_address_position = 3
    # @priority_position = 4
    # @in_progress_position = 5
    # @coord_position = 6
    # @dist_positiion = 7

    # ele_count = 6


    # stuff_count = @test_stuff.count

    # if @test_stuff[stuff_count][in_progress_position] == true


    # @test_prior = []
    
    # @next_carted_element = @carted_element_count -1


    # @carted_job_1 = @carted_jobs[0..6]
    # @carted_job_2 = @carted_jobs[7..13]
    # @carted_job_3 = @carted_jobs[14..21]
    # @carted_job_4 = @carted_jobs[22..27]
    # @carted_job_5 = @carted_jobs[28..33]
    # @carted_job_6 = @carted_jobs[34..39]
    # @carted_job_7 = @carted_jobs[40..45]
    # @carted_job_8 = @carted_jobs[46..51]
    # @carted_job_9 = @carted_jobs[52..57]
    # @carted_job_10 = @carted_jobs[58..63]
    # @carted_job_11 = @carted_jobs[64..69]
    # @carted_job_12 = @carted_jobs[70..75]
    # @carted_job_13 = @carted_jobs[75..81]
    # @carted_job_14 = @carted_jobs[82..87]
    # @carted_job_15 = @carted_jobs[88..93]
    # @carted_job_16 = @carted_jobs[94..99]
    # @carted_job_17 = @carted_jobs[100..105]
    # @carted_job_18 = @carted_jobs[106..111]
    # @carted_job_19 = @carted_jobs[112..117]
    # @carted_job_20 = @carted_jobs[118..123]


    # @resort = 

    # @resort["2"] << @

    # @loop = 1

    # @carted_job_count.times do
    #   @carted_job_job"#{@loop}" = @carted_jobs[0..@next_carted_element]
    #   @loop += 1
    #   @carted_job_job"#{@loop}" = @carted_jobs[@next_carted_element + 1.. @next_carted_element * 2 -1]
  

    # @carted_priority = []

    # if @carted_job_1[@priority_position] > @carted_job_2[@priority_position] && @carted_job_1[@priority_position] > @carted_job_3[@priority_position]
    #   @carted_priority << @carted_job_1
    #   if @carted_job_2[@priority_position] > @carted_job_3[@priority_position]
    #     @carted_priority << @carted_job_2
    #     @carted_priority << @carted_job_3
    #   elsif @carted_job_3[@priority_position] > @carted_job_2[@priority_position]
    #     @carted_priority << @carted_job_3
    #     @carted_priority << @carted_job_2
    #   end
    # elsif @carted_job_2[@priority_position] > @carted_job_1[@priority_position] && @carted_job_2[@priority_position] > @carted_job_3[@priority_position]
    #   @carted_priority << @carted_job_2
    #   if @carted_job_1[@priority_position] > @carted_job_3[@priority_position]
    #     @carted_priority << @carted_job_1
    #     @carted_priority << @carted_job_3
    #   elsif @carted_job_3[@priority_position] > @carted_job_1[@priority_position]
    #     @carted_priority << @carted_job_3
    #     @carted_priority << @carted_job_1
    #   end
    # elsif @carted_job_3[priority_position] > @carted_job_1[@priority_position] && @carted_job_3[@priority_position] > @carted_job_2[@priority_position]
    #   @carted_priority << @carted_job_3
    #   @carted_priority << @carted_job_1
    #   if @carted_job_1[@priority_position] > @carted_job_2[@priority_position]
    #     @carted_priority << @carted_job_1
    #     @carted_priority << @carted_job_2
    #   elsif @carted_job_2[@priority_position] > @carted_job_1[@priority_position]
    #     @carted_priority << @carted_job_2
    #     @carted_priority << @carted_job_1
    #   end
    # end

    

    # @carted_progress_priority = []

    # if @carted_job_1[@in_progress_position] == true
    #   @carted_progress_priority << @carted_job_1
    # elsif @carted_job_2[@in_progress_position] == true
    #   @carted_progress_priority << @carted_job_2
    # elsif @carted_job_3[@in_progress_position] == true
    #   @carted_progress_priority << @carted_job_3
    # end


 

    # if @carted_progress_priority.include?(@carted_job_1) == false
    #   @carted_progress_priority << @carted_job_1
    # end

    # if @carted_progress_priority.include?(@carted_job_2) == false
    #   @carted_progress_priority << @carted_job_2
    # end

    # if @carted_progress_priority.include?(@carted_job_3) == false
    #   @carted_progress_priority << @carted_job_3
    # end

  

    # @carted_progress_priority_order = []
    # @carted_progress_priority_order << @carted_progress_priority[0][0]
    # @carted_progress_priority_order << @carted_progress_priority[1][0]
    # @carted_progress_priority_order << @carted_progress_priority[2][0]


    # @job_1_job_2 = Geocoder::Calculations.distance_between(@carted_progress_priority[0][6], @carted_progress_priority[1][6])
    # @job_1_job_3 = Geocoder::Calculations.distance_between(@carted_progress_priority[0][6], @carted_progress_priority[2][6])
    # @job_2_job_3 = Geocoder::Calculations.distance_between(@carted_progress_priority[1][6], @carted_progress_priority[2][6])



    # @carted_prog_prior_dist = []
    # if @carted_job_1[@in_progress_position] == true
    #   @carted_prog_prior_dist << @carted_job_1
    # elsif @carted_job_2[@in_progress_position] == true
    #   @carted_prog_prior_dist << @carted_job_2
    # elsif @carted_job_3[@in_progress_position] == true
    #   @carted_prog_prior_dist << @carted_job_3   
    # end

   # @testy = @carted_progress_priority

   # @carted_progress_priority[0] << @job_1_job_2
   # @carted_progress_priority[1] << @job_2_job_3
   # @carted_progress_priority[2] << @job_1_job_3


   #  if @carted_prog_prior_dist.include?(@carted_job_1) == false
   #    @carted_prog_prior_dist << @carted_job_1
   #  end

   #  if @carted_prog_prior_dist.include?(@carted_job_2) == false
   #    @carted_prog_prior_dist << @carted_job_2
   #  end

   #  if @carted_prog_prior_dist.include?(@carted_job_3) == false
   #    @carted_prog_prior_dist << @carted_job_3
   #  end

    

   #  if @carted_progress_priority[1][7] < @carted_progress_priority[2][7]
   #    @carted_prog_prior_dist << @carted_job_3
   #    @carted_prog_prior_dist << @carted_job_2
   #    @carted_prog_prior_dist[0][7] = @job_1_job_3
   #    @carted_prog_prior_dist[1][7] = @job_2_job_3
   #    @carted_prog_prior_dist[2][7] = @job_1_job_2
   #  elsif @carted_progress_priority[1][7] < @carted_progress_priority[2][7]
   #    @carted_prog_prior_dist << @carted_job_2
   #    @carted_prog_prior_dist << @carted_job_3
   #    @carted_prog_prior_dist[0][7] = @job_1_job_2
   #    @carted_prog_prior_dist[1][7] = @job_2_job_3
   #    @carted_prog_prior_dist[2][7] = @job_1_job_3
   #  end

   #  @oranges = @progress_priority
   


   #  @cart_prog_prior_dist_job_1 = @carted_prog_prior_dist[0][0..7]
   #  @cart_prog_prior_dist_job_2 = @carted_prog_prior_dist[1][0..7]
   #  @cart_prog_prior_dist_job_3 = @carted_prog_prior_dist[2][0..7]

   #  @final_job_count = @carted_products.count
   #  @final_element_count = @carted_prog_prior_dist.length / @carted_products.count



   #  @final_order = []

   #  @carted_prog_prior_dist.each do |final|
   #    if final[@in_progress_position] == true
   #      @final_order << final
   #    end
   #  end

   #  @not_final = []

   #  @carted_prog_prior_dist.each do |distance|
   #    if @final_order.include?(distance) == false
   #      @not_final << distance 
   #    end
   #  end


   #  if @not_final[0][@dist_positiion] < @not_final[1][@dist_positiion]
   #    @final_order << @not_final[0]
   #    @final_order << @not_final[1]
   #    @final_order[0][7] = Geocoder::Calculations.distance_between(@final_order[0][6], @not_final[0][6])
   #    @final_order[1][7] = Geocoder::Calculations.distance_between(@not_final[0][6], @not_final[1][6])
   #    @final_order[2][7] = Geocoder::Calculations.distance_between(@not_final[1][6], @final_order[0][6])
   #  elsif @not_final[1][@dist_positiion] < @not_final[0][@dist_positiion]
   #    @final_order << @not_final[1]
   #    @final_order << @not_final[0]
   #    @final_order[0][7] = Geocoder::Calculations.distance_between(@final_order[0][6], @not_final[1][6])
   #    @final_order[1][7] = Geocoder::Calculations.distance_between(@not_final[1][6], @not_final[0][6])
   #    @final_order[2][7] = Geocoder::Calculations.distance_between(@not_final[0][6], @final_order[0][6])
   #  end

   #  @final_job_1 = @final_order[0][7]
   #  @final_job_2 = @final_order[1][7]
   #  @final_job_3 = @final_order[2][7]


  end


  def destroy
    @carted_product = CartedProduct.find(params[:id])
    @carted_product.update(status: "removed")

    flash[:success] = "Job Removed From Route"
    redirect_to "/carted_products"
  end
end