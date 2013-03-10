require 'spec_helper'

describe Command do
  it "should set the context" do
    command = Command.new("branch-1")
    command.context.should == 'branch-1'
  end

  it "should delegate to the config repo" do
    AutoDeploy.configure {|c| c.repository = "some-path"}
    command = Command.new("branch-1")
    command.repository.should == 'some-path'
  end

  it "has a full context path" do
    AutoDeploy.configure {|c| c.repository = "some-path"; c.base_path = "/home/user"}
    command = Command.new("branch-1")
    command.context_path.should == '/home/user/branch-1'
  end

  it "runs all commands" do
    Command.any_instance.should_receive(:execute).exactly(2).times
    Command.run('branch-1')
  end

  it "should stop on error" do
    Command.any_instance.stub(:execute).and_raise("fail")
    Command.any_instance.should_receive(:puts).with("Error: fail")
    Command.any_instance.should_receive(:puts).with(/git reset HEAD/)
    Command.any_instance.should_receive(:execute).exactly(1).times
    Command.run('branch-1')
  end

  context "commands" do
    it "has command to update the codebase" do
      Command.new('branch-1').all[0].should include("git fetch origin branch-1")
    end

    it "has command to restart the server" do
      Command.new('branch-1').all[1].should include("touch tmp/restart.txt")
    end
  end
end

