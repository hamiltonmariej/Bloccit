require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(1) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:email).is_at_least(3) }
  it { should allow_value("user@bloccit.com").for(:email) }
  it { should_not allow_value("userbloccit.com").for(:email) }

  it { should validate_presence_of(:password) }
  it { should have_secure_password }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "should respond to name" do
      expect(user).to respond_to(:name)
    end

    it "should respond to email" do
      expect(user).to respond_to(:email)
    end
  end

  ruby describe "transform name" do
    it "should clean up the user name" do
      let(:user_for_cleaning_up_names) { User.new(name: "jerry burns", email: "test@test.com", password: "password") }
      expect(user_for_cleaning_up_names.name).to_eq "jerry burns"
      user_for_cleaning_up_names.save!
      expect(user_for_cleaning_up_names.name).to_eq "Jerry Burns"
    end
  end

  #   it "should capitalize the first letter in each word or initial of name" do
  #     expect(user.name).to_eq "Jerry","Burns"
  #   end
  #
  #   it "should join the words or initials of name with a space" do
  #     expect(user.name).to_eq "Jerry" + ' ' + "Burns"
  #   end
  # end

  describe "invalid user" do
    let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
    let(:user_with_invalid_email) { User.new(name: "Bloccit User", email: "") }
    let(:user_with_invalid_email_format) { User.new(name: "Bloccit User", email: "invalid_format") }

    it "should be an invalid user due to blank name" do
      expect(user_with_invalid_name).to_not be_valid
    end

    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end

    it "should be an invalid user due to incorrectly formatted email address" do
      expect(user_with_invalid_email_format).to_not be_valid
    end

  end
end
