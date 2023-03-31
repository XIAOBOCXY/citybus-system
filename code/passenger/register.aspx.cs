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
        if (RadioButton1.Checked == false && RadioButton2.Checked == false)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，请选择性别')", true);
            return;
        }
        if (TextBox2.Text == "" || TextBox3.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，密码不得为空')", true);
            return;
        }
        if (TextBox5.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，身份证号不得为空')", true);
            return;
        }
        if (TextBox6.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，电话不得为空')", true);
            return;
        }
        if (TextBox1.Text.Length != 4)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，用户名是4位')", true);
            return;
        }
        if (TextBox6.Text.Length != 11)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，电话位数是11位')", true);
            return;
        }
        if (TextBox5.Text.Length != 18)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('对不起，身份证位数是18位')", true);
            return;
        }
        int i;
        for (i = 0; i < TextBox6.Text.Length; i++)
        {
            if (string.Compare(TextBox6.Text.Substring(i, 1), "0") == -1 || string.Compare(TextBox6.Text.Substring(i, 1), "9") == 1)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('电话请输入数字')", true);
                //Response.Write("<script language=javascript> alert('电话请输入数字');</script> ");
                return;
            }
        }
        for (i = 0; i < TextBox5.Text.Length - 1; i++)
        {
            if (string.Compare(TextBox5.Text.Substring(i, 1), "0") == -1 || string.Compare(TextBox5.Text.Substring(i, 1), "9") == 1)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('身份证前17位请输入数字')", true);
                return;
            }
        }
        if (TextBox2.Text != TextBox3.Text)
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('两次密码输入不正确')", true);
            return;
        }
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string xb = "";
        if (RadioButton1.Checked == true)
            xb = "男";
        if (RadioButton2.Checked == true)
            xb = "女";
        string sql1 = "select * from  passenger where pno='" + TextBox1.Text + "' or pname='" + TextBox2.Text + "' or pphone='" + TextBox6.Text + "' or pid='" + TextBox5.Text+ "';";
        OdbcCommand myCommand = new OdbcCommand(sql1, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {
            Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('用户名，姓名，电话,身份证号有重复')", true);
            //Response.Write("<script language=javascript> alert('用户名，姓名，电话有重复');</script> ");
            return;
        }
        string sql2 = " insert into passenger values ( '" + TextBox1.Text + "' ,'" + TextBox2.Text + "' ,'" + TextBox4.Text + "' ,'";
        sql2 = sql2 + xb + "' ,'" + TextBox5.Text + "' ,'" + TextBox6.Text +"') ";
        myCommand = new OdbcCommand(sql2, con);
        //Response.Write(sql2);
        myCommand.ExecuteNonQuery(); //在录入，修改，删除时用
        Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('乘客注册成功')", true);
        //Response.Write("<script language=javascript> alert('注册成功');</script> ");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("/login.aspx");
    }
}