using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "" || TextBox2.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，您的用户名或密码不得为空')", true);
            return;
        }
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        if(RadioButton1.Checked==false && RadioButton2.Checked==false && RadioButton3.Checked == false)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，请选择登录类型')", true);
            return;
        }
        if (RadioButton1.Checked == true)
        {
            string sql = "select * from admin where aname='" + TextBox1.Text + "' and amm='" + TextBox2.Text + "' ";
            OdbcCommand myCommand = new OdbcCommand(sql, con); //将sql语句装入缓冲区
            OdbcDataReader sdr = myCommand.ExecuteReader(); //执行sql查询
            if (sdr.Read())
            {
                Session["currentuser"] = TextBox1.Text;
                Response.Redirect("/code/admin/main.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，您的用户名或密码不正确，请重试');", true);
                return;
            }
        }
        else if (RadioButton2.Checked == true)
        {
            string sql = "select * from yuangong where yno='" + TextBox1.Text + "' and ymm='" + TextBox2.Text + "' ";
            OdbcCommand myCommand = new OdbcCommand(sql, con); //将sql语句装入缓冲区
            OdbcDataReader sdr = myCommand.ExecuteReader(); //执行sql查询
            if (sdr.Read())
            {
                Session["currentuser"] = TextBox1.Text;
                Response.Redirect("/code/yuangong/main.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，您的用户名或密码不正确，请重试');", true);
                return;
            }
        }
        else if (RadioButton3.Checked == true)
        {
            string sql = "select * from passenger where pno='" + TextBox1.Text + "' and pmm='" + TextBox2.Text + "' ";
            OdbcCommand myCommand = new OdbcCommand(sql, con); //将sql语句装入缓冲区
            OdbcDataReader sdr = myCommand.ExecuteReader(); //执行sql查询
            if (sdr.Read())
            {
                Session["currentuser"] = TextBox1.Text;
                Response.Redirect("/code/passenger/main.aspx");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，您的用户名或密码不正确，请重试');", true);
                return;
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (RadioButton1.Checked == false && RadioButton2.Checked == false && RadioButton3.Checked == false)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，请选择要注册的用户类型')", true);
            return;
        }
        if (RadioButton1.Checked == true)
        {
            Response.Redirect("/code/admin/register.aspx");
        }
        else if (RadioButton2.Checked == true)
        {
            Response.Redirect("/code/yuangong/register.aspx");
        }
        else if (RadioButton3.Checked == true)
        {
            Response.Redirect("/code/passenger/register.aspx");
        }
    }
}