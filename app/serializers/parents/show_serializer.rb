class Parents::ShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_name

  def user_name
    object.user.name || object.user.email
  end
end
