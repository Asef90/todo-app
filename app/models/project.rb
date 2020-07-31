class Project < ApplicationRecord
  has_many :todos, dependent: :destroy

  validates :title, presence: true, uniqueness: true

  default_scope { order(:id) }
end
