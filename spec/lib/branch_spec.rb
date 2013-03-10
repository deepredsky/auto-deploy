require 'spec_helper'

describe Branch do
  it "return list of deployments" do
    Dir.stub(:[]).and_return(["branch-1", "branch-2"])
    Branch.all.should == ["branch-1", "branch-2"]
  end
end
