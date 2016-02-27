class Fastfile
	def method_missing(symbol, *args)
	end

	def Object.const_missing(const, *args)
	end

	def uninitialized_constant(constant, *args)
	end

	def self.from_file(path)
		Fastfile.new do
			@full_path = File.expand_path(path)
			@base_dir = File.dirname(@full_path)
			eval(File.open(@full_path).read, nil, path)
		end
	end

	def initialize(&block)
		@lanes = []
		@current_platfrom = nil
		@default_platform = nil

		instance_eval(&block)
	end

	def default_platform(platform_name, *args, &block)
		@default_platform = platform_name
	end

	def platform(platform_name, *args, &block)
		prev_platform = @current_platfrom
		@current_platfrom = platform_name
		block.call(self) if block
		@current_platfrom = prev_platform
	end

	def lane(lane_name, *args, &block)
		@lanes << {
			platform: @current_platfrom,
			name: lane_name
		}
	end

	def list_lanes
		detected_lanes = []
		@lanes.each do |a_lane|
			a_lane[:platform] = @default_platform if a_lane[:platform].nil?
			detected_lanes << (a_lane[:platform].nil? ? a_lane[:name] : "#{a_lane[:platform]} #{a_lane[:name]}")
		end
		detected_lanes
	end
end
