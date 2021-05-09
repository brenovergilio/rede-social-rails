require 'rails_helper'

RSpec.describe User, type: :model do
    it 'user is valid' do
        @user = User.new(
            name: "Breno",
            email: "breno@teste.com",
            phone: "88888888",
            avatar: fixture_file_upload(Rails.root.join('spec', 'support', 'test-avatar.png'), 'image/png'),
            password: '123456'
        )

        expect(@user).to be_valid

    end
    
    it 'user is not valid' do
        @user = User.new(
            name: "Breno",
            email: "breno@teste.com",
            phone: "88888888",
            password: '123456'
        )

        expect(@user).to_not be_valid
    end

    it 'user should have a name' do
        @user = User.new(
            email: "breno@teste.com",
            phone: "88888888",
            avatar: fixture_file_upload(Rails.root.join('spec', 'support', 'test-avatar.png'), 'image/png'),
            password: '123456'
        )

        expect(@user).to_not be_valid
    end
end