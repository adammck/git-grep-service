#!/usr/bin/env ruby
# vim: et ts=2 sw=2

require "spec_helper"

describe Fetcher do
  let(:clone_url) { "file://" + repos_path.join("example.git").to_s }
  let(:git_path) { tmp_path.join((rand(8888) + 1111).to_s + ".git") }

  after do
    git_path.rmtree if git_path.exist?
  end

  it "clones repos" do
    Fetcher.new(clone_url, git_path).clone!
    git_path.join("refs").should be_exist
  end

  #it "fetches new refs from existing repos"
end
