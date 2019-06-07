require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject(:test_user) { User.new(email: 'tester@testing.com', password: 'password') }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do 
    it "verifies when an entered password is correct" do
      expect(test_user.is_password?('password')).to be true
    end

    it "verifies when an entered password is incorrect" do 
      expect(test_user.is_password?('databasedatabasedatabase')).to be false
    end
  end

  describe "#reset_session_token!" do 
    it "provides the user with a new session token" do
      prev_token = test_user.session_token

      expect(test_user.reset_session_token!).to_not eq(prev_token)
    end
  end

  describe "::find_by_credentials" do 
    it "is able to locate a user when provided the correct login credentials" do 
      test_user.save
      expect(User.find_by_credentials('tester@testing.com', 'password')).to eq(test_user)
    end

    it "should return nil when given incorrect login credentials" do 
      expect(User.find_by_credentials('tester@testing.com', 'wrongpass')).to be(nil)
    end
  end
end
