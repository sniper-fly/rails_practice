class InquiryController < ApplicationController
  def index
  end

  def new
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    # binding.pry
    if params[:back]
      render :new
    elsif @inquiry.save
      # NoticeMailer.sendmail_blog(@inquiry).deliver
      redirect_to inquiry_index_path
    else
      render :new
    end
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:name, :mail_address, :category, :content)
  end
end
