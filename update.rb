#!/usr/bin/env ruby
require 'FileUtils'

emacs = '/Volumes/Data/emacs'
pwd = Dir.pwd
Dir.chdir "#{emacs}/doc"
docs = Dir.glob '**/*.html'
Dir.chdir pwd

docs.each do |doc|
  # puts "Checking #{doc}"
  unless (File.exist? doc) && (FileUtils.identical? "#{emacs}/doc/#{doc}", doc)
    FileUtils.copy "#{emacs}/doc/#{doc}", doc
    puts "Updated #{doc}"
  end
end
