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
end  

