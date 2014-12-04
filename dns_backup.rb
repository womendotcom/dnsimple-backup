#!/usr/bin/env ruby

require 'dnsimple'
require 'dotenv'
require 'httparty'

Dotenv.load

dnsimple_api_token = ENV.fetch('DNSIMPLE_API_TOKEN')
dnsimple_username = ENV.fetch('DNSIMPLE_USERNAME')

DNSimple::Client.api_token = dnsimple_api_token
DNSimple::Client.username = dnsimple_username

domains = DNSimple::Domain.all

domains.each do |domain|
  response = HTTParty.get(
    "https://api.dnsimple.com/v1/domains/#{domain.name}/zone",
    headers: {
      'Accept' => 'text/plain',
      'X-DNSimple-Token' => "#{dnsimple_username}:#{dnsimple_api_token}"
    }
  )

  File.open("backups/#{domain.name}.txt", 'w') { |file| file.write(response.parsed_response) }
end
