
using System.Data.SQLite;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Net.Http.Headers;

public class ProdutoRepository
{
    public void Inserir(Produto produto)
    {
        using var conn = Database.GetConnection();

        string sql = @"INSERT INTO produto
(nome, valor, quantidade, descricao)
VALUES
(@nome, @valor, @quantidade, @descricao)";
        using var cmd = new SQLiteCommand(sql, conn);
        cmd.Parameters.AddWithValue("@nome", produto.Nome);
        cmd.Parameters.AddWithValue("@valor", produto.Valor);
        cmd.Parameters.AddWithValue("@quantidade", produto.Quantidade);
        cmd.Parameters.AddWithValue("@descricao", produto.Descricao);

        cmd.ExecuteNonQuery();
    }

}