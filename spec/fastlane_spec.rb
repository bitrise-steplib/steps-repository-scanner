require './config_helper'

describe :fastlane do
  context "after execution" do
    before :each do
      File.delete(ConfigHelper.config_path) if File.exists?(ConfigHelper.config_path)
    end

    script_dir = `pwd`.strip
    it "won't find any lanes if project doesn't have Fastfile" do
      `cd ./spec/helpers/fastlane/Logos && ruby "#{script_dir}/detectors/fastlane.rb" "master"`
      expect($?.success?).to eql(true)
      expect(File.exists?(ConfigHelper.config_path)).to eql(false)
    end

    it "detects fastlane setup if project has valid Fastfile" do
      `cd ./spec/helpers/fastlane/Artsy && ruby "#{script_dir}/detectors/fastlane.rb" "master"`
      expect($?.success?).to eql(true)
      expect(File.exists?(ConfigHelper.config_path)).to eql(true)
    end

    it "parses lanes correctly from Acast example" do
      `cd ./spec/helpers/fastlane/Acast && ruby "#{script_dir}/detectors/fastlane.rb" "master"`
      saved_data = JSON(File.new(ConfigHelper.config_path).read)
      projects = saved_data["fastlane"]["master"]["projects"]
      expect(projects.count).to eql(1)

      project = projects.first
      expect(project["name"]).to eql("Fastfile")
      expect(project["path"]).to eql("Fastfile")
      expect(project["lanes"]).to eql(["ios xcode", "ios certs", "ios test", "ios screens", "ios beta", "ios deploy"])
    end

    it "parses lanes correctly from Artsy example" do
      `cd ./spec/helpers/fastlane/Artsy && ruby "#{script_dir}/detectors/fastlane.rb" "master"`
      saved_data = JSON(File.new(ConfigHelper.config_path).read)
      projects = saved_data["fastlane"]["master"]["projects"]
      expect(projects.count).to eql(1)

      project = projects.first
      expect(project["name"]).to eql("eidolon/Fastfile")
      expect(project["path"]).to eql("eidolon/Fastfile")
      expect(project["lanes"]).to eql(%w{build_for_test test oss build_for_deploy deploy storyboard_ids})
    end

    it "parses lanes correctly from BeMyEyes example" do
      `cd ./spec/helpers/fastlane/BeMyEyes && ruby "#{script_dir}/detectors/fastlane.rb" "master"`
      saved_data = JSON(File.new(ConfigHelper.config_path).read)
      projects = saved_data["fastlane"]["master"]["projects"]
      expect(projects.count).to eql(1)

      project = projects.first
      expect(project["name"]).to eql("Fastfile")
      expect(project["path"]).to eql("Fastfile")
      expect(project["lanes"]).to eql(%w{increment_build increment_version_patch increment_version_minor increment_version_major translate beta_dev beta_staging beta_production production})
    end

    it "parses lanes correctly from Fitbay example" do
      `cd ./spec/helpers/fastlane/Fitbay && ruby "#{script_dir}/detectors/fastlane.rb" "master"`
      saved_data = JSON(File.new(ConfigHelper.config_path).read)
      projects = saved_data["fastlane"]["master"]["projects"]
      expect(projects.count).to eql(1)

      project = projects.first
      expect(project["name"]).to eql("Fastfile")
      expect(project["path"]).to eql("Fastfile")
      expect(project["lanes"]).to eql(["ios testing", "ios staging", "ios preproduction", "ios release"])
    end

    it "parses lanes correctly from MindNode example" do
      `cd ./spec/helpers/fastlane/MindNode && ruby "#{script_dir}/detectors/fastlane.rb" "master"`
      saved_data = JSON(File.new(ConfigHelper.config_path).read)
      projects = saved_data["fastlane"]["master"]["projects"]
      expect(projects.count).to eql(1)

      project = projects.first
      expect(project["name"]).to eql("Fastfile")
      expect(project["path"]).to eql("Fastfile")
      expect(project["lanes"]).to eql(["test", "ios analyze", "ios screenshots", "ios upload_metadata", "ios beta", "ios appstore", "mac metadata", "mac screenshots", "mac upload_metadata"])
    end

    it "parses lanes correctly from ProductHunt example" do
      `cd ./spec/helpers/fastlane/ProductHunt && ruby "#{script_dir}/detectors/fastlane.rb" "master"`
      saved_data = JSON(File.new(ConfigHelper.config_path).read)
      projects = saved_data["fastlane"]["master"]["projects"]
      expect(projects.count).to eql(1)

      project = projects.first
      expect(project["name"]).to eql("Fastfile")
      expect(project["path"]).to eql("Fastfile")
      expect(project["lanes"]).to eql(["ios test", "ios beta", "ios appstore", "ios push"])
    end

    it "parses lanes correctly from Touchwonders example" do
      `cd ./spec/helpers/fastlane/Touchwonders && ruby "#{script_dir}/detectors/fastlane.rb" "master"`
      saved_data = JSON(File.new(ConfigHelper.config_path).read)
      projects = saved_data["fastlane"]["master"]["projects"]
      expect(projects.count).to eql(1)

      project = projects.first
      expect(project["name"]).to eql("Fastfile")
      expect(project["path"]).to eql("Fastfile")
      expect(project["lanes"]).to eql(["ios development", "ios stable", "ios release"])
    end
  end
end
