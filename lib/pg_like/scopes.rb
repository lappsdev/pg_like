module PgLike
    module Scopes
        extend ActiveSupport::Concern
        included do
            scope :like_any, lambda { |field, terms = nil, criterea: :both, unaccent: true|
                terms = [terms] unless terms.is_a?(Array)
                terms = terms.map(&:downcase)
                terms = terms.map do |string|
                  string.prepend('%') if %i[both starts_with].include?(criterea.to_sym)
                  string.concat('%') if %i[both ends_with].include?(criterea.to_sym)
                  "UNACCENT('#{string}')" if unaccent
                end
                left_clause = "LOWER(#{field})"
                left_clause = "UNACCENT(#{left_clause})" if unaccent
                right_clause = "(array[#{terms.join(', ')}])"
                where("#{left_clause} LIKE ANY #{right_clause}")
              }

            scope :like_all, lambda { |field, terms = nil, criterea: :both, unaccent: true|
                terms = [terms] unless terms.is_a?(Array)
                terms = terms.map(&:downcase)
                terms = terms.map do |string|
                  string.prepend('%') if %i[both starts_with].include?(criterea.to_sym)
                  string.concat('%') if %i[both ends_with].include?(criterea.to_sym)
                  "UNACCENT('#{string}')" if unaccent
                end
                left_clause = "LOWER(#{field})"
                left_clause = "UNACCENT(#{left_clause})" if unaccent
                right_clause = "(array[#{terms.join(', ')}])"
                where("#{left_clause} LIKE ALL #{right_clause}")
              }
          end

    end
end