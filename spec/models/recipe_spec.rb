# frozen_string_literal: true

RSpec.describe Recipe, type: :model do
  it 'should have valid Factory' do
    expect(create(:recipe)).to be_valid
  end

  describe 'DB columns' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :ingredients }
    it { is_expected.to have_db_column :directions }
    it { is_expected.to have_db_column :parent_id }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :ingredients }
    it { is_expected.to validate_presence_of :directions }
    it { is_expected.to validate_length_of(:ingredients).is_at_most(500)}
    it { is_expected.to validate_length_of(:directions).is_at_most(5000)}
  end

  describe 'associations' do 
    it { is_expected.to belong_to :user }
    it do 
      is_expected.to belong_to(:parent)
      .class_name('Recipe')
      .optional 
    end
  end

  describe 'Attachment' do
    it "is valid" do
      subject.image.attach(
        io: File.open(
          fixture_path + '/pizza.jpeg'
        ), 
        filename:'attachment.jpeg', 
        content_type:'image/jpeg'
      )
      expect(subject.image).to be_attached
    end 
  end

  describe "instance methods" do
    it { is_expected.to respond_to :parent }
  end
end
