require 'rails_helper'
RSpec.describe "POST buy#submit", :type => :request do
  it "submits order" do
    request_json2 = {"order"=>{"first_name"=>"fe", "e_mail"=>"fe", "item"=>{"46"=>"1"}},"controller"=>"buy", "action"=>"submit","buy"=>{"order"=>{"first_name"=>"fe", "e_mail"=>"fe", "item"=>{"46"=>1}}}}
    headers = {"ACCEPT" => 'application/json'}
    post '/buy/submit', :params =>request_json2
    #puts response.body
    expect(response).to have_http_status(200)
  end
end
