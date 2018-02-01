require './csv_file_creator.rb'
require './db_client.rb'

p 'こちらはDB2CSVレポジトリです。DBのスキーマをCSVに吐き出します。'

file_name = ARGV[0]

if file_name.nil?
  p 'ファイル名の入力をお願いします。'
  return
end

data = DbClient.instance.columns_in_all_tables
CsvFileCreator.new(file_name: "./#{file_name}.xls").generate_file(data: data)

p 'CSVへの吐き出しが終了しました'
