using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Data.SqlClient;

/// <summary>
///ConnDBHelper 主要完成数据连接和数据操作功能
/// </summary>
public class ConnDBHelper
{
    private static SqlConnection myconn;
    private static SqlConnection Connection
    {
        get
        {
            string connstr = ConfigurationManager.ConnectionStrings["News"].ConnectionString;
            if (myconn == null)
            {
                myconn = new SqlConnection(connstr);
                myconn.Open();
            }
            else if (myconn.State == System.Data.ConnectionState.Closed)
            {
                myconn.Open();
            }
            else if (myconn.State == System.Data.ConnectionState.Broken)
            {
                myconn.Close();
                myconn.Open();
            }
            return myconn;
        }
    }
    public static int ExecuteCommand(string safeSql)
    {
        SqlCommand cmd = new SqlCommand(safeSql, Connection);
        int result=cmd.ExecuteNonQuery();
        return result;
    }
    public static int ExecuteCommand(string Sql,params SqlParameter[] values)
    {
        SqlCommand cmd = new SqlCommand(Sql, Connection);
        cmd.Parameters.AddRange(values);
        return cmd.ExecuteNonQuery();
    }
    public static object getScalar(string safeSql)
    {
        SqlCommand cmd = new SqlCommand(safeSql, Connection);
        return cmd.ExecuteScalar();
    }
    public static object getScalar(string Sql, params SqlParameter[] values)
    {
        SqlCommand cmd = new SqlCommand(Sql, Connection);
        cmd.Parameters.AddRange(values);
        return cmd.ExecuteScalar();
    }
    public static SqlDataReader GetReader(string safeSql)
    {
        SqlCommand cmd = new SqlCommand(safeSql, Connection);
        return cmd.ExecuteReader();
    }
    public static SqlDataReader GetReader(string Sql, params SqlParameter[] values)
    {
        SqlCommand cmd = new SqlCommand(Sql, Connection);
        cmd.Parameters.AddRange(values);
        return cmd.ExecuteReader();
    }
    public static DataTable GetDataTable(string safeSql)
    {
        DataSet ds=new DataSet();
        SqlCommand cmd = new SqlCommand(safeSql, Connection);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds.Tables[0];
    }
    public static DataTable GetDataTable(string Sql, params SqlParameter[] values)
    {
        DataSet ds=new DataSet();
        SqlCommand cmd = new SqlCommand(Sql, Connection);
        cmd.Parameters.AddRange(values);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(ds);
        return ds.Tables[0];
    }
}
