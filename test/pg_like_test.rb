# frozen_string_literal: true

require "test_helper"
require "with_model"
class PgLikeTest < Minitest::Test
  extend WithModel

  def test_that_it_has_a_version_number
    refute_nil ::PgLike::VERSION
  end
  with_model :User, scope: :all do
    table do |t|
      t.string :name
      t.timestamps null: false
    end

    model do
      include PgLike::Scopes
    end
  end

  def test_like_any_scope
    User.create(name: "Jorge")
    User.create(name: "Ricardo Jorge Silva")
    User.create(name: "Amage Jorgê")

    assert_equal 3, User.like_any(:name, "jorge").count
  end

end
