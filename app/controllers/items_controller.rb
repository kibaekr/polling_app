class ItemsController < ApplicationController
  before_filter :check_ip, only: :vote_up

  def vote_up
    poll = Poll.find(params[:poll_id])
    item = poll.items.find(params[:id])
    item.increment!(:votes)

    redirect_to poll_path(poll), notice: 'Your vote was successfully recorded.'
  end

  protected 
    def check_ip
      #logic to check ip. return if user has already voted.
    end
  
end
