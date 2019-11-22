class RecipesIndex < Chewy::Index
  define_type Recipe.all do
    field :title, type: :text
    field :ingredients, type: :text
    field :directions, type: :text
  end
end