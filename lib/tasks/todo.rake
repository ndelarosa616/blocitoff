namespace :todo do
  
  desc "Delete items older than seven days"
  task delete_items: :environment do
    begin
      Item.where("created_at <= ?", Time.now - 7.days).destroy_all
      puts "#{Time.now} - Success"
    rescue Exception => e
      puts "Exception encountered: #{e.inspect}"
    end 
  end
  
  
end
