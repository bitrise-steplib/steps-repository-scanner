require './config_helper'

describe ConfigHelper do
  context "initialize" do
    it "has valid config path" do
      expect(ConfigHelper.config_path).to eql("#{ENV['HOME']}/.bitrise_config")
    end
  end

  context "after save" do
    before :each do
      File.delete(ConfigHelper.config_path) if File.exists?(ConfigHelper.config_path)
    end

    it "creates file" do
      ch = ConfigHelper.new
      ch.save('test', 'master', { test: true })
      expect(File.exists?(ConfigHelper.config_path)).to eql(true)
    end

    it "should have valid content" do
      ch = ConfigHelper.new
      ch.save('test', 'master', { test: true })
      content = File.new(ConfigHelper.config_path).read
      expect(content).to eql '{"test":{"master":{"projects":[{"test":true}]}}}'
    end
  end
end
