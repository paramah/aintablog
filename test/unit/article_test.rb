require File.dirname(__FILE__) + '/../test_helper'

class ArticleTest < ActiveSupport::TestCase
  
  def test_should_create_an_article
    assert_difference 'Article.count' do
      article = create_article
    end
  end
  
  def test_should_require_header
    assert_no_difference 'Article.count' do
      article = create_article( :header => nil )
      assert ! article.valid?, article.to_yaml
    end
  end
  
  def test_should_require_content
    assert_no_difference 'Article.count' do
      article = create_article( :content => nil )
      assert ! article.valid?, article.to_yaml
    end
  end
  
protected

  def create_article(options={})
    Article.create({ :header => 'A Title', :content => 'Some content', :user_id => users(:quentin).id }.merge(options))
  end
end