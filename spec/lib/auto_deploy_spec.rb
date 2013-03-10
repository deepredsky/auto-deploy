require 'spec_helper'

describe AutoDeploy do
  it "should have configuration" do
    AutoDeploy.config.should be_a(Configuration)
  end

  context "run" do
    it "should run commands on every branch" do
      Branch.stub(:all).and_return(['branch-1'])
      Command.should_receive(:run).with('branch-1')
      AutoDeploy.run
    end
  end
end
