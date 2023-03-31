using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;

public partial class code_admin_mmweihu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string user = Session["currentuser"].ToString();
        Label1.Text = user;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "" )
        {
            Response.Write("<script language=javascript> alert('输入项不得有空项'); </script>");
            return;
        }
        if (TextBox3.Text != TextBox2.Text)
        {
            Response.Write("<script language=javascript> alert('请检查，两次输入的新密码不一致'); </script>");
            return;
        }
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string sql1 = "select * from admin where aname='" + Label1.Text + "'and amm='" + TextBox1.Text + "'";
        OdbcCommand myCommand = new OdbcCommand(sql1, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();
        if (sdr.Read())
        {
            string sql = "update admin set amm='" + TextBox2.Text + "'where aname='" + Label1.Text + "'";
            myCommand = new OdbcCommand(sql, con);
            //Response.Write(sql);
            myCommand.ExecuteNonQuery(); //在录入，修改，删除时用
            Response.Write("<script language=javascript> alert('修改成功');</script> ");
        }
        else
        {
            Response.Write("<script language=javascript> alert('账户或密码不符'); </script>");
            return;
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
    }
}