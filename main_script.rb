require 'rubygems'
require_relative 'app/v2/schema_investigation_task'
require_relative 'app/v2/my_local_db'
require_relative 'app/v2/outs/console'
require_relative 'app/v2/outs/xls/main'
require_relative 'app/v2/outs/xls/sub'

file_name = ARGV[0].nil? ? 'staging.xls' : ARGV[0]

my_local_task = App::V2::SchemaInvestigationTask.new(
  investigator: App::V2::MyLocalDb.instance, 
  formatters: [
    App::V2::Outs::Xls::Main.new(file_name: "output/#{file_name}"), 
    App::V2::Outs::Console.new(file_name: "output/#{file_name}")
  ]
)

my_local_task.run
