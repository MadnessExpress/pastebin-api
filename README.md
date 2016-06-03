# Pastebin API Wrapper
Simple Pastebin API wrapper for ruby.

## Dependencies
Ruby 2.3+
Ruby Rest Client 1.8+ - `gem install rest-client`


## Installing
To install this api wrapper run the command `gem install pastebin-api`

## Supported API Functions
The currently supported functions are as follows:
  * **Creating a new paste as a guest or user with the following options:**
    * **api_paste_code** : Paste message
    * **api_paste_name** : Paste name
    * **api_paste_private** : Whether paste is public, unlisted, or private > Options are - 0 = public, 1 = unlisted, 2 = private
    * **api_paste_format** : What format your paste is in, see the bottom of the README for a list
    * **api_paste_expire_date** : How long until the paste expires
  
  * **Creating an api_user_key for user log in functions, this is done automatically if you supply an api_user_name and api_user_password**
  
  * **Listing pastes created by a user and trending pastes with the following options:**
    * **api_results_limit : This is for user pastes and defaults to 50 if unspecified, and has a minimum of 1 and max of 1000**
  
  * **Deleting pastes created by users**

## Using This API Wrapper
To use this in your project first require the wrapper with:
```ruby
require 'pastebin-api'
```
Then initialize the api wrapper with:
```ruby
pastebin = Pastebin::Client.new('Your Dev Api Key')
```
Alternatively you can initialize the wrapper with a username and password to paste as a user like so:
```ruby
pastebin = Pastebin::Client.new('Your Dev Api Key', :)
