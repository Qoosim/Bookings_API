
require 'acceptance_helper'

resource 'Bike', acceptance: true do
  let!(:user) { create(:user) }
  let!(:bikes) { create_list(:bike, 5, user_id: user.id) }
  before do
    header 'Content-Type', 'application/json'
    header 'Authorization', token_generator(user.id)
    user.to_admin
  end

  get '/v1/bikes' do
    example_request 'Listing bikes' do
      explanation 'List all the bikes in the system no authentication is needed'
      expect(status).to eq 200
    end
  end

  get '/v1/bikes/:id' do
    route_summary 'This is used to display details of a bike .'

    let(:id) { bikes.first.id }
    example_request 'Getting a bike' do
      explanation 'Shows a bike no authentication is needed'
      expect(status).to eq(200)
    end
  end

  post '/v1/bikes' do
    route_summary 'This is used to create bikes.'

    parameter :model, 'Bike model'
    parameter :color, 'Bike color'
    parameter :price, 'Bike price'
    parameter :weight, 'Bike weight'
    parameter :engine_capacity, 'Bike engine capacity'
    parameter :user_id, 'Admin id'

    example_request 'Creating a new bike' do
      explanation 'Creates a new bike requires an admin user to be logged in'
      do_request(model: 'Yamaha 304', color: 'green', price: '50000', weight: '478kg', engine_capacity: '780dc', user_id: user.id.to_s)
      expect(status).to eq(201)
    end
  end

  put '/v1/bikes/:id' do
    route_summary 'This is used to update bikes.'
    let(:id) { bikes.first.id }

    parameter :name, 'Bike name'
    parameter :user_id, 'Admin User id'

    example_request 'Updating a specific Bike' do
      explanation 'Updates a new bike requires an admin user to be logged in'
      do_request(name: 'Vespa', user_id: user.id.to_s)
      expect(status).to eq(204)
    end
  end
end
