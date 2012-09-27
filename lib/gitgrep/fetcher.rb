#!/usr/bin/env ruby
# vim: et ts=2 sw=2

module GitGrep
  class Fetcher
    def initialize url, path
      @url = url
      @path = path
    end

    def clone!
      %x(git clone --bare #{@url} #{path} &>/dev/null)
    end

    def fetch!
      %x(git --git-dir=#{path} fetch &>/dev/null)
    end

    private

    def path
      @path.to_s
    end
  end
end
