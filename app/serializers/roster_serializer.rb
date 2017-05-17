class RosterSerializer < ActiveModel::Serializer
  attributes :id, :label

  def label
    object.last_name
  end


end
