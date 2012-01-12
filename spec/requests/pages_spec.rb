require 'spec_helper'

describe "Pages" do
  describe "GET index" do
    it "works" do
      visit pages_path
      current_path.should == pages_path
    end
  end
end
