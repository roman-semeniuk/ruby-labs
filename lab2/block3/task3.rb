require "yaml"
require "time"

CONFIG_PATH = File.join(__dir__, "config.yml")
TMP_PATH    = "#{CONFIG_PATH}.tmp"

config = YAML.load_file(CONFIG_PATH) || {}

puts "Database settings: #{config['database'].inspect}"
puts "Previous last_run_at: #{config['last_run_at']}"

config["last_run_at"] = Time.now.iso8601

begin
  File.open(TMP_PATH, "w") do |file|
    file.write(YAML.dump(config))
  end
  File.rename(TMP_PATH, CONFIG_PATH)
  puts "New last_run_at: #{config['last_run_at']}"
rescue => e
  puts "Write failed: #{e.message}"
  File.delete(TMP_PATH) if File.exist?(TMP_PATH)
end