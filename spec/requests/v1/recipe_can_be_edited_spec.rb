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
        recipe: {
          title: "New Cookies", 
          ingredients: "New cookie mix, more chocolate.", 
          directions: "Make the new cookies."
      }}
    end

    it "returns 200 response" do
      expect(response).to have_http_status 200
    end

    it "should have update title" do
      expect(Recipe.last[:title]).to eq 'New Cookies'
    end

    it "should have new ingredients" do
      expect(Recipe.last[:title]).to eq 'New Cookies'
    end

    it "should have new title" do
      expect(Recipe.last[:title]).to eq 'New Cookies'
    end
  end

  describe "unable to update a recipe" do
    let(:headers) {{ HTTP_ACCEPT: "application/json" }}
    let(:recipe) { create(:recipe, 
                          title: "Cookies", 
                          ingredients: "Cookie ingredients, chocolate chips.", 
                          directions: "Make the cookies."
    )}

    before do
      put "/v1/recipes/#{recipe.id}", headers: headers,
      params: { 
        recipe: {
          title: "New Cookies", 
          ingredients: "New cookie mix, more chocolate." * 20, 
          directions: "Make the new cookies."
      }}
    end

    it "returns 422 response" do
      expect(response).to have_http_status 422
    end

    it "returns error message" do
      expect(response_json["error_message"]).to eq "Ingredients is too long (maximum is 500 characters)"
    end
  end
end