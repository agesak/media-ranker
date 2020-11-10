class WorksController < ApplicationController

  def index
    @albums = Work.all.where(category: "album")
    @books = Work.all.where(category: "book")
    @movies = Work.all.where(category: "movie")
  end

  def show
    @work = Work.find_by(id: params[:id])

    # TODO:
    # if @work.nil?
    #   # here need to redirect to an error page
    # end
  end

  def edit
    @work = Work.find_by(id: params[:id])

    # TODO:
    # if @work.nil?
    #   # here need to redirect to an error page
    # end
  end

  def update
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      # TODO:
      # here need to redirect to an error page
      # return
      puts "redirect to that same error page as above"
    elsif @work.update(work_params)
      # TO DO: also need to have that successfully updated thing pop up
      redirect_to work_path(@work.id)
    end
  end

  def destroy
    @work = Work.find_by(id: params[:id])

    if @work
      # TO DO: also need to have that successfully updated thing pop up
      @work.destroy
    end
    redirect_to root_path
     
  end


  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end