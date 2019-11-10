class GiftsCollectionVerifier
  class << self
    def call(gifts:, santas:)
      @gifts  = gifts
      @santas = santas

      return false unless counts_match?
      return false unless gifts_not_blank?
      return false unless santas_unique?
      return false unless recipients_unique?

      true
    end

    private

    def counts_match?
      @gifts.size == @santas.size
    end

    def gifts_not_blank?
      gifts_present = true
      gifts_present = @gifts.each do |gift|
        break false if gift[:secret_santa_id].blank? || gift[:recipient_id].blank? 
      end
    end

    def santas_unique?
      # puts "gifts count: #{@gifts.size}, unique: #{@gifts.map{ |g| g[:secret_santa_id] }.uniq.size}"
      @gifts.size == @gifts.map{ |g| g[:secret_santa_id] }.uniq.size
    end

    def recipients_unique?
      @gifts.size == @gifts.map{ |g| g[:recipient_id] }.uniq.size
    end
  end
end
