require 'spec_helper'

describe Manufacturer do
  it {should have_valid(:name).when("Toyota", "Ford")}
  it {should_not have_valid(:name).when(nil,"")}

  it {should have_valid(:country).when("United States", "Japan")}
  it {should_not have_valid(:country).when(nil,"")}
end
