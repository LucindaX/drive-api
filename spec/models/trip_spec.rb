require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should have_many(:checkpoints).dependent(:destroy) }
  it { should validate_presence_of(:start_lat) }
  it { should validate_presence_of(:start_lng) }
end
