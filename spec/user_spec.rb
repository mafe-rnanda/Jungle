require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    before :each do
      @user = User.new(
        :first_name => 'John',
        :last_name => 'Doe',
        :email => 'jdoe@test.com',
        :password => '12345678',
        :password_confirmation => '12345678'
      )
    end

    it "Will successfully save" do
      expect(@user).to be_valid
    end
    
    it "Should not be valid if password and password_confirmation don't match" do
      @user.password = '12345678'
      @user.password_confirmation = 'sh1234567890'
      expect(@user).not_to be_valid
    end

    it "Email should be unique" do
      @user.save
      new_user = User.new(
        :first_name => 'JOHN',
        :last_name => 'Doe',
        :email => 'jDOE@test.com',
        :password => '12345678',
        :password_confirmation => '12345678'
      )
      new_user.save
      expect(new_user.id).to eq nil
    end

    it "Should require email" do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it "Should require first_name" do
      @user.first_name = nil
      expect(@user).not_to be_valid
    end

    it "Should require last_name" do
      @user.last_name = nil
      expect(@user).not_to be_valid
    end

    it "Should have a password minimum length of 8 characters" do
      @user.password = '123'
      @user.password_confirmation = '123'
      expect(@user).not_to be_valid
    end

  end

  
  describe '.authenticate_with_credentials' do
    before :each do
      @user = User.new(
        :first_name => 'John',
        :last_name => 'Doe',
        :email => 'jdoe@test.com',
        :password => '12345678',
        :password_confirmation => '12345678'
      )
      @user.save
    end

    it "Sould be able to login with valid credentials" do
      valid_user = User.authenticate_with_credentials('jdoe@test.com', '12345678')
      expect(valid_user).to eq(@user)
    end

    it "Should not be able to login with invalid credentials" do
      valid_user = User.authenticate_with_credentials('jdoe@test.com', '6895')
      expect(valid_user).not_to eq(@user)
    end

    it "Should accept space before and after email address" do
      valid_user = User.authenticate_with_credentials('  jdoe@test.com  ', '12345678')
      expect(valid_user).to eq(@user)
    end

    it "Should accept email address no matter the case is written" do
      valid_user = User.authenticate_with_credentials('JDoe@test.com', '12345678')
      expect(valid_user).to eq(@user)
    end

  end

end