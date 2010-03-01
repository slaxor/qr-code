#Dir["#{File.dirname(__FILE__)}/lib/tasks/*.rake"].sort.each { |ext| load(ext) }

task :default => :test

task :test do
  ruby Dir.glob('test/*.rb').join(' ')
end

