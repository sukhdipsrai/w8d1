class Post < ApplicationRecord
    validates :title, :author_id, presence: true

    belongs_to :author,
     foreign_key: :author_id,
     class_name: :User

     has_many :postsubs,
     foreign_key: :post_id,
     class_name: :Postsub
     
     has_many :subs,
     through: :postsubs,
     source: :subs
end

