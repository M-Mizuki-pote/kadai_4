 #課題の確認お願いいたします
 
 require "csv"
 
 puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
 
 memo_type = gets.to_i
 
 if memo_type==1
   puts "メモを作成します。内容を記入してください。"
   puts "エンターキーを押したあと、Ctrl+Dで保存します。"
   content=STDIN.read
   memo=content.chomp
   CSV.open('file.csv', 'w') do |csv|
     csv.puts ["#{memo}"]
   end
 elsif memo_type==2
    puts "メモを編集します。"
    puts "エンターキーを押したあと、Ctrl+Dで保存します。"
    date=CSV.read('file.csv')
     puts date
    content=STDIN.read
    memo=content.chomp
    CSV.open('file.csv', 'a') do |csv|
     csv.puts ["#{memo}"]
   end
 end