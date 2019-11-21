require 'rails_helper'

RSpec.describe Like, type: :model do

  describe 'DB columns' do
    it { is_expected.to have_db_column :user_id }
    it { is_expected.to have_db_column :recipe_id }
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :recipe }
  end
end
