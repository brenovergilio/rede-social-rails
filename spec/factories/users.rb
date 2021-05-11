FactoryBot.define do 
    factory :user do
        name { "User" }
        email { "user#{rand(1..1000)}@teste.com" }
        phone { "88888888" }
        avatar { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'test-avatar.png'), 'image/png') }
        password { "123456" }
    end
end