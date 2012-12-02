require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "has link sports " do
      visit '/'
			page.should have_content "Home"
    end
  end
end
