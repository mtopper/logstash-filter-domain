# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"
require "public_suffix"

# This filter will replace the specified field with
# the end of the domain, so foo.bar.mail.google.com -> google.com
#
# The config should look like this:
# [source,ruby]
#     filter {
#       domain {
#         url_field => "field_with_url"
#         domain_field => "name_of_new_domain_field"
#       }
#     }
#
# If not otherwise specified, the new field will be called 'domain'
#
class LogStash::Filters::Domain < LogStash::Filters::Base

  config_name "domain"

  # Get the domain component of exactly one string
  config :url_field, :validate => :string

  config :domain_field, :validate => :string, :default => "domain"

  public
  def register
    # Add instance variables
  end # def register

  public
  def filter(event)
    begin
        raw = event[url_field]
        domainObj = PublicSuffix.parse( raw )
        domain_name = domainObj.domain
        event[ domain_field ] = domain_name
    rescue PublicSuffix::DomainInvalid
        @logger.error("Domain: Invalid Domain Name", :value => raw )
        return
    end

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Domain
