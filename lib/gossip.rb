require 'csv'


 class Gossip

    attr_reader :mystory 





  def initialize(mystory)
   
   @mystory = mystory
  

  end



  def save

   
   CSV.open("db/gossip.csv", "ab") do |csv|

    csv << [@mystory]


    end


  end

  



  def self.all

  all_gossips = []

 CSV.read("db/gossip.csv").each do |csv_line|

 all_gossips << Gossip.new(csv_line[0])

 end

 return all_gossips


  end


  def self.find(id)


    total_gossips_array = self.all

    return total_gossips_array[id.to_i]

  end


end


