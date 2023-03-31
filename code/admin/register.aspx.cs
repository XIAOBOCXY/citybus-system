using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，管理员用户名不得为空')", true);
            return;
        }
        if (TextBox2.Text == "" || TextBox3.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，密码不得为空')", true);
            return;
        }
        if (TextBox2.Text != TextBox3.Text)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('两次密码输入不正确')", true);
            return;
        }
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string sql1 = "select * from  admin where aname='" + TextBox1.Text + "';";
        OdbcCommand myCommand = new OdbcCommand(sql1, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('用户名已被注册')", true);
            return;
        }
        string sql2 = " insert into admin values ( '" + TextBox1.Text + "' ,'" + TextBox2.Text + "') ";
        myCommand = new OdbcCommand(sql2, con);
        //Response.Write(sql2);
        myCommand.ExecuteNonQuery(); //在录入，修改，删除时用
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('管理员注册成功')", true);
        //Response.Write("<script language=javascript> alert('注册成功');</script> ");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("/login.aspx");
    }
}