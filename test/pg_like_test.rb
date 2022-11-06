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

  def test_like_any_scope_without_unaccent
    User.create(name: "Jorge Urubu")
    User.create(name: "Ricardo Jorge Silva")
    User.create(name: "Amage Jorge")

    assert_equal 3, User.like_any(:name, "jorge", unaccent: false).count
    assert_equal 1, User.like_any(:name, "jorge", unaccent: false, criterea: :starts_with).count
    assert_equal 1, User.like_any(:name, "jorge", unaccent: false, criterea: :ends_with).count

  end

end
