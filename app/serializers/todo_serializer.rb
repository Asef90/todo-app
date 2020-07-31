class TodoSerializer < ActiveModel::Serializer
  attributes :id, :text, :is_completed, :project_id
end
