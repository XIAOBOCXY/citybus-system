using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;

public partial class code_yuangong_lookinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string user = Session["currentuser"].ToString();
        string sql1 = "select * from  yuangong where yno='" + user + "';";
        OdbcCommand myCommand = new OdbcCommand(sql1, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        int nowscore = 0;
        if (sdr.Read())
        {
            Label1.Text = sdr["yno"].ToString();
            Label2.Text = sdr["ymm"].ToString();
            Label3.Text = sdr["yname"].ToString();
            Label4.Text =sdr["yjob"].ToString();
            Label5.Text = Convert.ToInt32(sdr["ymoney"]).ToString();
            nowscore = Convert.ToInt32(sdr["ysat"]);
        }
        int sum = 0;
        int add = 0;
        string sql2 = "select count(*) as summ ,sum(dscore) as addd from dis where dis.yno='" + user + "';";
        myCommand = new OdbcCommand(sql2, con);
        sdr = myCommand.ExecuteReader();
        if (sdr.Read())
        {
            sum= Convert.ToInt32(sdr["summ"]);
            if (sum != 0)
            {
                add = Convert.ToInt32(sdr["addd"]);
            }
        }
        Label6.Text = ((nowscore + add)  / (sum + 1)).ToString();
    }
}