require 'rails_helper'

RSpec.describe Voice, type: :model do
  before :each do
    @user = User.create(email: 'test1@email.com', password: 'hello2WORLD', first_name: 'test1', last_name: 'test2',
                        role: 'user')
    @voice = Voice.create(file_name: 'test1', voice_file: 'test1.mp3', date: 'Sat, 28 Jan 2023 00:00:00 +0000',
                          user: @user)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(@voice).to be_valid
    end

    it 'is not valid without a date' do
      @voice.date = nil
      expect(@voice).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      expect(@voice.user).to eq(@user)
    end
  end
end
