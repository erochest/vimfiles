
require 'fileutils'
require 'net/http'

CWD = File.dirname(__FILE__)

task :default => :usage

task :usage do
  puts "You forgot to tell the computer what to do; try one of these commands:"
  sh %{rake -T}
end

desc 'This installs everything to get me up and running on Vim.'
task :install => [:vundle,
                  :vimrc,
                  :conque,
                  :bundleinstall,
                  :commandt,
                  :hammerdepends,
                  'coffee:snippets'
]

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

desc 'This download the ConqueShell extension. This needs to be managed
manually.'
task :conque do
 sh %{curl --output /tmp/conque_2.3.tar.gz http://conque.googlecode.com/files/conque_2.3.tar.gz}
 sh %{cd bundle && tar xfz /tmp/conque_2.3.tar.gz}
 FileUtils.mv('bundle/conque_2.3', 'bundle/conque')
end

desc 'This runs :BundleInstall.'
task :bundleinstall do
  begin
    sh %{vim -f -c :BundleInstall -c :q}
  rescue Exception => err
    puts "Error running :BundleInstall: #{err}"
  end
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

namespace :coffee do
  desc 'This downloads the coffee.snippets file.'
  task :snippets do
    sh %{curl --output snippets/coffee.snippet https://raw.github.com/carlosvillu/coffeScript-VIM-Snippets/master/snippets/coffee.snippets}
  end
end

