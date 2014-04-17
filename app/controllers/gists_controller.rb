class GistsController < ApplicationController
  respond_to :html

  def index
    @sort = params[:sort]
    if @sort == 'updated'
      @gists = Gist.updated.page(params[:page])
    else
      @gists = Gist.recent.page(params[:page])
    end
  end

  def show
    @gist = Gist.find(params[:id])
    
    @tree = @gist.tree(params[:revision].presence)
  end

  def revisions
    @gist = Gist.find(params[:id])
    @repo = @gist.repo.repo
    @current = @repo.lookup(params[:revision])
    @previous = @current.parents.first #@repo.head.target.parents.first.tree
    if @previous.nil?
      @diff = @repo.diff(nil, @current.tree)
    else
      @diff = @repo.diff(@previous.tree, @current.tree)

    end
  end

  def new
    @gist = Gist.new
  end

  def edit
    @gist = Gist.find(params[:id])
  end

  def create
    @gist = Gist.new(params[:gist])

    if @gist.save_and_commit
      redirect_to @gist, notice: 'Gist was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @gist = Gist.find(params[:id])

    if @gist.save_and_commit(params[:gist])
      redirect_to @gist, notice: 'Gist was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @gist = Gist.find(params[:id])

    @gist.destroy

    redirect_to gists_url, notice: 'Gist was successfully deleted'
  end
end
