using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;

public partial class code_passenger_lookpassengerinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string user = Session["currentuser"].ToString();
        string sql1 = "select * from  passenger where pno='" + user + "';";
        OdbcCommand myCommand = new OdbcCommand(sql1, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        int nowscore = 0;
        if (sdr.Read())
        {
            Label1.Text = sdr["pno"].ToString();
            Label2.Text = sdr["pmm"].ToString();
            Label3.Text = sdr["pname"].ToString();
            Label4.Text = sdr["psex"].ToString();
            Label5.Text = sdr["pid"].ToString();
            Label6.Text = sdr["pphone"].ToString();
        }
    }
}