class AuthorSessionsController < ApplicationController
    def new
    end
  
    def create
      if login(params[:email], params[:password])
        redirect_to(articles_path, notice: 'Logged in successfully.')
      else
        flash.now.alert = "Login failed."
        render action: :new
      end
      console
    end
  
    def destroy
      logout
      redirect_to(:authors, notice: 'Logged out!')
    end
  end
