class TributesController < ApplicationController
  def index
    @tributes = Tribute.all(:order => 'created_at DESC')
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
end
