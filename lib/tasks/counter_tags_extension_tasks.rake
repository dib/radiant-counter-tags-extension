namespace :radiant do
  namespace :extensions do
    namespace :counter_tags do
      
      desc "Runs the migration of the Counter Tags extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          CounterTagsExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          CounterTagsExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Counter Tags to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from CounterTagsExtension"
        Dir[CounterTagsExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(CounterTagsExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
