class Parents::ShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_name

  def user
    object.user.name || object.user.email
  end
end
