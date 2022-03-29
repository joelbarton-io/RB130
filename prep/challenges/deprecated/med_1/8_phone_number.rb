class PhoneNumber
  INVALID_NUM = '0' * 10
  def initialize(str_num)
    @str_num = str_num
  end

  def number
    return INVALID_NUM if @str_num.match(/[a-z]/i)
    cleaned = @str_num.gsub(/[\D]/, '')
    return INVALID_NUM unless cleaned.length >= 10
    case cleaned.length
    when 10 then cleaned
    when 11 then cleaned[0] == '1' ? cleaned[1..] : INVALID_NUM
    else INVALID_NUM
    end
  end

  def area_code
    PhoneNumber.new(@str_num).number[0, 3]
  end

  def to_s
    cleaned = PhoneNumber.new(@str_num).number
    m = cleaned.match(/^(\d{3})(\d{3})(\d{4})$/)
    "(#{m[1]}) #{m[2]}-#{m[3]}"
  end
end
