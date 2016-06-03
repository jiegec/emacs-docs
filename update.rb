#!/usr/bin/env ruby
require 'FileUtils'
require 'rubygems'
require 'nokogiri'

emacs = '/Volumes/Data/emacs'
pwd = Dir.pwd
Dir.chdir "#{emacs}/doc"
docs = Dir.glob '**/*.html'
Dir.chdir pwd

docs.each do |doc|
  # puts "Checking #{doc}"
  unless (File.exist? "#{doc}.orig") && (FileUtils.identical? "#{emacs}/doc/#{doc}", "#{doc}.orig")
    FileUtils.copy "#{emacs}/doc/#{doc}", "#{doc}.orig"
    puts "Updated #{doc}"
    file = Nokogiri::HTML(File.open("#{doc}.orig"))
    nodes = file.search(".node")
    nodes.each do |node|
      node.before(file.create_element("mbp:pagebreak"))
      link = node.css("a[name]")
      node.children = link
    end
    File.open(doc, "w") { |f|
      f.puts file
    }
    puts "Generating #{doc}"
  end
end
