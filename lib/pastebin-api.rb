require 'rest-client'

module Pastebin

  class Client

    def initialize(api_dev_key, auth = {})

      @api_key = api_dev_key

      auth = {api_dev_key: '', api_user_name: nil, api_user_password: nil}.merge(auth)
 
      auth[:api_dev_key] = @api_key

      if auth['api_user_name'].nil?
 
        @userkey = ''

      else
 
        @userkey = RestClient.post('http://pastebin.com/api/api_login.php', auth).body

      end

    end

    def newpaste(message, params = {})

      params = {api_dev_key: @api_key, api_user_key: @userkey, api_option: 'paste', api_paste_code: message, api_paste_name: '',
                api_paste_format: 'text', api_paste_private: '0', api_paste_expire_date: 'N'}.merge(params)

      response = RestClient.post('http://pastebin.com/api/api_post.php', params).body

    end

    def delpaste(api_paste_key)

      params = {api_dev_key: @api_key, api_option: 'delete', api_user_key: @userkey, api_paste_key: api_paste_key}

      response = RestClient.post('http://pastebin.com/api/api_post.php', params).body            

    end

    def listpastes(api_results_limit = '', api_option = '')

      params = {api_dev_key: @api_key, api_option: api_option, api_user_key: @userkey, api_results_limit: api_results_limit}

      response = RestClient.post('http://pastebin.com/api/api_post.php', params).body

    end

  end

end
