class ArticlesController < ApplicationController
  def index
    @Article = Article.all
    render json:@Article
  end

  def getRcrdById
    if @Article = Article.find(params[:id])
      render json:@Article
    else
      format.json {render json:@Article.error, status:unprocessable_entity}
    end

  end

  def newRcrd
    puts params
    @Article = Article.new(article_params)
    if @Article.save
      render json: @Article
      format.json {render status:created, location:@Article}  
    else
      format.json {render json:@Article.error, status:unprocessable_entity}
    end

  end

  def updtRcrd
    if @Article = Article.find(params[:id])
      
      if @Article.update(article_params)
        render json:{status:ok,location:@Article}
      else
        format.json {render json:@Article.error, status:unprocessable_entity}
      end  
    else
      puts "No Record found!"
    end
    
  end

  def delRcrd
    if @Article = Article.find(article_params)
      @Article.destroy
      render json:@Article
    else
      puts "No Record Found!"
    end
   
  end
  private
    def article_params
      params.require(:article).permit(:title,:body)
    end  

end
