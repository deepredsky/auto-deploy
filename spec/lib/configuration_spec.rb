require 'spec_helper'

describe Configuration do
  it "should configure base_path" do
    AutoDeploy.configure{|c| c.base_path = "some_path" }
    AutoDeploy.config.base_path.should == "some_path"
  end

  it "should configure git repo" do
    AutoDeploy.configure{|c| c.repository = "some_path" }
    AutoDeploy.config.repository.should == "some_path"
  end
end
