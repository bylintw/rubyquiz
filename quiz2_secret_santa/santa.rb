require 'net/smtp'

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
      if(@santa_hash[@name_list[index_i]] == nil)
        @santa_hash[@name_list[index_i]] = 'No person available.'
      end
    end
    @santa_hash
  end

  def email_santa(santa_hash, from, password)
    smtp_host = 'smtp.gmail.com'
    subject = "Secret Santa"

    santa_hash.each_pair { |k, v|
      smtp = Net::SMTP.new smtp_host, 587
      smtp.enable_starttls

      santa = k.split(' ')
      person = v
      to = santa[2].gsub(/[<>]/, '')
      msg = 'Hi ' + santa[0] + ' ' + santa[1] + ",\r\n\r\n    Your person is: " + person + '!'
      mail = "To: #{to}\r\n" + "From: #{from}\r\n" + "Subject: #{subject}\r\n" + "\r\n" + msg

      smtp.start('gmail.com', from, password, :plain) do
        smtp.send_mail(mail, from, to)
        #smtp.send_message(msg, from, to)
      end
    }

  end

end