RSpec.describe Recipe, type: :model do
  it 'should have valid Factory' do
    expect(create(:recipe)).to be_valid
  end

  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :ingredients }
  it { is_expected.to have_db_column :directions }

end
