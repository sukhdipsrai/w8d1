class Sub < ApplicationRecord
    validates :title, :description, :mod_id, presence: true

    has_many :postsubs,
    class_name: :Postsubs,
    foreign_key: :sub_id

    has_many :posts,
    through: :postsubs,
    source: :posts

    belongs_to :mod,
    foreign_key: :mod_id,
    class_name: :User

end
