class TagsController < ApplicationController

    def show
        @tag = Tag.find(
        params[:id]
        )
    end
    
    def index
        @tag = Tag.all
    end
    
    def destroy
        @tag = Tag.find(params[:id])
        if @tag.destroy
            flash[:success] = 'Tag was successfully deleted.'
            redirect_to tags_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to tags_url
        end
    end
    

end
