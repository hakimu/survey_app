FactoryBot.define do
  factory :user do
    username { 'hakimu' }
    password { 'password' }
    age { 40 }
    education { 'ged' }
    gender { 'male' }
  end
end
