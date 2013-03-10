require 'spec_helper'

describe "App" do
  it "should do something" do
    get "/"
    last_response.should be_ok
  end
end
