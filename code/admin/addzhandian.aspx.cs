using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;

public partial class code_admin_addzhandian : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，站点编号不得为空'); </script>");
            return;
        }
        if (TextBox2.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，站点名称不得为空'); </script>");
            return;
        }
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string sql1 = "select * from  pos where zno='" + TextBox1.Text + "' or zname='" + TextBox2.Text + "'";
        OdbcCommand myCommand = new OdbcCommand(sql1, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {
            Response.Write("<script language=javascript> alert('站点编号或站点名称有重复');</script> ");
            return;
        }
        string sql2 = " insert into pos values ( '" + TextBox1.Text + "' ,'" + TextBox2.Text + "') ";
        myCommand = new OdbcCommand(sql2, con);
        //Response.Write(sql2);
        myCommand.ExecuteNonQuery(); //在录入，修改，删除时用
        Response.Write("<script language=javascript> alert('录入成功');</script> ");
        GridView1.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }
}