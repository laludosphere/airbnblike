class ReviewsController < ApplicationController

  def new
    @flat = Flat.find(params[:flat_id])
    @review = Review.new
  end


  def create
    @review = Review.new(review_params)
    @flat = Flat.find(params[:flat_id])
    @review.flat = @flat
    if @review.save
    redirect_to flat_path(@flat, anchor: "review-#{@review.id}")
    else
      render :new
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to flat_path(@review.flat)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
