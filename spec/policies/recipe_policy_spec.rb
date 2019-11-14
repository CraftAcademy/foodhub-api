# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipePolicy, type: :policy do
  let(:creator) { create(:user) }
  let(:potential_editor) { create(:user) }
  let(:recipe) { create(:recipe, user: creator) }

  context 'non logged in user can access index of recipes' do
    let(:user) { nil }
    subject { described_class.new(user, recipe) }

    it { is_expected.to permit_actions %i[index show] }
    it { is_expected.to forbid_actions %i[create update] }
  end

  context 'Registered user can not create a new article' do
    subject { described_class.new(creator, recipe) }
    it { is_expected.to permit_actions %i[create update] }
  end

  context 'non_creator can not update creator Recipe' do
    subject { described_class.new(potential_editor, recipe) }
    it { is_expected.to permit_actions %i[show index create] }
    it { is_expected.to forbid_actions %i[update] }
  end
end
