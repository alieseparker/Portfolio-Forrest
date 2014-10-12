class ApplicationPolicy
  attr_reader :user, :record

  class NilUser
    def editor?
      false
    end

    def author?
      false
    end

    def visitor?
      false
    end

    def id?
      false
    end
  end

  def initialize(user, record)
    if user
      @user = user
    else
      @user = NilUser.new
    end
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    destroy?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  # app/policies/application_policy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
