class IssuesController < ApplicationController

  def index
    @locality = Locality.find(params[:locality_id])
    @issues = @locality.issues
  end

  def new
    @locality = Locality.find(params[:locality_id])
    @issue = Issue.new
  end

  def show
    @issue = Issue.find(params[:id])
    @locality = Locality.find(@issue.locality_id)
    # binding.pry
    render :show
  end

  def create
    @locality = Locality.find(params[:locality_id])
    @issue = Issue.new(review_params)
    @issue.locality = @locality

    if @issue.save
      flash[:notice] = "Issue saved successfully."
      redirect_to review_path(@locality)
    else
      flash[:alert] = "Failed to save issue."
      render :new
    end
  end

  def edit
    @issue = Issue.find(params[:id])
    @locality = Locality.find(@issue.locality_id)
    render :edit

  end

  def update
    @issue = Issue.find(params[:id])
    @locality = Locality.find(@issue.locality_id)
    if @issue.update_attributes(issue_params)
      flash[:notice] = 'Thanks for updating!'
      redirect_to @issue
    else
      render 'edit'
    end
  end

  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy
    redirect_to @question
  end


  private

  def issue_params
    params.require(:issue).permit(:title, :body, :rating)
  end

end
