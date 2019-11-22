# frozen_string_literal: true

RSpec.describe BookGeneratorService, type: :service do
  let(:recipe) do
    create(:recipe, title: 'My Recipe',
                    ingredients: 'Milk \nSugar \nHoney',
                    directions: 'Pour everything in a bowl \nStir')
  end

  let(:collection) { [recipe] }

  let!(:pdf) { BookGeneratorService.generate_book(collection) }
  let(:pdf_file) { File.open(Rails.public_path.join('food_hub_template_draft.pdf')) }
  subject { PDF::Inspector::Text.analyze_file(pdf_file) }

  it 'contains recipe title' do
    expect(subject.strings)
      .to include 'MY RECIPE' 
  end

  it 'contains recipe ingredients' do
    expect(subject.strings.include? 'Milk \\nSugar \\nHoney')
      .to eq true
  end

  it 'contains recipe directions' do
    expect(subject.strings.include? 'Pour everything in a bowl \nStir')
      .to eq true
  end

  it 'contains back side info' do
    expect(subject.strings)
      .to include('Get your own cookbook at')
      .and include('www.foodhub.recipes')
  end
end
