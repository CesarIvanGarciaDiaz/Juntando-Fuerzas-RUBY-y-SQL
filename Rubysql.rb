require 'sqlite3'

class Chef
  def self.create_table
    Chef.db.execute(
      <<-SQL
        CREATE TABLE chefs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          birthday DATE NOT NULL,
          email VARCHAR(64) NOT NULL,
          phone VARCHAR(64) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    Chef.db.execute(
      <<-SQL
        INSERT INTO chefs
          (first_name, last_name, birthday, email, phone, created_at, updated_at)
        VALUES
        ('Ferran', 'Adriá', '1985-02-09', 'ferran.adria@elbulli.com', '42381093238', DATETIME('now'), DATETIME('now')),
        ('Cesar','Garcia', '1993-05-10', 'pein_iscariote@hotmail.com','55252740471',DATETIME('now'),DATETIME('now')),
        ('Ivan','Diaz','1994-10-05','inge__garcia@hotmail.com','55252740471',DATETIME('now'),DATETIME('now')),
        ('Jhonatan','Ramirez','1996-01-04','conejo_en_llamas@hotmail.com','552534856078',DATETIME('now'),DATETIME('now'));
      SQL
    )
  end


  private

  def self.db
    @@db ||= SQLite3::Database.new("chefs.db")
  end

end
