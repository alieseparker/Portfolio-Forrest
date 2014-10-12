require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  def article
    @article ||= articles :article_1
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  def test_update
    put :update, id: article, article: {
      body: @article.body, title: @article.title
    }
  end
end
