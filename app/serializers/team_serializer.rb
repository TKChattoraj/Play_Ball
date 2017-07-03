class TeamSerializer < ActiveModel::Serializer
  attributes :id, :label

  def label
    object.name
  end
end
