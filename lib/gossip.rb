require 'bundler'
Bundler.require
class Gossip

  attr_accessor :author 
  attr_accessor :content

  def initialize(author, content)
    @author = author
    @content = content
  end 

  

  def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [author , content]
        end
     end

     def self.all
      all_gossips = []
      CSV.read("./db/gossip.csv").each do |csv_line|
        all_gossips << Gossip.new(csv_line[0], csv_line[1])
      end
      return all_gossips
    end
  
  def self.find (id)

    table_gossip = CSV.parse(File.read("./db/gossip.csv"))
    return table_gossip[id]
  end
      
end

#binding.pry