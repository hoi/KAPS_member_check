class MembersController < ApplicationController
  def search
    respond_to do |format|
      format.html # search.html.erb
      format.json { render json: @coins }
    end
  end

  def results
    @result = "No Results Found."
    if params[:name] != "" or params[:email] != "" or params[:paypal] != ""
      if params[:name] != ""
        member_query = Member.where('upper(name) LIKE "%' + params[:name].upcase + '%"')
      elsif params[:email] != ""
        member_query = Member.where('upper(email)=?', params[:email].upcase)
      elsif params[:paypal] != ""
        member_query = Member.where('upper(paypal_email)=?', params[:paypal].upcase)
      end

      if member_query.count > 1
        @result = "Multiple entries found.  Please try again."
      elsif member_query.count == 1
        member = member_query.first
        if member.lifetime
          @result = member.name + " is a lifetime member."
        elsif member.membership_end.nil? or member.membership_end == ""
          @result = member.name + " has insufficient information."
        elsif member.membership_end >= Date.today
          @result = member.name + " is currently a member."
        else
          @result = member.name + " is no longer a member."
        end
      end
    else
      @result = "Please enter at least one field."
    end

    respond_to do |format|
      format.html # search.html.erb
      format.json { render json: @coins }
    end
  end
end
