class GiftsBuilder
  def initialize(people:)
    @people = people

    @santas         = randomize_people
    @recipient_pool = randomize_people
    @gifts          = []
  end

  def call
    assign_all_gifts
    gifts_collection_verified? ? Gift.create(gifts) : GiftsBuilder.new(@people).call
  end

  private

  def randomize_people
    @people.shuffle.map { |p| {id: p.id, family_id: p.family_id} }
  end

  def assign_all_gifts
    @santas.each do |santa|
      recipient = get_recipient(santa)
      @gifts << {
        santa_id:     santa[:id],
        recipient_id: recipient[:id]
      }
    end
  end

  def gifts_collection_verified?
    GiftsCollectionVerifier.call(@gifts, @santas)
  end

  def get_recipient(santa)
    recipient = @recipient_pool.find { |r| r[:family_id] != santa[:family_id] }
    @recipient_pool.slice!(recipient)
  end
end
