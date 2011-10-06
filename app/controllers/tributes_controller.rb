class TributesController < ApplicationController
  def index
    @tributes = Tribute.all(:order => 'created_at DESC')
  end

  def show
    @tribute = Tribute.find(params[:id])
  end

  def new
    @tribute = Tribute.new
  end

  def create
    @tribute = Tribute.new(params[:tribute])
    if @tribute.save
      redirect_to tributes_url, :notice => "Successfully created tribute."
    else
      render :action => 'new'
    end
  end

  def edit
    @tribute = Tribute.find(params[:id])
  end

  def update
    @tribute = Tribute.find(params[:id])
    if @tribute.update_attributes(params[:tribute])
      redirect_to @tribute, :notice  => "Successfully updated tribute."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @tribute = Tribute.find(params[:id])
    @tribute.destroy
    redirect_to tributes_url, :notice => "Successfully destroyed tribute."
  end
end
