require 'rails_helper'
require 'spec_helper'
 
describe Event do
  
 context 'eventbrite' do    
#       subject(:unirestObject) { Event.run_eventbrite_query({ 'radius' => '25', 'lat' => 30.269870, 'lon' => -97.742393 }) }
    
    context '#run_eventbrite_query' do
      xit { is_expected.to be_kind_of(Object) }
      
      xit 'response body contains data' do
        expect(unirestObject.body['events']).not_to be_empty     
      end    
    end
    
    context '#parse_eventbrite_data' do
#       let(:events){ Event.parse_eventbrite_data unirestObject }
#       subject(:event){ events.first}
      
      xit 'returns array' do
        expect(events).to be_kind_of(Array)
      end
      
      xit { is_expected.to be_kind_of(Object) }
      xit { is_expected.to have_key(:name) }
      xit { is_expected.to have_key(:event_type) }
      xit { is_expected.to have_key(:location) }
      xit { is_expected.to have_key(:utc_start) }
      xit { is_expected.to have_key(:utc_end) }
      xit { is_expected.to have_key(:attendees) }
      xit { is_expected.to have_key(:cost) }
      xit { is_expected.to have_key(:created_at) }
      xit { is_expected.to have_key(:updated_at) }
      xit { is_expected.to have_key(:description) }
      xit { is_expected.to have_key(:lat) }
      xit { is_expected.to have_key(:long) }
      xit { is_expected.to have_key(:event_url) }
      xit { is_expected.to have_key(:source) }
      xit { is_expected.to have_key(:date_start) }
      xit { is_expected.to have_key(:date_end) }
      xit { is_expected.to have_key(:time_start) }
      xit { is_expected.to have_key(:time_end) }
      xit { is_expected.to have_key(:venue) }     
    end
  end
  
  context 'meetup' do
    context '#retrieve_all_meetup_categories' do
#       let(:categories){ Event.retrieve_all_meetup_categories({ 'radius' => '25', 'lat' => 30.269870, 'lon' => -97.742393 })}
#       subject(:params){ categories.first}
      
      xit 'should return array' do
        expect(categories).to be_kind_of(Array)
      end
      
      xit { is_expected.to have_key(:lat) }
      xit { is_expected.to have_key(:lon) }
      xit { is_expected.to have_key(:radius) }
      xit { is_expected.to have_key(:name) }
      xit { is_expected.to have_key(:id) }
      
    end
    
    context '#run_meetup_query' do 
#       let(:events){ Event.run_meetup_query({category_id: '1', 'radius' => '25', 'lat' => 30.269870, 'lon' => -97.742393 })}
#       subject(:event) { events.first}
        
      xit 'returns array' do
        expect(events).to be_kind_of(Array)
      end
        
      xit { is_expected.to be_kind_of(Object) }
      xit { is_expected.to have_key(:name) }
      xit { is_expected.to have_key(:event_type) }
      xit { is_expected.to have_key(:location) }
      xit { is_expected.to have_key(:utc_start) }
      xit { is_expected.to have_key(:utc_end) }
      xit { is_expected.to have_key(:attendees) }
      xit { is_expected.to have_key(:cost) }
      xit { is_expected.to have_key(:created_at) }
      xit { is_expected.to have_key(:updated_at) }
      xit { is_expected.to have_key(:description) }
      xit { is_expected.to have_key(:lat) }
      xit { is_expected.to have_key(:long) }
      xit { is_expected.to have_key(:event_url) }
      xit { is_expected.to have_key(:source) }
      xit { is_expected.to have_key(:date_start) }
      xit { is_expected.to have_key(:date_end) }
      xit { is_expected.to have_key(:time_start) }
      xit { is_expected.to have_key(:time_end) }
      xit { is_expected.to have_key(:venue) } 
    end
  end
  
    context '#run_songkick_query' do
#       let(:events){ Event.run_songkick_query({ lat: 30.269870, lon: -97.742393 })}
#       subject(:event) { events.first }
        
      xit 'returns array' do
        expect(events).to be_kind_of(Array)
      end
        
      xit { is_expected.to be_kind_of(Object) }
      xit { is_expected.to have_key(:name) }
      xit { is_expected.to have_key(:event_type) }
      xit { is_expected.to have_key(:location) }
      xit { is_expected.to have_key(:utc_start) }
      xit { is_expected.to have_key(:utc_end) }
      xit { is_expected.to have_key(:attendees) }
      xit { is_expected.to have_key(:cost) }
      xit { is_expected.to have_key(:created_at) }
      xit { is_expected.to have_key(:updated_at) }
      xit { is_expected.to have_key(:description) }
      xit { is_expected.to have_key(:lat) }
      xit { is_expected.to have_key(:long) }
      xit { is_expected.to have_key(:event_url) }
      xit { is_expected.to have_key(:source) }
      xit { is_expected.to have_key(:date_start) }
      xit { is_expected.to have_key(:date_end) }
      xit { is_expected.to have_key(:time_start) }
      xit { is_expected.to have_key(:time_end) }
      xit { is_expected.to have_key(:venue) } 
    end
  
  context '#address_to_latlon' do
    context 'with address' do
      subject(:params) { Event.address_to_latlon({address: '716 Congress Ave'}) }
    
      xit { is_expected.to be_kind_of(Object) }
      xit { is_expected.to have_key(:lat) }
      xit { is_expexted.to have_key(:lon) }
    end
    
    context 'with city' do
      subject(:params) { Event.address_to_latlon({ city: 'Austin' }) }
      
      xit { is_expected.to be_kind_of(Object) }
      xit { is_expected.to have_key(:lat) }
      xit { is_expexted.to have_key(:lon) }
    end
    
    context 'with zipcode' do
       subject(:params) { Event.address_to_latlon({ zipcode: '78701' }) }
      
      xit { is_expected.to be_kind_of(Object) }
      xit { is_expected.to have_key(:lat) }
      xit { is_expexted.to have_key(:lon) }
    end 
  end

end  

