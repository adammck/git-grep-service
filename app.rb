#!/usr/bin/env ruby
# vim: et ts=2 sw=2

$LOAD_PATH.unshift(File.expand_path("../lib", __FILE__))

require "sinatra"
require "gitgrep"
require "json"

get "/" do
  redirect "/head/lorem"
end

get "/:refspec/:search" do
  repo = GitGrep::Repo.new("spec/repos/example.git")
  results = repo.grep(params[:search], params[:refspec]).map do |result|
    { path: result.path, line: result.line, text: result.text }
  end

  [200, { "content-type" => "text/json" }, results.to_json]
end
