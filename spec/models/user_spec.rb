require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'associations' do
    it { is_expected.to have_many(:places).dependent(:destroy) }
    it { is_expected.to have_many(:reviews).dependent(:destroy) }
  end
end
