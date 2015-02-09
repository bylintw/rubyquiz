class Santa
  def initialize(name_list)
    @name_list = name_list
    @santa_hash = Hash.new()
  end

  def find_santa()
    @name_list.shuffle!
    temp_list = @name_list.clone
    length = @name_list.length

    (0..length-1).each do |index_i|
      name = @name_list[index_i].to_s.split(' ')
      temp_list.push << temp_list.shift

      (0..length-1).each do |index_j|
        if temp_list[index_j] != ''
          temp_name = temp_list[index_j].to_s.split(' ')
          if name[1] != temp_name[1]
            @santa_hash[@name_list[index_i]] = temp_list[index_j]
            temp_list[index_j] = ''
            break
          end
        end
      end

    end
    @santa_hash
  end

end