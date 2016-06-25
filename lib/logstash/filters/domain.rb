# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"
require "public_suffix"

# This example filter will replace the contents of the default
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an example.
class LogStash::Filters::Domain < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #   example {
  #     message => "My message..."
  #   }
  # }
  #
  config_name "domain"

  # Get the domain component of exactly one string
  config :url_field :validate => :string

  config :domain_field :validate => :string, :default => "domain"

  public
  def register
    # Add instance variables
  end # def register

  public
  def filter(event)
    raw = event.get(url_field)
    domainObj = PublicSuffix.parse( raw )
    domain = domain.domain
    event.set( domain_field, domain )

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Domain
