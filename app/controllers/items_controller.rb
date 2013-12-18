class ItemsController < ApplicationController

  def vote_up
    poll = Poll.find(params[:poll_id])
    item = poll.items.find(params[:id])
    item.increment!(:votes)

    redirect_to poll_path(poll), notice: 'Your vote was successfully recorded.'
  end
  
end
