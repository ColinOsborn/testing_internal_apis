require 'test_helper'

class Api::V1::ItemsControllerTest < ActionDispatch::IntegrationTest

  test "can get list of items " do
    get "/api/v1/items.json"

    assert_response :success

    items = JSON.parse(response.body)
    assert_equal 2, items.count
    # test for any 200 response code
    # response gets set as part of the rails magic, so you don't have to set it
    # it's just automatically generated when you call your verb/path combo
  end
  test "can get a single item" do
    item = items(:one)
    get "/api/v1/items/#{item.id}"

    assert_response :success
    parsed_item = JSON.parse(response.body)
    assert_equal item.id, parsed_item["id"]
    assert_equal item.name, parsed_item["name"]
    assert_equal item.description, parsed_item["description"]
  end
  test "can create a new item" do
    item_params = {name: "Saw", description: "I want to play a game"}
    post "/api/v1/items.json", params: {item: item_params}

    assert_response :success

    parsed_item = JSON.parse(response.body)
    item = Item.last

    assert_equal item.id, parsed_item["id"]
    assert_equal item.name, parsed_item["name"]
    assert_equal item.description, parsed_item["description"]
  end
  test "can update an item" do
    original_item = items(:two)
    item_params = {name: "Hack Saw"}
    patch "/api/v1/items/#{original_item.id}", params: {item: item_params}

    assert_response :success
    updated_item = JSON.parse(response.body)
    assert_equal item_params[:name], updated_item["name"]
  end

end
