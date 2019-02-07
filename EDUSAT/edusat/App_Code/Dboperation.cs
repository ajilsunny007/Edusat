using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Dboperation
/// </summary>
public class Dboperation
{
    SqlConnection con;
    SqlCommand cmd;
    SqlTransaction transaction;
    public void OpenConnection()
    {
        con = new SqlConnection(ConfigurationManager.AppSettings["CN"].ToString());
        cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
      
        con.Close();
        con.Open();
    }
    public void CloseConnection()
    {
        con.Dispose();
        con.Close();
    }

    public int ExeNonQuery(string Sql)
    {
        cmd.CommandText = Sql;
        int rows = cmd.ExecuteNonQuery();
        return rows;
    }
    public object ExeScalar(string Sql)
    {
        OpenConnection();
        cmd.CommandText = Sql;
        object field = cmd.ExecuteScalar();
        if (field != null)
            return field;
        else
            return "";
    }
    public SqlDataReader ExeReader(string Sql)
    {
        OpenConnection();
        SqlDataReader dr = null;
        cmd.CommandText = Sql;
        dr = cmd.ExecuteReader();
        return dr;
    }
    public DataTable FillDataTable(string Sql)
    {
        OpenConnection();
        cmd.CommandText = Sql;
        SqlDataAdapter da = new SqlDataAdapter(Sql, con);
        DataTable data = new DataTable();
        da.Fill(data);
        CloseConnection();
        return data;
    }
    public DataSet FillDataSet(string Sql)
    {
        OpenConnection();
        cmd.CommandText = Sql;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "my_dt");
        CloseConnection();
        return ds;
    }
    public string Generate_Id(string sql, string strchar)
    {
        con = new SqlConnection(ConfigurationManager.AppSettings["CN"].ToString());
        con.Open();
        string stid, returnid, strnum;
        int num = 0;
        SqlCommand cmd = new SqlCommand(sql, con);
        stid = cmd.ExecuteScalar().ToString();
        if (stid == "")
        {
            returnid = strchar + "1000";
            con.Close();
            return returnid;
        }
        else
        {
            num = Convert.ToInt32(stid.Substring(3, 4));
            num++;
            strnum = Convert.ToString(num);
            returnid = strchar + strnum;
            con.Close();
            return returnid;
        }
    }
    public void begintransaction()
    {
        OpenConnection();
        transaction = con.BeginTransaction("CurrentTrans");
        cmd.Transaction = transaction;

    }
    public void committransaction()
    {
        transaction.Commit();
        CloseConnection();
    }
    public void rollbacktransaction()
    {
        transaction.Rollback("CurrentTrans");
        CloseConnection();
    }

}