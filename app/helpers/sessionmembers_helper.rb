module SessionmembersHelper

  def log_in_member(member)
    session[:member_id] = member.id
  end

  def current_member
    @current_member ||= Member.find_by(id: session[:member_id])
  end

  def logged_in_member?
    !current_member.nil?
  end

  def log_out_member
    session.delete(:member_id)
    @current_member = nil
  end

end
