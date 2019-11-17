

RSpec.describe Cookbook, type: :model do
  it 'should have valid Factory' do
    expect(create(:cookbook)).to be_valid
  end

  describe 'DB columns' do
    it { is_expected.to have_db_column :user_id }
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :favorites }
  end
end
