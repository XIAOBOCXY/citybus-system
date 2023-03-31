using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;

public partial class code_passenger_editpassengerinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string user = Session["currentuser"].ToString();
        Label1.Text = user;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox4.Text != "")
        {
            for (int i = 0; i < TextBox4.Text.Length; i++)
            {
                if (string.Compare(TextBox4.Text.Substring(i, 1), "0") == -1 || string.Compare(TextBox4.Text.Substring(i, 1), "9") == 1)
                {
                    Response.Write("<script language=javascript> alert('电话请输入数字');</script> ");
                    return;
                }
            }
            if (TextBox4.Text.Length != 11)
            {
                Response.Write("<script language=javascript> alert('对不起，电话位数是11位'); </script>");
                return;
            }
        }
        if (TextBox3.Text != "")
        {
            if (TextBox3.Text.Length != 18)
            {
                Response.Write("<script language=javascript> alert('对不起，身份证号是18位'); </script>");
                return;
            }
            for (int i = 0; i < TextBox3.Text.Length - 1; i++)
            {
                if (string.Compare(TextBox3.Text.Substring(i, 1), "0") == -1 || string.Compare(TextBox3.Text.Substring(i, 1), "9") == 1)
                {
                    Response.Write("<script language=javascript> alert('身份证前17位请输入数字');</script> ");
                    return;
                }
            }
        }
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string user = Session["currentuser"].ToString();
        string sex = "";
        if(RadioButton1.Checked==true && RadioButton2.Checked == false)
        {
            sex = "男";
        }
        else if(RadioButton1.Checked==false && RadioButton2.Checked == true)
        {
            sex = "女";
        }
        int f = 0;
        string sql = "update passenger set ";
        if (TextBox1.Text != "")
        {
            if (f == 1) sql += ",";
            if (f == 0) f = 1;
            sql +="pmm='"+ TextBox1.Text+ "'";
        }
        if (TextBox2.Text != "")
        {
            if (f == 1) sql += ",";
            if (f == 0) f = 1;
            sql += " pname='" + TextBox2.Text + "'";
        }
        if(RadioButton1.Checked==true || RadioButton2.Checked == true)
        {
            if (f == 1) sql += ",";
            if (f == 0) f = 1;
            sql += " psex='" + sex + "' ";
        }
        if (TextBox3.Text != "")
        {
            if (f == 1) sql += ",";
            if (f == 0) f = 1;
            sql += "pid='" + TextBox3.Text + "'";
        }
        if (TextBox4.Text != "")
        {
            if (f == 1) sql += ",";
            if (f == 0) f = 1;
            sql += "pphone='" + TextBox4.Text + "'";
        }
        sql+= " where pno='" + user + "'";
        Response.Write(sql);
        OdbcCommand myCommand = new OdbcCommand(sql, con);  //将SQL语句装入缓冲区
        myCommand.ExecuteNonQuery(); //在录入，修改，删除时用
        Response.Write("<script language=javascript> alert('修改成功');</script> ");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        RadioButton1.Checked = false;
        RadioButton2.Checked = false;
        TextBox3.Text = "";
        TextBox4.Text = "";
    }
}