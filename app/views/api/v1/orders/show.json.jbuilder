json.extract! @order, :id, :created_at, :updated_at
json.num_items @order.items.count

json.items(@order.items) do |item|
  json.extract! item, :id, :name
end
