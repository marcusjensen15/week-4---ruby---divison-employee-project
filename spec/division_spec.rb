require 'rails_helper'

describe Division, type: :model do
  it { should have_many(:employees) }
end
