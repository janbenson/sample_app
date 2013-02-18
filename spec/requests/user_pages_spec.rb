require 'spec_helper'
require 'rspec/autorun'

describe "User pages" do

  subject { page }
  
 describe "signup page" do
  before { visit signup_path } 
  shared_examples_for "all User pages" do
    it { should have_selector('title', :text=> full_title(page_title)) }
    it { should have_content('error') }
   end
 end
end

