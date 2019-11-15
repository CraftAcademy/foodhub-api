# frozen_string_literal: true

RSpec.describe BookGeneratorService, type: :service do
  let(:recipe) do
    create(:recipe, title: 'My Fantastic Recipe',
                    ingredients: 'Milk \nSugar \nHoney',
                    directions: 'Pour everything in a bowl \nStir')
  end

  let(:collection) { [recipe]}

  subject { BookGeneratorService.generate_book(collection)}

  it '' do
    binding.pry
  end
end
