require 'rails_helper'

RSpec.describe Rating, type: :model do
  it 'should have valid Factory' do
    expect(create(:rating)).to be_valid
  end

  describe 'DB columns' do
    it { is_expected.to have_db_column :user_id }
    it { is_expected.to have_db_column :recipe_id }
    it { is_expected.to have_db_column :score }
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :recipe }
  end
end
