class ItemsController < ApplicationController
  before_filter :check_ip, only: :vote_up

  def vote_up
    poll = Poll.find(params[:poll_id])
    item = poll.items.find(params[:id])
    
    item.increment!(:votes)
    poll.ip_lists.create(ip_address: current_ip) unless poll.ip_lists.find_by_ip_address(current_ip)

    redirect_to poll_path(poll), notice: 'Your vote was successfully recorded.'
  end

  protected 
    def check_ip
      poll = Poll.find(params[:poll_id])
      if poll.ip_lists.find_by_ip_address(current_ip)
        redirect_to poll_path(poll), alert: "You've already voted."
      end        
    end
  
end
