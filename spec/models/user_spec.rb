require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }

  it { should have_many(:places).dependent(:destroy) }
end
