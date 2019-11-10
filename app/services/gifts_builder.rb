class GiftsBuilder
  def initialize(people:)
    @people = people

    @santas         = randomize_people
    @recipient_pool = randomize_people
    @gifts          = []
  end

  def call
    assign_all_gifts
    gifts_collection_verified? ? Gift.create(@gifts) : GiftsBuilder.new(people: @people).call
  end

  private

  def randomize_people
    @people.shuffle.map { |p| {id: p.id, family_id: p.family_id} }
  end

  def assign_all_gifts
    @santas.each do |santa|
      recipient = get_recipient(santa)
      break unless recipient
      @gifts << {
        secret_santa_id: santa[:id],
        recipient_id:    recipient[:id]
      }
    end
  end

  def gifts_collection_verified?
    verified = GiftsCollectionVerifier.call(gifts: @gifts, santas: @santas)
    puts "verified? #{verified}"
    verified
  end

  def get_recipient(santa)
    recipient = @recipient_pool.find { |r| r[:family_id] != santa[:family_id] }
    @recipient_pool.delete(recipient)
  end
end
