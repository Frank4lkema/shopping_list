require 'rails_helper'

RSpec.describe ListProduct, type: :model do
  context 'associations' do
    it { should belong_to(:product) }
    it { should belong_to(:list) }
  end

  context 'validations' do
    subject { build(:list_product) }
    it { expect(subject).to validate_numericality_of(:amount).is_greater_than(0)}
  end
end
