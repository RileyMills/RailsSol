module RPM
  class Sol

    SUIT = ['A',2,3,4,5,6,7,8,9,10,'J','Q','K'].freeze
    HEARTS_PREFIX = 'H'.freeze
    DIAMONDS_PREFIX = 'D'.freeze
    SPADES_PREFIX = 'S'.freeze
    CLUBS_PREFIZ = 'C'.freeze

    attr_accessor :deck, :options

    def defaults
      {
          seed: Time.now.to_i
      }
    end

    def initialize(opts = {})
      @options = defaults.merge(opts)
      @random = Random.new(@options[:seed])

      initialize_deck

    end

    def initialize_deck
      @deck = []

      [HEARTS_PREFIX, DIAMONDS_PREFIX, SPADES_PREFIX, CLUBS_PREFIZ].each do |suit|
        @deck.concat(SUIT.map{|card| "#{suit}_#{card}"})
      end

      @deck = @deck.shuffle(random: @random)
    end

  end
end