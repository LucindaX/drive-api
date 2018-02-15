require 'rails_helper'

RSpec.describe Checkpoint, type: :model do
  it { should belong_to(:trip) }
  it { should validate_presence_of(:lat) }
  it { should validate_presence_of(:lng) }
end
