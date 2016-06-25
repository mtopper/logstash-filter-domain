# encoding: utf-8
require 'spec_helper'
require "logstash/filters/domain"

describe LogStash::Filters::Domain do
  describe "Test www.google.com" do
    let(:config) do <<-CONFIG
      filter {
        domain {
          url_field => "url"
        }
      }
    CONFIG
    end

    sample("url" => "mail.google.com") do
      expect(subject.get("domain")).to eq('google.com')
    end
  end
end
