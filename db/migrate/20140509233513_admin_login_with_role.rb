class AdminLoginWithRole < ActiveRecord::Migration
  def up
    admin = User.new
    admin.first_name = "Bajaj"
    admin.last_name = "Admin"
    admin.email = "admin1@example.com"
    admin.password = "secret"
    admin.password_confirmation = "secret"
    admin.role = "admin"
    admin.save!
  end

  def down
    admin = User.find_by_email "admin1@example.com"
    User.delete admin
  end
end

