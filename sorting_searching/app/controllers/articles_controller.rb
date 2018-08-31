class ArticlesController < ApplicationController
	# layout "articles"
  # instanisasi class harus sesuai nama kelas {tapi harus sama : article}
  
    # before_action :check_current_user, only: [:new, :create, :edit, :update, :destroy]

  # helper_method :sort_column, :sort_direction
  
  def index
    @article = Article.all
    # for pagination
    @article = Article.page(params[:page]).per(5)
    # render 'index'
    # @articles = Article.order(sort_column+ ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
    # @articles = Article.search(params[:search])
    # respond_to do |format|
    #   format.js{
    #     @article = Article.where("title like ? or content like ?", "%#{params[:search]}%", "%#{params[:search]}%").order("#{params[:column]} #{params[:direction]}")
    #   }
    # end

    # for sorting
    @article = Article.order(params[:sort])

    # for search
    @article = Article.search(params[:search])
  end

  def new
    @article = Article.new
    @comment = Comment.new
  	
  end

   def edit
    @article = Article.find_by_id(params[:id])
  end

  def create
    @article = Article.new(params_artikel)
    if @article.save
    flash[:notice] = "Success Add Rows"
  else
    flash[:notice] = "Error Add Rows"
  end
  end

  def show
    @article = Article.find_by_id(params[:id])
    @comments = @article.comments.order("id desc")
    @comment = Comment.new

  end

  def delete 
    @article = Article.find_by_id(params[:article_id])
  end



  def update
    @article = Article.find_by_id(params[:id])
    if @article.update(params_artikel)
      flash[:notice] = "Success Update Rows"
      redirect_to action: 'index'
    else
      flash[:notice] = "Error Update Rows"
      render 'edit'
    end
  end

  def destroy
    @article = Article.find_by_id(params[:id])

    if @article.destroy
      flash[:notice] = "Success Delete a Records"
      redirect_to action: 'index'
    else
      flash[:error] = "fails delete a records"
      redirect_to action: 'index'
    end

  end

  private
   def params_artikel
    params.require(:article).permit(:title, :content, :status)
  end  

 

  def list
  	  @artikel = Article.all
  end

  def sort_column
    Article.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

end
