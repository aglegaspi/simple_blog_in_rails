class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index

    @articles = Article.all
    
  end

  def show
    
    @article = Article.find(params[:id])
    # find the article passing param id to get the id from the request
    # use an instance variable to hold a reference to the article object which will
    # pass all the instance variables to the view

  end

  def new

    @article = Article.new

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
      if @article.save
        redirect_to @article
        # we redirect user to the show action.
      else
        render 'new'
        # when validation return false we will show the form back to the user
        # the @article object is passed back to the new template when it is rendered
      end

  end

  def edit

    @article = Article.find(params[:id])

  end

  def update

    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end

    # the update method is used when you want to update a record that already exists
    # it accepts a hash containing the attributes "article_params" that you want to update
    # if there's an error we will show the form back to the user
    
  end

  def destroy
  end


  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
    # this makes the parameters being passed private and restricted to only these params

end
