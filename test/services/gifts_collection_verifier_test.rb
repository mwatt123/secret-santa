require 'test_helper'

class GiftsCollectionVerifierTest < ActiveSupport::TestCase

  test "it returns true when data is valid" do
    gifts = [
      {
        santa_id:     1,
        recipient_id: 2
      },
      {
        santa_id:     2,
        recipient_id: 3
      },
      {
        santa_id:     3,
        recipient_id: 4
      },
      {
        santa_id:     4,
        recipient_id: 1
      }
    ]
    santas = ['array length', 'must', 'eql', 'gifts#size']

    assert GiftsCollectionVerifier.call(gifts, santas)
  end

  test "it returns false when a santa is blank" do
    gifts = [
      {
        santa_id:     1,
        recipient_id: 2
      },
      {
        santa_id:     2,
        recipient_id: 3
      },
      {
        santa_id:     3,
        recipient_id: 4
      },
      {
        santa_id:     nil,
        recipient_id: 1
      }
    ]
    santas = ['array length', 'must', 'eql', 'gifts#size']

    refute GiftsCollectionVerifier.call(gifts, santas)
  end

  test "it returns false when santa count doesnt equal gift count" do
    gifts = [
      {
        santa_id:     1,
        recipient_id: 2
      },
      {
        santa_id:     2,
        recipient_id: 3
      },
      {
        santa_id:     3,
        recipient_id: 4
      },
      {
        santa_id:     4,
        recipient_id: 1
      }
    ]
    santas = ['array length', 'not', 'eql', 'to', 'gifts#size']

    refute GiftsCollectionVerifier.call(gifts, santas)
  end

  test "it returns false when santa duplicated" do
    gifts = [
      {
        santa_id:     1,
        recipient_id: 2
      },
      {
        santa_id:     1,
        recipient_id: 3
      },
      {
        santa_id:     3,
        recipient_id: 4
      },
      {
        santa_id:     4,
        recipient_id: 1
      }
    ]
    santas = ['array length', 'must', 'eql', 'gifts#size']

    refute GiftsCollectionVerifier.call(gifts, santas)
  end

  test "it returns false when recipient duplicated" do
    gifts = [
      {
        santa_id:     1,
        recipient_id: 2
      },
      {
        santa_id:     2,
        recipient_id: 4
      },
      {
        santa_id:     3,
        recipient_id: 4
      },
      {
        santa_id:     4,
        recipient_id: 1
      }
    ]
    santas = ['array length', 'must', 'eql', 'gifts#size']

    refute GiftsCollectionVerifier.call(gifts, santas)
  end

end
