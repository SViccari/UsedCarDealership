require 'spec_helper'

describe Car do
  it {should have_valid(:color).when("red", "purple")}
  it {should_not have_valid(:color).when(nil, "")}

  it {should have_valid(:year).when(2000, 1998)}
  it {should_not have_valid(:year).when(nil, "", 1970, 19)}

  it {should have_valid(:mileage).when(10000, 500, 0)}
  it {should_not have_valid(:mileage).when(nil, "")}

  # it {should belong_to(:manufacturer)}
end
