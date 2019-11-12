RSpec.describe "Update specific recipe" do
  describe "user can update a recipe" do
    let(:headers) {{ HTTP_ACCEPT: "application/json" }}
    let(:recipe) { create(:recipe, 
      title: "Cookies", 
      ingredients: "Cookie ingredients, chocolate chips.", 
      directions: "Make the cookies."
    )}

    before do
      put "/v1/recipes/#{recipe.id}", headers: headers,
      params: {
        title: "Mega cookies",
        content: "Better cookie ingredients, chocolate chips.",
        directions: "Make the cookies."
      } 
    end

    it "returns 200 response" do
      expect(response.status).to eq 200
    end
  end
end