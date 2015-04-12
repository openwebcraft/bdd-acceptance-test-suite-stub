# Copyright Camptocamp SA 2012
# License: AGPL (GNU Affero General Public License)[http://www.gnu.org/licenses/agpl-3.0.txt]
# Author Guewen Baconnier
 
require "xmlrpc/client"
require 'pp'

XMLRPC::Config::ENABLE_NIL_PARSER = true
XMLRPC::Config::ENABLE_NIL_CREATE = true
 
class MagentoAPI
  
  attr_accessor :url, :api_user, :api_key
  
  def initialize(base_url, api_user, api_key, options={})
    @url = base_url << '/api/xmlrpc/'
    @api_user = api_user
    @api_key = api_key
    @debug = options[:debug] || false
    @client = init_client
  end
  
  def call(method, *arguments)
    @client.call('call', session_id, method, arguments)
  end

  def order_list(filters=nil)
  	# filters:  e.g.  -> {"customer_email" => {"eq" => "name@example.com"}, "status" => {"eq" => "canceled"} }
  	self.call('sales_order.list',filters)
  end

  def order_cancel(increment_id)
    self.call('sales_order.addComment',increment_id,'canceled')
  end
  
  private
  
  def init_client
    client = XMLRPC::Client.new2(@url)
    http_debug(@debug)
    client.set_debug
    client
  end
  
  def http_debug(active)
    output = active ? $stderr : false
      
    XMLRPC::Client.class_eval do
      define_method :set_debug do
        @http.set_debug_output(output)
      end
    end
  end
  
  def session_id
    @client.call('login', @api_user, @api_key)
  end

  def self.cancel_test_orders(email_address,api_user,api_password)
    $stdout.puts "\ncancelling test-orders (app_host: #{Capybara.app_host}"
    magento = MagentoAPI.new(Capybara.app_host, api_user, api_password, :debug => false)
    order_list = magento.order_list({"customer_email" => {"eq" => "#{email_address}"}, "status" => {"neq" => "canceled"}})

    order_list.each do |order|
      $stdout.puts "canceling order id: #{order["increment_id"]} .. "
      if magento.order_cancel(order["increment_id"])
        $stdout.puts "Success"
      else
        $stdout.puts "Failed"
      end
    end
  end

end

