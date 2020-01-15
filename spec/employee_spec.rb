require 'rails_helper'

describe Employee, type: :model do
  it { should belong_to (:division) }
  it { should have_and_belong_to_many :projects }
end
