require 'rails_helper'

RSpec.describe Suggestion, type: :model do
  it { should validate_presence_of(:movie) }
  it { should validate_presence_of(:author) }
  it { should belong_to(:sugg_box) }

  describe '#move_suggestions_to_new_box' do
    let(:suggestion) { create(:suggestion)}

    it 'moves a suggestion from one box to another' do
      suggestion.move_suggestions_to_new_box(6)
      expect(suggestion.sugg_box_id).to eq 6
    end
  end

end
