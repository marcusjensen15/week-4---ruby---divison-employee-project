require 'rails_helper'

describe Project, type: :model do
  it { should have_and_belong_to_many :employees }
end
