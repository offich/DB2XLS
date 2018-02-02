require 'rubygems'
require 'pry'
require './app/v2/schema_investigation_task.rb'
require './app/v2/my_local_db.rb'
require './app/v2/out/console.rb'
require './app/v2/out/xls.rb'

file_name = ARGS[0].nil? ? 'staging.xls' : ARGS[0]

my_local_task = V2::SchemaInvestigationTask.new(
  investigator: V2::MyLocalDb.instance, 
  formatters: [
    Outs::Xls.new(file_name: file_name), 
    Outs::Console.new
  ]
)

my_local_task.run
