require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'attributes' do
    it { is_expected.to validate_presence_of(:rating) }
    it { is_expected.to validate_presence_of(:comment) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:place) }
  end

  context 'enum' do
    it { is_expected.to define_enum_for(:rating) }
  end
end
