# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car, type: :model do
  it { should have_many(:locations).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:car_type) }
  it { should validate_presence_of(:car_model) }
end
