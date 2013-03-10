class Command
  attr_accessor :context, :repository

  def initialize(context)
    @context = context
  end

  def update_code
    <<-EOC
      cd #{context_path}} && git reset HEAD --hard && git fetch origin #{context} && git checkout -b #{context} origin/#{context}
    EOC
  end

  def restart_app
    <<-EOC
      cd #{context_path}} && touch tmp/restart.txt
    EOC
  end

  def context_path
    "#{AutoDeploy.config.base_path}/#{context}"
  end

  def repository
    AutoDeploy.config.repository
  end

  def self.run(context)
    new(context).run
  end

  def all
    commands = []
    commands << update_code
    commands << restart_app
    commands
  end

  def run
    all.each do |command|
      begin
        execute(command)
      rescue Exception => e
        puts "Error: #{e.message}"
        puts "Stopped at: #{command}"
        break
      end
    end
  end
end
