require 'rubygems'
require 'pry'
require_relative 'app/v2/schema_investigation_task'
require_relative 'app/v2/my_local_db'
require_relative 'app/v2/outs/console'
require_relative 'app/v2/outs/xls'

file_name = ARGV[0].nil? ? 'staging.xls' : ARGV[0]

my_local_task = App::V2::SchemaInvestigationTask.new(
  investigator: App::V2::MyLocalDb.instance, 
  formatters: [
    App::V2::Outs::Xls.new(file_name: file_name), 
    App::V2::Outs::Console.new(file_name: file_name)
  ]
)

my_local_task.run
