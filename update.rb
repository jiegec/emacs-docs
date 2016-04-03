#!/usr/bin/env ruby
require 'FileUtils'

docs = ['lispintro/emacs-lisp-intro', 'lispref/elisp', 'emacs/emacs', 'misc/gnus', 'misc/tramp', 'misc/calc', 'misc/org']
emacs = '/Volumes/Data/emacs'

docs.each do |doc|
  unless (File.exist? "#{doc}.html") && (FileUtils.identical? "#{emacs}/doc/#{doc}.html", "#{doc}.html")
    FileUtils.copy "#{emacs}/doc/#{doc}.html", "#{doc}.html"
    puts "Updated #{doc}.html"
  end
end
