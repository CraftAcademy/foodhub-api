class RecipesIndex < Chewy::Index
  define_type Recipe.all do
    field :title, type: :string
  end
end