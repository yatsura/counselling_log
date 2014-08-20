require 'spec_helper'

describe Organisation do
  it { should validate_presence_of(:name) }
end
