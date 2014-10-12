class ArticlePolicy < ApplicationPolicy
  def update?
    user.editor? || user.author?
  end

  def destroy?
    user.editor?
  end

  def publish?
    user.editor?
  end

  # app/policies/article_policy
  class Scope < Scope
    def resolve
      scope
    end
  end
end
