in_progress = 10
last_serv = 7
phys_loc = 5
can_do_today = 3
weather_condition = 1

job_1 = can_do_today + in_progress

job_2 = last_serv + in_progress 

job_3 = phys_loc 

job_4 = last_serv + can_do_today

job_5 = phys_loc + can_do_today + last_serv

examples = []

examples << job_1
examples << job_2
examples << job_3
examples << job_4
examples << job_5

p examples.sort! { |x, y| y <=> x }



  def distance
    @carted_products = current_user.currently_carted

    @distance_array = []

    @carted_products.each do |carted_product|
      
      @distance_array << carted_product.job.to_coordinates
      @distance_array << carted_product.job.id

      @distance_array.each do |job|
      end
    end

  end


    @distance = Geocoder::Calculations.distance_between(@distance_hash[14], @distance_hash[5])


    key = 0
    key_to = key + 2

    @carted_products.length.times do 

      @distance = Geocoder::Calculations.distance_between(@distance_array[key], @distance_array[key_to])
      key += 2
      @distance_array << @distance
    end


    
    key = 0
    key_to = key + 2

    @carted_products.length.times do 

      @distance = Geocoder::Calculations.distance_between(@distance_array[key], @distance_array[key_to])
      key += 2
      @distance_array << @distance
    end

    @job_order = []

    current_priority = 0
    @carted_products.each do |carted_product|
      if carted_product.priority > current_priority
        current_priority = carted_product.priority
        @job_order << carted_product.job.id
      elsif carted_product.priority < 1
        @job_order << carted_product.job.id
      end
    end
