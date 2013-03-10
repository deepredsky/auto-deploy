require 'configuration'
require 'branch'
require 'command'

class AutoDeploy
  def self.config
    @config ||= Configuration.new
  end

  def self.configure(&block)
    yield(config)
  end

  def self.run
    Branch.all.each do |branch|
      Command.run(branch)
    end
  end
end
