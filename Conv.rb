class Convert
  attr_accessor :file_name, :file_data

  def initialize(file_name = "World")
    @file_name = file_name
  end

  def read_file_data
    if @file_name.nil?
       puts "File's name is empty"
    else
       file= File.open(@file_name.to_s)
       if file.nil?
          puts "It was problem with File.open"
       else
	  @file_data = file.read
       end
       file.close
    end
  end

  def conv_data_to_json
    if @file_data.nil?
       puts "file data is empty"
    else
       @file_data = @file_data.to_s.split(',')
       require 'json'
       @file_data = @file_data.to_json
    end
  end

  def write_new_data
    if @file_data.nil?
       puts "Data is empty after convert to json"
    else
       file = File.new("CsvAtJson.json","w")
       file.puts(@file_data)
       file.close
    end
  end

end

 if __FILE__ == $0
   if ARGV.length != 1
       puts "We need exactly one parameter. The name of a file."
   else
     con = Convert.new 
     con.file_name = ARGV[0]
     con.read_file_data
     con.conv_data_to_json
     con.write_new_data
   end
 end
     
