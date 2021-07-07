class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.select(:id, :name, :article, :created_at, :user_id).includes(:user)
  end

  # GET /blogs/1 or /blogs/1.json
  def show
    # binding.pry
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    # binding.pry
  end

  # GET /blogs/1/edit
  def edit
    # binding.pry
  end

  # POST /blogs or /blogs.json
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id

    respond_to do |format|
      if @blog.save
        # NoticeMailer.sendmail_blog(@blog).deliver
        format.html { redirect_to blog_url(@blog.id), notice: "Blog was successfully created." }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_url(@blog.id), notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      @blogs = Blog.all
      format.html { render :index, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def top
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:name, :article)
    end
end
