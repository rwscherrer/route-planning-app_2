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

    @distance_array = []


    


    count = 1
    @carted_products.each do |carted_product|
      
      @distance_array << carted_product.job.id
      @distance_array << carted_product.priority
      @distance_array << carted_product.job.to_coordinates
      @distance_array << carted_product.job.in_progress
      @distance_array << "job_#{count}"
      @distance_array << carted_product.job.full_address
      
      
      count += 1
    end

    @carted_jobs = []

    counter = 1
    @carted_products.each do |carted_product|
      @carted_jobs << "job_#{counter}"
      @carted_jobs << carted_product.job.id
      @carted_jobs << carted_product.job.name 
      @carted_jobs << carted_product.job.full_address
      @carted_jobs << carted_product.priority
      @carted_jobs << carted_product.job.in_progress
      @carted_jobs << carted_product.job.to_coordinates

      counter += 1
    end

    @job_count = @carted_products.count
    @element_count = @distance_array.length / @carted_products.count

    @carted_job_count = @carted_products.count
    @carted_element_count = @carted_jobs.length / @carted_products.count
    

    @in_progress = []

 
    
    @carted_products.each do |carted_product|
      if carted_product.job.in_progress == true
        @in_progress << carted_product.job.id
      end
    end


    @array_id_start = 0
    @array_priority_start = 1
    @array_coord_start = 2
    @array_in_progress_start = 3
    @array_job_name_start = 4
    @array_full_address_start = 5


    @job_number_position = 0
    @id_position = 1
    @job_name_position = 2
    @full_address_position = 3
    @priority_position = 4
    @in_progress_position = 5
    @coord_position = 6
    @dist_positiion = 7

    @job_1 = @distance_array[0..5]
    @job_2 = @distance_array[6..11]
    @job_3 = @distance_array[12..17]
    @job_4 = @distance_array[18..23]
    @job_5 = @distance_array[24..29]
    @job_6 = @distance_array[30..35]
    @job_7 = @distance_array[36..41]
    @job_8 = @distance_array[42..47]
    @job_9 = @distance_array[48..53]
    @job_10 = @distance_array[54..59]

    @carted_job_1 = @carted_jobs[0..6]
    @carted_job_2 = @carted_jobs[7..13]
    @carted_job_3 = @carted_jobs[14..21]



    
    if @job_count == 1
      @job_1_id = @job_1[0]
      @job_1_priority = @job_1[1]
      @job_1_coord = @job_1[2]
      @job_1_in_progress = @job_1[3]
      @job_1_name = @job_1[4]
      @job_1_address = @job_1[5]
    elsif @job_count == 2
      @job_1_id = @job_1[0]
      @job_1_priority = @job_1[1]
      @job_1_coord = @job_1[2]
      @job_1_in_progress = @job_1[3]
      @job_1_name = @job_1[4]
      @job_1_address = @job_1[5]
      @job_2_id = @job_2[0]
      @job_2_priority = @job_2[1]
      @job_2_coord = @job_2[2]
      @job_2_in_progress = @job_2[3]
      @job_2_name = @job_2[4]
      @job_2_address = @job_2[5]
    elsif @job_count == 3
      @job_1_id = @job_1[0]
      @job_1_priority = @job_1[1]
      @job_1_coord = @job_1[2]
      @job_1_in_progress = @job_1[3]
      @job_1_name = @job_1[4]
      @job_1_address = @job_1[5]
      @job_2_id = @job_2[0]
      @job_2_priority = @job_2[1]
      @job_2_coord = @job_2[2]
      @job_2_in_progress = @job_2[3]
      @job_2_name = @job_2[4]
      @job_2_address = @job_2[5]
      @job_3_id = @job_3[0]
      @job_3_priority = @job_3[1]
      @job_3_coord = @job_3[2]
      @job_3_in_progress = @job_3[3]
      @job_3_name = @job_3[4]
      @job_3_address = @job_3[5]
    # # elsif @job_count == 4
    # #   @job_1_id = @job_1[0]
    # #   @job_1_priority = @job_1[1]
    # #   @job_1_coord = @job_1[2]
    # #   @job_1_in_progress = @job_1[3]
    # #   @job_1_name = @job_1[4]
    # #   @job_1_address = @job_1[5]
    # #   @job_2_id = @job_2[0]
    # #   @job_2_priority = @job_2[1]
    # #   @job_2_coord = @job_2[2]
    # #   @job_2_in_progress = @job_2[3]
    # #   @job_2_name = @job_2[4]
    # #   @job_2_address = @job_2[5]
    # #   @job_3_id = @job_3[0]
    # #   @job_3_priority = @job_3[1]
    # #   @job_3_coord = @job_3[2]
    # #   @job_3_in_progress = @job_3[3]
    # #   @job_3_name = @job_3[4]
    # #   @job_3_address = @job_3[5]
    # #   @job_4_id = @job_4[0]
    # #   @job_4_priority = @job_4[1]
    # #   @job_4_coord = @job_4[2]
    # #   @job_4_in_progress = @job_4[3]
    # #   @job_4_name = @job_4[4]
    # #   @job_4_address = @job_4[5]
    # # elsif @job_count == 5
    # #   @job_1_id = @job_1[0]
    # #   @job_1_priority = @job_1[1]
    # #   @job_1_coord = @job_1[2]
    # #   @job_1_in_progress = @job_1[3]
    # #   @job_1_name = @job_1[4]
    # #   @job_1_address = @job_1[5]
    # #   @job_2_id = @job_2[0]
    # #   @job_2_priority = @job_2[1]
    # #   @job_2_coord = @job_2[2]
    # #   @job_2_in_progress = @job_2[3]
    # #   @job_2_name = @job_2[4]
    # #   @job_2_address = @job_2[5]
    # #   @job_3_id = @job_3[0]
    # #   @job_3_priority = @job_3[1]
    # #   @job_3_coord = @job_3[2]
    # #   @job_3_in_progress = @job_3[3]
    # #   @job_3_name = @job_3[4]
    # #   @job_3_address = @job_3[5]
    # #   @job_4_id = @job_4[0]
    # #   @job_4_priority = @job_4[1]
    # #   @job_4_coord = @job_4[2]
    # #   @job_4_in_progress = @job_4[3]
    # #   @job_4_name = @job_4[4]
    # #   @job_4_address = @job_4[5]
    # #   @job_5_id = @job_5[0]
    # #   @job_5_priority = @job_5[1]
    # #   @job_5_coord = @job_5[2]
    # #   @job_5_in_progress = @job_5[3]
    # #   @job_5_name = @job_5[4]
    # #   @job_5_address = @job_5[5]
    # # elsif @job_count == 6
    # #   @job_1_id = @job_1[0]
    # #   @job_1_priority = @job_1[1]
    # #   @job_1_coord = @job_1[2]
    # #   @job_1_in_progress = @job_1[3]
    # #   @job_1_name = @job_1[4]
    # #   @job_1_address = @job_1[5]
    # #   @job_2_id = @job_2[0]
    # #   @job_2_priority = @job_2[1]
    # #   @job_2_coord = @job_2[2]
    # #   @job_2_in_progress = @job_2[3]
    # #   @job_2_name = @job_2[4]
    # #   @job_2_address = @job_2[5]
    # #   @job_3_id = @job_3[0]
    # #   @job_3_priority = @job_3[1]
    # #   @job_3_coord = @job_3[2]
    # #   @job_3_in_progress = @job_3[3]
    # #   @job_3_name = @job_3[4]
    # #   @job_3_address = @job_3[5]
    # #   @job_4_id = @job_4[0]
    # #   @job_4_priority = @job_4[1]
    # #   @job_4_coord = @job_4[2]
    # #   @job_4_in_progress = @job_4[3]
    # #   @job_4_name = @job_4[4]
    # #   @job_4_address = @job_4[5]
    # #   @job_5_id = @job_5[0]
    # #   @job_5_priority = @job_5[1]
    # #   @job_5_coord = @job_5[2]
    # #   @job_5_in_progress = @job_5[3]
    # #   @job_5_name = @job_5[4]
    # #   @job_5_address = @job_5[5]
    # #   @job_6_id = @job_6[0]
    # #   @job_6_priority = @job_6[1]
    # #   @job_6_coord = @job_6[2]
    # #   @job_6_in_progress = @job_6[3]
    # #   @job_6_name = @job_6[4]
    # #   @job_6_address = @job_6[5]
    # # elsif @job_count == 7
    # #   @job_1_id = @job_1[0]
    # #   @job_1_priority = @job_1[1]
    # #   @job_1_coord = @job_1[2]
    # #   @job_1_in_progress = @job_1[3]
    # #   @job_1_name = @job_1[4]
    # #   @job_1_address = @job_1[5]
    # #   @job_2_id = @job_2[0]
    # #   @job_2_priority = @job_2[1]
    # #   @job_2_coord = @job_2[2]
    # #   @job_2_in_progress = @job_2[3]
    # #   @job_2_name = @job_2[4]
    # #   @job_2_address = @job_2[5]
    # #   @job_3_id = @job_3[0]
    # #   @job_3_priority = @job_3[1]
    # #   @job_3_coord = @job_3[2]
    # #   @job_3_in_progress = @job_3[3]
    # #   @job_3_name = @job_3[4]
    # #   @job_3_address = @job_3[5]
    # #   @job_4_id = @job_4[0]
    # #   @job_4_priority = @job_4[1]
    # #   @job_4_coord = @job_4[2]
    # #   @job_4_in_progress = @job_4[3]
    # #   @job_4_name = @job_4[4]
    # #   @job_4_address = @job_4[5]
    # #   @job_5_id = @job_5[0]
    # #   @job_5_priority = @job_5[1]
    # #   @job_5_coord = @job_5[2]
    # #   @job_5_in_progress = @job_5[3]
    # #   @job_5_name = @job_5[4]
    # #   @job_5_address = @job_5[5]
    # #   @job_6_id = @job_6[0]
    # #   @job_6_priority = @job_6[1]
    # #   @job_6_coord = @job_6[2]
    # #   @job_6_in_progress = @job_6[3]
    # #   @job_6_name = @job_6[4]
    # #   @job_6_address = @job_6[5]
    # #   @job_7_id = @job_7[0]
    # #   @job_7_priority = @job_7[1]
    # #   @job_7_coord = @job_7[2]
    # #   @job_7_in_progress = @job_7[3]
    # #   @job_7_name = @job_7[4]
    # #   @job_7_address = @job_7[5]
    # # elsif @job_count == 8
    # #   @job_1_id = @job_1[0]
    # #   @job_1_priority = @job_1[1]
    # #   @job_1_coord = @job_1[2]
    # #   @job_1_in_progress = @job_1[3]
    # #   @job_1_name = @job_1[4]
    # #   @job_1_address = @job_1[5]
    # #   @job_2_id = @job_2.flatten[0]
    # #   @job_2_priority = @job_2[1]
    # #   @job_2_coord = @job_2[2]
    # #   @job_2_in_progress = @job_2[3]
    # #   @job_2_name = @job_2[4]
    # #   @job_2_address = @job_2[5]
    # #   @job_3_id = @job_3[0]
    # #   @job_3_priority = @job_3[1]
    # #   @job_3_coord = @job_3[2]
    # #   @job_3_in_progress = @job_3[3]
    # #   @job_3_name = @job_3[4]
    # #   @job_3_address = @job_3[5]
    # #   @job_4_id = @job_4[0]
    # #   @job_4_priority = @job_4[1]
    # #   @job_4_coord = @job_4[2]
    # #   @job_4_in_progress = @job_4[3]
    # #   @job_4_name = @job_4[4]
    # #   @job_4_address = @job_4[5]
    # #   @job_5_id = @job_5[0]
    # #   @job_5_priority = @job_5[1]
    # #   @job_5_coord = @job_5[2]
    # #   @job_5_in_progress = @job_5[3]
    # #   @job_5_name = @job_5[4]
    # #   @job_5_address = @job_5[5]
    # #   @job_6_id = @job_6[0]
    # #   @job_6_priority = @job_6[1]
    # #   @job_6_coord = @job_6[2]
    # #   @job_6_in_progress = @job_6[3]
    # #   @job_6_name = @job_6[4]
    # #   @job_6_address = @job_6[5]
    # #   @job_7_id = @job_7[0]
    # #   @job_7_priority = @job_7[1]
    # #   @job_7_coord = @job_7[2]
    # #   @job_7_in_progress = @job_7[3]
    # #   @job_7_name = @job_7[4]
    # #   @job_7_address = @job_7[5]
    # #   @job_8_id = @job_8[0]
    # #   @job_8_priority = @job_8[1]
    # #   @job_8_coord = @job_8[2]
    # #   @job_8_in_progress = @job_8[3]
    # #   @job_8_name = @job_8[4]
    # #   @job_8_address = @job_8[5]
    # # elsif @job_count == 9
    # #   @job_1_id = @job_1[0]
    # #   @job_1_priority = @job_1[1]
    # #   @job_1_coord = @job_1[2]
    # #   @job_1_in_progress = @job_1[3]
    # #   @job_1_name = @job_1[4]
    # #   @job_1_address = @job_1[5]
    # #   @job_2_id = @job_2.flatten[0]
    # #   @job_2_priority = @job_2[1]
    # #   @job_2_coord = @job_2[2]
    # #   @job_2_in_progress = @job_2[3]
    # #   @job_2_name = @job_2[4]
    # #   @job_2_address = @job_2[5]
    # #   @job_3_id = @job_3[0]
    # #   @job_3_priority = @job_3[1]
    # #   @job_3_coord = @job_3[2]
    # #   @job_3_in_progress = @job_3[3]
    # #   @job_3_name = @job_3[4]
    # #   @job_3_address = @job_3[5]
    # #   @job_4_id = @job_4[0]
    # #   @job_4_priority = @job_4[1]
    # #   @job_4_coord = @job_4[2]
    # #   @job_4_in_progress = @job_4[3]
    # #   @job_4_name = @job_4[4]
    # #   @job_4_address = @job_4[5]
    # #   @job_5_id = @job_5[0]
    # #   @job_5_priority = @job_5[1]
    # #   @job_5_coord = @job_5[2]
    # #   @job_5_in_progress = @job_5[3]
    # #   @job_5_name = @job_5[4]
    # #   @job_5_address = @job_5[5]
    # #   @job_6_id = @job_6[0]
    # #   @job_6_priority = @job_6[1]
    # #   @job_6_coord = @job_6[2]
    # #   @job_6_in_progress = @job_6[3]
    # #   @job_6_name = @job_6[4]
    # #   @job_6_address = @job_6[5]
    # #   @job_7_id = @job_7[0]
    # #   @job_7_priority = @job_7[1]
    # #   @job_7_coord = @job_7[2]
    # #   @job_7_in_progress = @job_7[3]
    # #   @job_7_name = @job_7[4]
    # #   @job_7_address = @job_7[5]
    # #   @job_8_id = @job_8[0]
    # #   @job_8_priority = @job_8[1]
    # #   @job_8_coord = @job_8[2]
    # #   @job_8_in_progress = @job_8[3]
    # #   @job_8_name = @job_8[4]
    # #   @job_8_address = @job_8[5]
    # #   @job_9_id = @job_9[0]
    # #   @job_9_priority = @job_9[1]
    # #   @job_9_coord = @job_9[2]
    # #   @job_9_in_progress = @job_9[3]
    # #   @job_9_name = @jbo_9[4]
    # #   @job_9_address = @job_9[5]
    # # elsif @job_count == 10
    # #   @job_1_id = @job_1[0]
    # #   @job_1_priority = @job_1[1]
    # #   @job_1_coord = @job_1[2]
    # #   @job_1_in_progress = @job_1[3]
    # #   @job_1_name = @job_1[4]
    # #   @job_1_address = @job_1[5]
    # #   @job_2_id = @job_2.flatten[0]
    # #   @job_2_priority = @job_2[1]
    # #   @job_2_coord = @job_2[2]
    # #   @job_2_in_progress = @job_2[3]
    # #   @job_2_name = @job_2[4]
    # #   @job_2_address = @job_2[5]
    # #   @job_3_id = @job_3[0]
    # #   @job_3_priority = @job_3[1]
    # #   @job_3_coord = @job_3[2]
    # #   @job_3_in_progress = @job_3[3]
    # #   @job_3_name = @job_3[4]
    # #   @job_3_address = @job_3[5]
    # #   @job_4_id = @job_4[0]
    # #   @job_4_priority = @job_4[1]
    # #   @job_4_coord = @job_4[2]
    # #   @job_4_in_progress = @job_4[3]
    # #   @job_4_name = @job_4[4]
    # #   @job_4_address = @job_4[5]
    # #   @job_5_id = @job_5[0]
    # #   @job_5_priority = @job_5[1]
    # #   @job_5_coord = @job_5[2]
    # #   @job_5_in_progress = @job_5[3]
    # #   @job_5_name = @job_5[4]
    # #   @job_5_address = @job_5[5]
    # #   @job_6_id = @job_6[0]
    # #   @job_6_priority = @job_6[1]
    # #   @job_6_coord = @job_6[2]
    # #   @job_6_in_progress = @job_6[3]
    # #   @job_6_name = @job_6[4]
    # #   @job_6_address = @job_6[5]
    # #   @job_7_id = @job_7[0]
    # #   @job_7_priority = @job_7[1]
    # #   @job_7_coord = @job_7[2]
    # #   @job_7_in_progress = @job_7[3]
    # #   @job_7_name = @job_7[4]
    # #   @job_7_address = @job_7[5]
    # #   @job_8_id = @job_8[0]
    # #   @job_8_priority = @job_8[1]
    # #   @job_8_coord = @job_8[2]
    # #   @job_8_in_progress = @job_8[3]
    # #   @job_8_name = @job_8[4]
    # #   @job_8_address = @job_8[5]
    # #   @job_9_id = @job_9[0]
    # #   @job_9_priority = @job_9[1]
    # #   @job_9_coord = @job_9[2]
    # #   @job_9_in_progress = @job_9[3]
    # #   @job_9_name = @jbo_9[4]
    # #   @job_9_address = @job_9[5]
    # #   @job_10_id = @job_10[0]
    # #   @job_10_priority = @job_10[1]
    # #   @job_10_coord = @job_10[2]
    # #   @job_10_in_progress = @job_10[3]
    # #   @job_10_name = @job_10[4]
    # #   @job_10_address = @job_10[5]
    end
      
    @priority_order = []

    @carted_priority = []



    # @priority_order.sort! { |x, y| y <=> x }


    if @job_1_priority > @job_2_priority && @job_1_priority > @job_3_priority
      @priority_order << @job_1
      if @job_2_priority > @job_3_priority
        @priority_order << @job_2
        @priority_order << @job_3
      elsif @priority_order << @job_3
        @priority_order << @job_2
      end
    elsif @job_2_priority > @job_1_priority && @job_2_priority > @job_3_priority
      @priority_order << @job_2
      if @job_1_priority > @job_3_priority
        @priority_order << @job_1
        @priority_order << @job_3
      elsif @priority_order << @job_3
        @priority_order << @job_1
      end
    elsif @job_3_priority > @job_1_priority && @job_3_priority > @job_2_priority
      @priority_order << @job_3
      if @job_1_priority > @job_2_priority
        @priority_order << @job_1
        @priority_order << @job_2
      elsif @priority_order << @job_2
        @priority_order << @job_3
      end
    end


    if @carted_job_1[@priority_position] > @carted_job_2[@priority_position] && @carted_job_1[@priority_position] > @carted_job_3[@priority_position]
        @carted_priority << @carted_job_1
        if @carted_job_2[@priority_position] > @carted_job_3[@priority_position]
            @carted_priority << @carted_job_2
            @carted_priority << @carted_job_3
        elsif @carted_job_3[@priority_position] > @carted_job_2[@priority_position]
            @carted_priority << @carted_job_3
            @carted_priority << @carted_job_2
        end
    elsif @carted_job_2[@priority_position] > @carted_job_1[@priority_position] && @carted_job_2[@priority_position] > @carted_job_3[@priority_position]
        @carted_priority << @carted_job_2
        if @carted_job_1[@priority_position] > @carted_job_3[@priority_position]
            @carted_priority << @carted_job_1
            @carted_priority << @carted_job_3
        elsif @carted_job_3[@priority_position] > @carted_job_1[@priority_position]
            @carted_priority << @carted_job_3
            @carted_priority << @carted_job_1
        end
    elsif @carted_job_3[priority_position] > @carted_job_1[@priority_position] && @carted_job_3[@priority_position] > @carted_job_2[@priority_position]
        @carted_priority << @carted_job_3
        @carted_priority << @carted_job_1
        if @carted_job_1[@priority_position] > @carted_job_2[@priority_position]
            @carted_priority << @carted_job_1
            @carted_priority << @carted_job_2
        elsif @carted_job_2[@priority_position] > @carted_job_1[@priority_position]
            @carted_priority << @carted_job_2
            @carted_priority << @carted_job_1
        end
    end

    
    @progress_priority = []
    in_progress_count = 1
    if @job_1_in_progress == true
      @progress_priority << @job_1
    elsif @job_2_in_progress == true
      @progress_priority << @job_2
    elsif @job_3_in_progress == true
      @progress_priority << @job_3   
    end

    @carted_progress_priority = []

    if @carted_job_1[@in_progress_position] == true
      @carted_progress_priority << @carted_job_1
    elsif @carted_job_2[@in_progress_position] == true
      @carted_progress_priority << @carted_job_2
    elsif @carted_job_3[@in_progress_position] == true
      @carted_progress_priority << @carted_job_3
    end


 
    if @progress_priority.include?(@job_1) == false
      @progress_priority << @job_1
    end

    if @progress_priority.include?(@job_2) == false
      @progress_priority << @job_2
    end

    if @progress_priority.include?(@job_3) == false
      @progress_priority << @job_3
    end


    if @carted_progress_priority.include?(@carted_job_1) == false
      @carted_progress_priority << @carted_job_1
    end

    if @carted_progress_priority.include?(@carted_job_2) == false
      @carted_progress_priority << @carted_job_2
    end

    if @carted_progress_priority.include?(@carted_job_3) == false
      @carted_progress_priority << @carted_job_3
    end

    @testy = @carted_progress_priority

    @prog_prior_order = []
    @prog_prior_order << @progress_priority[0][4]
    @prog_prior_order << @progress_priority[1][4]
    @prog_prior_order << @progress_priority[2][4]

    @test_order = @carted_progress_priority[0][0]

    @carted_progress_priority_order = []
    @carted_progress_priority_order << @carted_progress_priority[0][0]
    @carted_progress_priority_order << @carted_progress_priority[1][0]
    @carted_progress_priority_order << @carted_progress_priority[2][0]




    @job_1_job_2 = Geocoder::Calculations.distance_between(@carted_progress_priority[0][6], @carted_progress_priority[1][6])
    @job_1_job_3 = Geocoder::Calculations.distance_between(@carted_progress_priority[0][6], @carted_progress_priority[2][6])
    @job_2_job_3 = Geocoder::Calculations.distance_between(@carted_progress_priority[1][6], @carted_progress_priority[2][6])


    @job_1_job_2 = Geocoder::Calculations.distance_between(@progress_priority[0][2], @progress_priority[1][2])
    @job_1_job_3 = Geocoder::Calculations.distance_between(@progress_priority[0][2], @progress_priority[2][2])
    @job_2_job_3 = Geocoder::Calculations.distance_between(@progress_priority[1][2], @progress_priority[2][2])





    @prog_prior_dist = []
    if @job_1_in_progress == true
      @prog_prior_dist << @job_1
    elsif @job_2_in_progress == true
      @prog_prior_dist << @job_2
    elsif @job_3_in_progress == true
      @prog_prior_dist << @job_3   
    end



    @carted_prog_prior_dist = []
    if @carted_job_1[@in_progress_position] == true
      @carted_prog_prior_dist << @carted_job_1
    elsif @carted_job_2[@in_progress_position] == true
      @carted_prog_prior_dist << @carted_job_2
    elsif @carted_job_3[@in_progress_position] == true
      @carted_prog_prior_dist << @carted_job_3   
    end

   @testy = @carted_progress_priority

   @carted_progress_priority[0] << @job_1_job_2
   @carted_progress_priority[1] << @job_2_job_3
   @carted_progress_priority[2] << @job_1_job_3

    if @progress_priority[1][5] < @progress_priority[2][5]
      @prog_prior_dist << @job_3
      @prog_prior_dist << @job_2
      @prog_prior_dist[0][5] = @job_1_job_3
      @prog_prior_dist[1][5] = @job_2_job_3
      @prog_prior_dist[2][5] = @job_1_job_2
    elsif @progress_priority[1][5] < @progress_priority[2][5]
      @prog_prior_dist << @job_2
      @prog_prior_dist << @job_3
      @prog_prior_dist[0][5] = @job_1_job_2
      @prog_prior_dist[1][5] = @job_2_job_3
      @prog_prior_dist[2][5] = @job_1_job_3
    end

    if @carted_prog_prior_dist.include?(@carted_job_1) == false
      @carted_prog_prior_dist << @carted_job_1
    end

    if @carted_prog_prior_dist.include?(@carted_job_2) == false
      @carted_prog_prior_dist << @carted_job_2
    end

    if @carted_prog_prior_dist.include?(@carted_job_3) == false
      @carted_prog_prior_dist << @carted_job_3
    end

    

    if @carted_progress_priority[1][7] < @carted_progress_priority[2][7]
      @carted_prog_prior_dist << @carted_job_3
      @carted_prog_prior_dist << @carted_job_2
      @carted_prog_prior_dist[0][7] = @job_1_job_3
      @carted_prog_prior_dist[1][7] = @job_2_job_3
      @carted_prog_prior_dist[2][7] = @job_1_job_2
    elsif @carted_progress_priority[1][7] < @carted_progress_priority[2][7]
      @carted_prog_prior_dist << @carted_job_2
      @carted_prog_prior_dist << @carted_job_3
      @carted_prog_prior_dist[0][7] = @job_1_job_2
      @carted_prog_prior_dist[1][7] = @job_2_job_3
      @carted_prog_prior_dist[2][7] = @job_1_job_3
    end

    @oranges = @progress_priority
   

    # if @progress_priority[1][5] < @progress_priority[2][5]
    #   @prog_prior_dist << @job_3
    #   @prog_prior_dist << @job_2
    #   @prog_prior_dist[0][5] = @job_1_job_3
    #   @prog_prior_dist[1][5] = @job_2_job_3
    #   @prog_prior_dist[2][5] = @job_1_job_2
    # elsif @progress_priority[1][5] < @progress_priority[2][5]
    #   @prog_prior_dist << @job_2
    #   @prog_prior_dist << @job_3
    #   @prog_prior_dist[0][5] = @job_1_job_2
    #   @prog_prior_dist[1][5] = @job_2_job_3
    #   @prog_prior_dist[2][5] = @job_1_job_3
    # end


    @cart_prog_prior_dist_job_1 = @carted_prog_prior_dist[0][0..7]
    @cart_prog_prior_dist_job_2 = @carted_prog_prior_dist[1][0..7]
    @cart_prog_prior_dist_job_3 = @carted_prog_prior_dist[2][0..7]

    @final_job_count = @carted_products.count
    @final_element_count = @carted_prog_prior_dist.length / @carted_products.count



    @final_order = []

    @carted_prog_prior_dist.each do |final|
      if final[@in_progress_position] == true
        @final_order << final
      end
    end

    # if @final_order.include?(@cart_prog_prior_dist_job_1) == false
    #   if @cart_prog_prior_dist_job_1[7] < @cart









  end


  def destroy
    @carted_product = CartedProduct.find(params[:id])
    @carted_product.update(status: "removed")

    flash[:success] = "Job Removed From Route"
    redirect_to "/carted_products"
  end
end