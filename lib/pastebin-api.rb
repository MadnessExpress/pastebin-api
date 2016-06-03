require 'rest-client'
require 'open-uri'

module Pastebin

  class Client

    def initialize(api_dev_key, api_user_name = nil, api_user_password = nil)

      @api_dev_key = api_dev_key

      if api_user_name.nil?
 
        @userkey = RestClient.post('http://pastebin.com/api/api_login.php', :api_dev_key => @api_dev_key, :api_user_name => api_user_name, :api_user_password => api_user_password).body

      else
 
        @userkey = ''

      end

    end

    def newpaste(api_paste_code, api_paste_name = '', api_paste_format = 'text', api_paste_private = '0', api_paste_expire_date = 'N')
    
      api_paste_code = URI::encode(api_paste_code)
      api_paste_name = URI::encode(api_paste_name)

      params = {
        api_dev_key: @api_dev_key,
        api_user_key: @userkey,
        api_option: 'paste',
        api_paste_code: api_paste_code,
        api_paste_name: api_paste_name,
        api_paste_format: api_paste_format,
        api_paste_private: api_paste_private,
        api_paste_expire_date: api_paste_expire_date
      }

      response = RestClient.post('http://pastebin.com/api/api_post.php', params).body

    end

    def delpaste(api_paste_code, api_paste_name = '', api_paste_format = 'text', api_paste_private = '0', api_paste_expire_date = 'N')

      


  end

end
