module ApplicationHelper
  def current_link_to(label, path, options={})
    content_tag('li', link_to(label, path, options), class: (current_page?(path) ? "active" : nil))
  end

  def link_to_login_or_signup
    if User.count.zero?
      current_link_to 'Sign up', signup_path
    else
      current_link_to 'Login', login_path
    end
  end
end
