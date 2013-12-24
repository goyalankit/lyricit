#!/usr/bin/env ruby

require 'lyricit'

itunes = Lyricit::Itunes.new
itunes.find_by_name ARGV[0]
