#!/usr/bin/env ruby

bad_headers = ['X-Forwarded-For','Host','CF-IPCountry','CF-RAY','X-Forwarded-Proto','CF-Visitor','X-Graph-Payment','Scalar-Receipt','User-Agent','CF-Connecting-IP','CDN-Loop','cf-request-id','X-Real-IP']

while data = STDIN.gets
  next unless data
  data = data.chomp
  decoded = [data].pack("H*")
  bad_headers.each do |header|
    decoded.gsub!(/#{header}.*\r\n/i, "")
  end
  encoded = decoded.unpack("H*").first
  STDOUT.puts encoded
end
