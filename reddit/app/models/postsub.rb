class Postsub < ApplicationRecord

    belongs_to :posts,
    class_name: :Post,
    foreign_key: :post_id

    belongs_to :subs,
    class_name: :Sub,
    foreign_key: :sub_id
end
