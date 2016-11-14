class CartedProduct < ApplicationRecord 


  include RankedModel
  ranks :row_order

  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :job


end
