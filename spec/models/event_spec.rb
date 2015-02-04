require 'rails_helper'
require 'spec_helper'

describe Event do
  
 context 'eventbrite' do
    subject(:unirestObject) { Event.run_eventbrite_query({ 'lat' => 30.269870, 'lon' => -97.742393, 'radius' => '5' })}
    
    context '#run_eventbrite_query' do
      it { is_expected.to be_kind_of(Object) }
      
      it 'response body contains data' do
        expect(unirestObject.body['events']).not_to be_empty      
      end    
    end
    
    context '#parse_eventbrite_data' do
      let(:events){ Event.parse_eventbrite_data unirestObject }
      subject(:event){ events.first}
      
      it 'returns array' do
        expect(events).to be_kind_of(Array)
      end
      
      it { is_expected.to be_kind_of(Object) }
      it { is_expected.to have_key(:name) }
      it { is_expected.to have_key(:event_type) }
      it { is_expected.to have_key(:location) }
      it { is_expected.to have_key(:utc_start) }
      it { is_expected.to have_key(:utc_end) }
      it { is_expected.to have_key(:attendees) }
      it { is_expected.to have_key(:cost) }
      it { is_expected.to have_key(:created_at) }
      it { is_expected.to have_key(:updated_at) }
      it { is_expected.to have_key(:description) }
      it { is_expected.to have_key(:lat) }
      it { is_expected.to have_key(:long) }
      it { is_expected.to have_key(:event_url) }
      it { is_expected.to have_key(:source) }
      it { is_expected.to have_key(:date_start) }
      it { is_expected.to have_key(:date_end) }
      it { is_expected.to have_key(:time_start) }
      it { is_expected.to have_key(:time_end) }
      it { is_expected.to have_key(:venue) }     
    end
  end
  
  context 'meetup' do
    context '#retrieve_all_meetup_categories' do
      let(:categories){ Event.retrieve_all_meetup_categories({ radius: '25', lat: 30.269870, lon: -97.742393 })}
      subject(:params){ categories.first}
      
      it 'should return array' do
        expect(categories).to be_kind_of(Array)
      end
      
      it { is_expected.to have_key(:lat) }
      it { is_expected.to have_key(:lon) }
      it { is_expected.to have_key(:radius) }
      it { is_expected.to have_key(:name) }
      it { is_expected.to have_key(:id) }
      
    end
    
    context '#run_meetup_query' do 
      let(:events){ Event.run_meetup_query({category_id: '1', radius: '25', lat: 30.269870, lon: -97.742393 })}
      subject(:event) { events.first}
        
      it 'returns array' do
        expect(events).to be_kind_of(Array)
      end
        
      it { is_expected.to be_kind_of(Object) }
      it { is_expected.to have_key(:name) }
      it { is_expected.to have_key(:event_type) }
      it { is_expected.to have_key(:location) }
      it { is_expected.to have_key(:utc_start) }
      it { is_expected.to have_key(:utc_end) }
      it { is_expected.to have_key(:attendees) }
      it { is_expected.to have_key(:cost) }
      it { is_expected.to have_key(:created_at) }
      it { is_expected.to have_key(:updated_at) }
      it { is_expected.to have_key(:description) }
      it { is_expected.to have_key(:lat) }
      it { is_expected.to have_key(:long) }
      it { is_expected.to have_key(:event_url) }
      it { is_expected.to have_key(:source) }
      it { is_expected.to have_key(:date_start) }
      it { is_expected.to have_key(:date_end) }
      it { is_expected.to have_key(:time_start) }
      it { is_expected.to have_key(:time_end) }
      it { is_expected.to have_key(:venue) } 
    end
  end
  
    context '#run_songkick_query' do
    let(:events){ Event.run_songkick_query({ lat: 30.269870, lon: -97.742393 })}
    subject(:event) { events.first }
      
    it 'returns array' do
      expect(events).to be_kind_of(Array)
    end
      
    it { is_expected.to be_kind_of(Object) }
    it { is_expected.to have_key(:name) }
    it { is_expected.to have_key(:event_type) }
    it { is_expected.to have_key(:location) }
    it { is_expected.to have_key(:utc_start) }
    it { is_expected.to have_key(:utc_end) }
    it { is_expected.to have_key(:attendees) }
    it { is_expected.to have_key(:cost) }
    it { is_expected.to have_key(:created_at) }
    it { is_expected.to have_key(:updated_at) }
    it { is_expected.to have_key(:description) }
    it { is_expected.to have_key(:lat) }
    it { is_expected.to have_key(:long) }
    it { is_expected.to have_key(:event_url) }
    it { is_expected.to have_key(:source) }
    it { is_expected.to have_key(:date_start) }
    it { is_expected.to have_key(:date_end) }
    it { is_expected.to have_key(:time_start) }
    it { is_expected.to have_key(:time_end) }
    it { is_expected.to have_key(:venue) } 
  end
  
  context '#address_to_latlon' do
    
  end

end  

