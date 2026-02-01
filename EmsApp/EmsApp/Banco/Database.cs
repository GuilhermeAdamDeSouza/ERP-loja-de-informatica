using System.Data.SQLite;

public static class Database
{
    private static string connectionString =
        "Data Source=ems.db;Version=3;";

    public static SQLiteConnection GetConnection()
    {
        var conn = new SQLiteConnection(connectionString);
        conn.Open();

        // Para as Foreing Keys
        using var cmd = new SQLiteCommand("PRAGMA foreing_keys = ON;", conn);
        cmd.ExecuteNonQuery();

        return conn;
    }
}