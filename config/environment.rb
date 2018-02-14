require 'bundler'

require "sinatra/activerecord"
require "active_record"
# require 'require_all'
# require 'catpix'
# require 'rmagick'
# require 'rake'
require 'gdshowsdb'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
