require_relative '../config_helper'
require_relative './fastfile.rb'

branch = ARGV[0]
unless branch
  puts "\e[31mBranch not specified\e[0m"
  exit 0
end

config_helper = ConfigHelper.new

# Check for project files
fastfiles = Dir.glob(File.join("**/Fastfile"), File::FNM_CASEFOLD)

exit 0 if (fastfiles.count) == 0

puts
puts "\e[32mfastlane project detected\e[0m"

fastfiles.each do |fastfile_path|
  puts ""
  puts "Inspecting: #{fastfile_path}"

  begin
    fastfile = Fastfile.from_file(fastfile_path)
    lanes = fastfile.list_lanes

    puts "Detected lanes:"

    if lanes && !lanes.empty?
      config_helper.save("fastlane", branch, {
    		name: fastfile_path,
    		path: fastfile_path,
    		lanes: lanes
    	})

      lanes.each { |lane| puts lane}
    else
      puts "No lane found. Ignoring fastfile"
    end
  rescue => ex
    puts ex.backtrace.join("\n")
    puts
    puts "\e[31mFailed to parse Fastfile\e[0m"
    puts "\e[33mPlease create a ticket on https://github.com/bitrise-io/steps-repository-scanner/issues\e[0m"
    puts "\e[33mwith the failing logs and with the Fastfile\e[0m"
    puts
    puts "\e[37mskipping\e[0m"
  end
end
