
require 'fileutils'

CWD = File.dirname(__FILE__)

task :default => :usage

task :usage do
  puts "You forgot to tell the computer what to do; try one of these commands:"
  sh %{rake -T}
end

desc 'This installs everything to get me up and running on Vim.'
task :install => [:vundle,
                  :vimrc,
                  :bundleinstall,
                  :commandt,
                  :hammerdepends]

desc 'This clones the Vundle repository.'
task :vundle do
  sh %{git clone http://github.com/gmarik/vundle.git #{CWD}/bundle/vundle}
end

desc 'This links or copies vimrc to ~ (platform dependent).'
task :vimrc do
  if (Config::CONFIG['host_os'] =~ /mswin|mingw/).nil?
    # on unix, link
    FileUtils.ln_s("#{CWD}/vimrc", File.expand_path('~/.vimrc'))
  else
    # on windows copy
    FileUtils.cp("#{CWD}/vimrc", "#{ENV['USERPROFILE']}/_vimrc")
  end
end

desc 'This runs :BundleInstall.'
task :bundleinstall do
  sh %{vim -f -c :BundleInstall -c :q}
rescue Error => err
  puts "Error running :BundleInstall: #{err}"
end

desc 'This compiles Command-T.'
task :commandt do
  sh %{cd #{CWD}/bundle/command-t/ruby/command-t
       ruby ./extconf.rb
       make}
end

desc 'This installs dependencies for Hammer.'
task :hammerdepends do
  sh %{gem install redcarpet github-markup}
end

