FactoryGirl.define do
  factory :user do
    email "user@this.site"
    password "NgH1#x_z"
    password_confirmation { "NgH1#x_z" }
  end
end
