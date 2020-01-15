class Migrate2 < ActiveRecord::Migration[5.2]
  def change
        ActiveRecord::Base.connection.execute("INSERT INTO divisions (name, id) VALUES ('No Division', 0);")
  end
end
