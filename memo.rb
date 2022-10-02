require "csv"
puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
memo_type = gets.to_i
 
if memo_type==1
  puts "新規メモを作成します。拡張子を除いたファイル名を入力してください。"
  file_name = gets.chomp
  puts "メモの内容を記入してください。"
  puts "エンターキーを押したあと、Ctrl+Dで保存します。"
  content=STDIN.read
  memo=content.chomp
  CSV.open("#{file_name}.csv", "w") do |csv|
   csv.puts ["#{memo}"]
  end
elsif memo_type==2
  puts "メモを編集します。編集するファイル名を入力してください。（拡張子を除いて入力してください）"
  file_name = gets.chomp
  puts "追加する内容を記入してください。"
  puts "エンターキーを押したあと、Ctrl+Dで保存します。"
  date=CSV.read("#{file_name}.csv")
  puts date
  content=STDIN.read
  memo=content.chomp
  CSV.open("#{file_name}.csv", "a") do |csv|
   csv.puts ["#{memo}"]
  end
end