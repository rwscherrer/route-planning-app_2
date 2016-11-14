class JobsCategory < ApplicationRecord
  belongs_to :job
  belongs_to :category
end
