#!/usr/bin/env ruby

require 'filewatcher'
require 'whirly'

def build
  system 'clear'

  here = File.basename Dir.pwd

  Whirly.start spinner: "bouncingBar", color: false, status: "Building #{here}.pdf" do
    `pandoc *.md -o "#{here}.pdf" --latex-engine=xelatex --template=template`
  end

  system 'clear'

  puts "Built #{here}.pdf succesfully, watching for changes..."
end


build
FileWatcher.new("#{Dir.pwd}/*.md").watch { build }
