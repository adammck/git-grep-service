#!/usr/bin/env ruby
# vim: et ts=2 sw=2

$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))

require "gitgrep"
include GitGrep

RSpec.configure do |config|
  def spec_path
    Pathname.new(__FILE__).dirname
  end

  def repos_path
    spec_path.join("repos")
  end

  def tmp_path
    spec_path.join("tmp")
  end
end
