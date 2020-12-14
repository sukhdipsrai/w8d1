class SubController < ApplicationController


    def new
        @sub = Sub.new
        render :new
    end

    def create

    end

    def edit
        # id 
        @sub = Sub.find(params[:id])
        if @sub
            render :edit
        else
            flash[:errors] = ["sub does not exit"]
            redirect_to new_sub_url
        end
    end

    def update
        # params has the new data we want in our sub
        @sub = Sub.find(params[:id])
        #if update is not the way, create new and destroy old
        
        if @sub.update(update_params)
            redirect sub_url(params[:id])
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def index
    end

    def show

    end

    private
    def update_params
        params.require(:sub).permit(:title,:description,:mod_id)
    end

end