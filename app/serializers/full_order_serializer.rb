class FullOrderSerializer < ActiveModel::Serializer
  attributes :id, :order_number, :num_items

  has_many :items, serializer: OrderItemIndexSerializer
  # belongs_to

  def num_items
    object.items.count
    # whatever is being seraialized at that time
    # Order in this case
  end
end
