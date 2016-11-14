class Job < ApplicationRecord

  belongs_to :user
  has_many :jobs_categories
  has_many :categories, through: :jobs_categories

  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.address_1.present? and obj.address_1_changed? }

  def full_address
    [address_1, city, state, zip].compact.join(', ')
  end

  def friendly_service_date
    last_service_date&.strftime("%b %e")
  end


  def days_between
    if last_service_date
      calc = (last_service_date - Time.now) * -1
      @days_between = calc / 86400
    else
      0
    end


  end



  # def priority

  #   in_progress_list = []

  #   @jobs.each do |job|
  #   if in_progress = true
  #     in_progress_list << job
      
  #   end
  #   in_progress_list.order_by('in_progress DESC')
    
  # end

end