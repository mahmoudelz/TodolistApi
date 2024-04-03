class HardJob
  include Sidekiq::Job

  def perform(*args)
  sleep(5)  
  puts 'DoneDoneDoneDoneDone'
  end
end
