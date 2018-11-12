class ArticlesController < ApplicationController
  def new
  end

  def create
    # render plain: params[:article].inspect
    # this renders the parameters in plain text and displays in view

    @article = Article.new(article_params)
    # every Rails model can be initialized with respective attributes which are
    # are mapped to the respective database column i.e. title and text.
    # Article.new refers to the class name in models/article.rb
    # class names in Ruby begin with a capital letter in Ruby.

    @article.save
    # this saves the model in the database
    # this returns a boolean whether the article was saved or not.

    redirect_to @article
    # we redirect user to the show action.

  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
    # this makes the parameters being passed private and restricted to only these params

end
