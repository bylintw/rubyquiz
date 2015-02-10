class Encrypter
  def initialize(message, key)
    @message = message
    @key = key
  end

  def convert_to_number(in_str)
    str = in_str.upcase.gsub(/[^A-Z]/, '').scan(/./)
    out_str = Array.new

    str.each do |char|
      out_str = out_str.push(char.ord - 'A'.ord + 1)
    end
    out_str
  end

  def combine_message_and_key(message, key)
    out = ''

    (0..message.length).each do |index|
      num = message[index].to_i + key[index].to_i
      num>26 ? num = num - 26 : num
      out = out + (num + 'A'.ord - 1).chr.upcase
    end

    out.scan(/...../).join(' ')
  end

  def encrypt()
    str_message = convert_to_number(@message)
    str_key = convert_to_number(@key)
    str_message.length != str_key.length ? nil : combine_message_and_key(str_message, str_key)
  end

end