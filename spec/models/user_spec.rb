# frozen_string_literal: true

RSpec.describe User, type: :model do
  it 'should have valid Factory' do
    expect(create(:user)).to be_valid
  end

  describe 'DB columns' do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :encrypted_password }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
  end

  describe 'associations' do
    it { is_expected.to have_many :recipes }
    it { is_expected.to have_one :cookbook }
    it {
      is_expected.to have_many(:favorites)
        .through(:cookbook)
    }
    it {
      is_expected.to have_many(:favorite_recipes)
        .through(:favorites)
    }
  end
end
