using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;

public partial class code_admin_addpassenger : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，乘客编号不得为空'); </script>");
            return;
        }
        if (TextBox2.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，乘客密码不得为空'); </script>");
            return;
        }
        if (TextBox3.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，乘客姓名不得为空'); </script>");
            return;
        }
        if(RadioButton1.Checked==false && RadioButton2.Checked == false)
        {
            Response.Write("<script language=javascript> alert('对不起，请选择性别'); </script>");
            return;
        }
        if (TextBox5.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，乘客身份证号不得为空'); </script>");
            return;
        }
        if (TextBox6.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，乘客联系方式不得为空'); </script>");
            return;
        }
        if (TextBox1.Text.Length != 4)
        {
            Response.Write("<script language=javascript> alert('对不起，乘客编号位数是4位'); </script>");
            return;
        }
        if (TextBox2.Text.Length != 6)
        {
            Response.Write("<script language=javascript> alert('对不起，乘客密码位数是6位'); </script>");
            return;
        }
        if (TextBox5.Text.Length != 18)
        {
            Response.Write("<script language=javascript> alert('对不起，乘客身份证号位数是18位'); </script>");
            return;
        }
        if (TextBox6.Text.Length != 11)
        {
            Response.Write("<script language=javascript> alert('对不起，乘客联系方式位数是11位'); </script>");
            return;
        }
        for (int i = 0; i < TextBox6.Text.Length; i++)
        {
            if (string.Compare(TextBox6.Text.Substring(i, 1), "0") == -1 || string.Compare(TextBox6.Text.Substring(i, 1), "9") == 1)
            {
                Response.Write("<script language=javascript> alert('乘客联系方式请输入数字');</script> ");
                return;
            }
        }
        for (int i = 0; i < TextBox5.Text.Length - 1; i++)
        {
            if (string.Compare(TextBox5.Text.Substring(i, 1), "0") == -1 || string.Compare(TextBox5.Text.Substring(i, 1), "9") == 1)
            {
                Response.Write("<script language=javascript> alert('身份证前17位请输入数字');</script> ");
                return;
            }
        }
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string xb = "";
        if (RadioButton1.Checked == true)
            xb = "男";
        if (RadioButton2.Checked == true)
            xb = "女";
        string sql = "select * from  passenger where pno='" + TextBox1.Text + "' or pid='" + TextBox5.Text +"' or pphone='" + TextBox6.Text + "'";
        OdbcCommand myCommand = new OdbcCommand(sql, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {
            Response.Write("<script language=javascript> alert('乘客编号或身份证号或电话有重复');</script> ");
            return;
        }
        string sql1 = " insert into passenger values ( '" + TextBox1.Text + "' ,'" + TextBox2.Text + "' ,'" + TextBox3.Text + "' ,'";
        sql1 = sql1 + xb + "' ,'" + TextBox5.Text + "' ,'" + TextBox6.Text  + "') ";
        myCommand = new OdbcCommand(sql1, con);
        myCommand.ExecuteNonQuery(); //在录入，修改，删除时用
        Response.Write("<script language=javascript> alert('录入成功');</script> ");
        GridView1.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        RadioButton1.Checked = false;
        RadioButton2.Checked = false;
        TextBox5.Text = "";
        TextBox6.Text = "";
    }
}