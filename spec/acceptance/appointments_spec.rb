require 'acceptance_helper'

resource 'Bike', acceptance: true do
  let!(:user) { create(:user) }
  let!(:bike) { create(:bike, user_id: user.id) }
  let!(:appointments) { create_list(:appointment, 5, user_id: user.id, bike_id: bike.id) }
  before do
    header 'Content-Type', 'application/json'
    header 'Authorization', token_generator(user.id)
    # user.to_admin
  end

  get '/v1/appointments' do
    example_request 'Listing appointments' do
      explanation 'List all the appointments in the system no authentication is needed'
      expect(status).to eq 200
    end
  end

  get '/v1/appointments/:id' do
    route_summary 'This is used to display details of an appointment .'

    let(:id) { appointments.first.id }
    example_request 'Getting an appointment' do
      explanation 'Shows an appointment no authentication is needed'
      expect(status).to eq(200)
    end
  end

  post '/v1/appointments' do
    route_summary 'This is used to create appointments.'

    parameter :user_id, 'Login User'
    parameter :bike_id, 'Chosen bike by the user'
    parameter :date, 'Day of the appointment'
    parameter :time, 'Time of the appointment'
    parameter :location, 'Where to try the bike to'

    example_request 'Creating a new appointment' do
      explanation 'Creates a new appointment requires a user to be logged in'
      do_request(user_id: user.id.to_s, bike_id: bike.id.to_s, date: '2020/09/04', time: '18:00', location: 'Lagos')
      expect(status).to eq(201)
    end
  end

  put '/v1/appointments/:id' do
    route_summary 'This is used to update appointments.'
    let(:id) { appointments.first.id }

    parameter :user_id, 'Login User'
    parameter :bike_id, 'Chosen bike by the user'
    parameter :date, 'Day of the appointment'
    parameter :time, 'Time of the appointment'
    parameter :location, 'Where to try the bike to'

    example_request 'Updating a specific appointment' do
      explanation 'Updates a new b requires an admin user to be logged in'
      do_request(user_id: user.id.to_s, bike_id: bike.id.to_s, date: '2020/09/07', time: '02:00', location: 'Ibadan')
      expect(status).to eq(204)
    end
  end
end
