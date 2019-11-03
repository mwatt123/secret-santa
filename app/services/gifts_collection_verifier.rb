class GiftsCollectionVerifier
  def self.call(gifts, santas)
    @gifts  = gifts
    @santas = santas

    return false unless counts_match?
    return false unless gifts_not_nil?
    return false unless santas_unique?
    return false unless recipients_unique?

    true
  end

  private

  def counts_match?
    @gifts.size == santas.size
  end

  def gifts_not_nil?
    @gifts.each do |gift|
      break false if gift[:santa_id].blank? || gift[:recipient_id].blank? 
    end
  end

  def santas_unique?
    #uniq! returns nil if the array only has unique values
    @gifts.map(&:santa_id).uniq! == nil
  end

  def recipients_unique?
    #uniq! returns nil if the array only has unique values
    @gifts.map(&:recipient_id).uniq! == nil
  end
end
