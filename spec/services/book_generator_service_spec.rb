# frozen_string_literal: true

RSpec.describe BookGeneratorService, type: :service do
  let(:recipe) do
    create(:recipe, title: 'My Fantastic Recipe',
                    ingredients: 'Milk \nSugar \nHoney',
                    directions: 'Pour everything in a bowl \nStir')
  end

  let(:collection) { [recipe] }

  let!(:pdf) { BookGeneratorService.generate_book(collection) }
  let(:pdf_file) { open(Rails.root.join('food_hub_template_draft.pdf')) }
  subject { PDF::Inspector::Text.analyze_file(pdf_file) }

  it 'contains recipe' do
    expect(subject.strings)
      .to include('My Fantastic Recipe')
      .and include('Milk \\nSugar \\nHoney')
      .and include('Pour everything in a bowl \\nStir')
  end

  it 'contains back side info' do
    expect(subject.strings)
      .to include('Get your own cookbook at')
      .and include('www.foodhub.recipes')
  end
end
