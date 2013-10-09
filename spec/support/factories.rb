FactoryGirl.define do
  factory :car do 
    color 'red'
    year 1990
    mileage 100
  end

  factory :manufacturer do 
    name 'Toyota'
    country 'Japan'
  end
end
