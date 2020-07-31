require 'rails_helper'

RSpec.describe Todo, type: :model do
  it { should belong_to :project }
  it { should validate_presence_of :text }
end
