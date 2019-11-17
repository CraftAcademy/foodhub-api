
RSpec.describe Favorite, type: :model do
  it 'should have valid Factory' do
    expect(create(:cookbook)).to be_valid
  end

  describe 'DB columns' do
    it { is_expected.to have_db_column :cookbook_id }
    it { is_expected.to have_db_column :recipe_id }
  end

  describe 'associations' do
    it { is_expected.to belong_to :cookbook }
    it { is_expected.to belong_to :recipe }
  end
end
