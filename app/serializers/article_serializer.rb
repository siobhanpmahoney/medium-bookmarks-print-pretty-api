class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :date
end
