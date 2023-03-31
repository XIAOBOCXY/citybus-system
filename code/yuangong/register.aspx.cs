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
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，用户名不得为空')", true);
            return;
        }
        if (TextBox4.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，姓名不得为空')", true);
            return;
        }
        if (TextBox2.Text == "" || TextBox3.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，密码不得为空')", true);
            return;
        }
        if (TextBox5.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，职务不得为空')", true);
            return;
        }
        if (TextBox1.Text.Length != 4)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，管理员编号位数是4位')", true);
            return;
        }
        if (TextBox2.Text != TextBox3.Text)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('两次密码输入不正确')", true);
            return;
        }
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string sql1 = "select * from  yuangong where yno='" + TextBox1.Text + "'";
        OdbcCommand myCommand = new OdbcCommand(sql1, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('用户名已被注册')", true);
            return;
        }
        string sql2 = " insert into yuangong values ( '" + TextBox1.Text + "' ,'" + TextBox2.Text + "' ,'";
        sql2 = sql2 +  TextBox4.Text + "' ,'" + TextBox5.Text + "', '3500' , '90' )";
        myCommand = new OdbcCommand(sql2, con);
        myCommand.ExecuteNonQuery(); //在录入，修改，删除时用
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('员工注册成功')", true);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("/login.aspx");
    }
}