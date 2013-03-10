require 'spec_helper'
require 'base64'

describe "App" do
  context "access control" do
    before(:each) do
      ENV.stub(:[]).with('AUTO_DEPLOY_USERNAME').and_return("admin")
      ENV.stub(:[]).with('AUTO_DEPLOY_PASSWORD').and_return("password")
    end
    it "should restrict access without authorization" do
      get "/"
      last_response.status.should == 401
    end
    it "should restrict access with invalid authorization" do
      get "/", {}, {"HTTP_AUTHORIZATION" => credentials("invalid", "credentials")}
      last_response.status.should == 401
    end
    it "should restrict access with invalid authorization" do
      get "/", {}, {"HTTP_AUTHORIZATION" => credentials("admin", "password")}
      last_response.status.should == 200
    end
  end

  private
  def credentials(username, password)
    "Basic " + Base64.encode64("#{username}:#{password}")
  end
end
