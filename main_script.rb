require './app/schema_investigation_task.rb'

my_local_task = SchemaInvestigationTask.new(
  investigator: MyLocalDb.instance, 
  formatters: [
    Outs::Xls.new, 
    Outs::Console.new
  ]
)

my_local_task.run
