#!/usr/bin/env ruby
# vim: et ts=2 sw=2

require "spec_helper"

describe Repo do
  let(:git_path) { repos_path.join("example.git").to_s }
  subject { Repo.new git_path }

  it "searches the most recent revision" do
    subject.grep("lorem").should have(2).results
  end

  it "searches previous revisions" do
    subject.grep("ipsum", "5eba895").should have(9).results
  end
end
