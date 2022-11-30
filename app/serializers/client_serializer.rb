class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :total_memberships
end
