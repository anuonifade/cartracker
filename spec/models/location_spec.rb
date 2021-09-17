# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:car) { create(:car_with_locations) }

  it { should belong_to(:car) }
  it { should validate_presence_of(:car) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:latitude) }
end
