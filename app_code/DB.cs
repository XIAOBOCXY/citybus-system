using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data.Odbc;


/// <summary>
/// DB 的摘要说明
/// </summary>
public class DB
{
    public DB()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public static OdbcConnection lianjie()
    {
        //定义ODBC方式MYSQL数据库连接
        string strconn = "Driver={MySQL ODBC 5.1 Driver};Server=127.0.0.1;Database=citybus;User=root;Password=123456;Option=3;";
        OdbcConnection con = new OdbcConnection(strconn);
        return con;
    }
}