class Branch
  def self.all
    Dir[AutoDeploy.config.base_path].map { |a| File.basename(a) }
  end
end
