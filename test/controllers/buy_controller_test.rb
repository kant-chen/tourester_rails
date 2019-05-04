#require 'test_helper'
#require_relative '../../app/controllers/buy_controller'
require_relative '/usr/local/rbenv/versions/2.3.5/lib/ruby/gems/2.3.0/gems/rspec-3.8.0/lib/rspec'
#class BuyControllerTest < ActionDispatch::IntegrationTest
#  test "should get submit" do
#    get buy_submit_url
#    assert_response :success
#  end
#
#  test "should get index" do
#    get buy_index_url
#    assert_response :success
#  end
#
#end
RSpec.describe "POST buy#submit", :type => :request do
  it "submits order" do
    request_json =  {"order"=>{"first_name"=>"kant", "e_mail"=>"kant@gmail.com", "item"=>{"46"=>1}},
                              "buy"=>{"order"=>{"first_name"=>"kant", "e_mail"=>"kant@gmail.com", "item"=>{"46"=>1}}}}
    post "buy/submit", :params => request_json
    expect(response.body).to include("The order has been received!")

  end
end
