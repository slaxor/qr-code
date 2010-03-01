class QRCode
  # 21×21 <= QRCode <=177×177
  # 11x11 <= Micro-QRCode <= 17x17

  def initialize(data)
    @payload = Payload.new(data)
    @ecc_level = ECCLevel.new
    @version = Version.new(@payload.size, @ecc_level)
    @code =  blank_line * 3
  end

  def generate
    #position_square + blank_col + format_code + payload + version_code + blank_col + position_square
    @code
  end

  def blank_line
    ' ' * @version.to_module_size + "\n"
  end

  def to_bitstream
    self.bytes.map {|b| b.to_s(2)}.join.split
  end

  def to_payload
    reed_solomon_encode self.to_bitstream
  end


  class Snippet

    LINES = []

    def initialize
      @mylines = LINES.clone.reverse
    end

    def next
      @mylines.pop
    end
  end

  class PositionSquare < Snippet

    LINES = [
      "#######",
      "#     #",
      "# ### #",
      "# ### #",
      "# ### #",
      "#     #",
      "#######"
    ]
  end

  class AlignmentSquare < Snippet
    LINES = [
      "#####",
      "#   #",
      "# # #",
      "#   #",
      "#####"
    ]
  end

  class TimingPattern
    def initialize(last = false)
      @last = last
    end

    def next
      @last = !@last
      @last ? '#' : ' '
    end
  end

  class Version
    attr_accessor :version
    #Version  Modules ECC Level Data bits Numeric Alfanumeric Binary  Kanji
    #  1      21x21    L              152      41          25     17     10
    #                  M              128      34          20     14      8
    #                  Q              104      27          16     11      7
    #                  H               72      17          10      7      4
    #         ...
    # 40      177x177  L           23,648   7,089        4,296  2,953  1,817
    #                  M           18,672   5,596        3,391  2,331  1,435
    #                  Q           13,328   3,993        2,420  1,663  1,024
    #                  H           10,208   3,057        1,852  1,273    784
    #

    def to_module_size
      @version * 4 + 17
    end

    def initialize(data_length, ec_key)
      @version = determine
    end

    def determine
      #TODO lookup from data and ecc-level
      1
    end

  end

  class Format
    # probably one of "Data bits" "Numeric" "Alfanumeric" "Binary" or "Kanji"
  end

  class ECCLevel
    # Kapazität der verschiedenen Fehlerkorrektur-Levels
    # Level L 7% der Codewörter/Daten können wiederhergestellt werden.
    # Level M 15% der Codewörter/Daten können wiederhergestellt werden.
    # Level Q 25% der Codewörter/Daten können wiederhergestellt werden.
    # Level H 30% der Codewörter/Daten können wiederhergestellt werden.

    attr_accessor :level

    def initialize(level = 'L')
      @level = level
    end
  end

  class Payload
    attr_accessor :data
    def initialize(data)
      @data = data
    end

    def size
      @data.size * 8 #size in bits
    end
  end
end




