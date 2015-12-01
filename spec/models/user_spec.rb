require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  
  #Shoulda tests for name attributes
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(1) }
  
  #Shoulda tests for email attributes
  it { should validate_presence_of(:email) }
  it { should validate_length_of(:email).is_at_least(3) }
  it { should validate_uniqueness_of(:email) }
  it { should allow_value("user@wikipedia.com").for(:email) }
  it { should_not allow_value("userwikipedia.com").for(:email) }
  
  #Shoulda tests for password attributes
  it { should validate_presence_of(:password) }
  it { should have_secure_password }
  it { should validate_length_of(:password).is_at_least(6) }
  
  describe "User class" do
     context "attributes" do
        it "should respond to name" do
            expect(user).to respond_to(:name)
        end
        
        it "should respond to email" do
           expect(user).to respond_to(:email) 
        end
        
        it "should respond to password" do
            expect(user).to respond_to(:password)
        end
     end
  end
  
  describe "invalid user" do
      let(:user_with_invalid_name) { User.new(name: "", email: "user@wikipedia.com") }
      let(:user_with_invalid_email) { User.new(name: "Wikipedia User", email: "") }
      let(:user_with_invalid_email_format) { User.new(name: "Wikipedia User", email: "invalid_format") }
     context "attributes" do
         it "should render invalid user from empty name" do
             expect(user_with_invalid_name).to_not be_valid
         end
         
         it "should render invalid user from empty email" do
             expect(user_with_invalid_email).to_not be_valid
         end
         
         it "should render invalid user from wrong email format" do
            expect(user_with_invalid_email_format).to_not be_valid 
         end
     end
  end
  
end
