class AccessLevels

  def self.roles_assignable(role_level)
    return ["admin", "moderator"] if role_level == "supreme_admin"
    return ["moderator"] if role_level == "admin"
  end

end
