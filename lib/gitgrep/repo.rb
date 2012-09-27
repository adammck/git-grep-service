#!/usr/bin/env ruby
# vim: et ts=2 sw=2

require "grit"

module GitGrep
  class Repo
    GrepResult = Struct.new(:tree, :path, :line, :text)

    def initialize path
      @path = path
    end

    def grep pattern, refspec="HEAD"
      grit.native(:grep, { :line_number=>true }, pattern, refspec).split("\n").map do |line|
        GrepResult.new *line.split(":", 4)
      end
    end

    private

    def grit
      Grit::Git.new(path)
    end

    def path
      @path.to_s
    end
  end
end
