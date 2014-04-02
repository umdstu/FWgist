module ApplicationHelper
  def public_clone_url(gist)
    hostname = if defined?(HOSTNAME) then HOSTNAME else request.host end
    "git://#{hostname}/#{gist.id}.git"
  end
end
