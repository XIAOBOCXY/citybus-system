using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;

public partial class code_admin_addguanhong : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，员工编号不得为空'); </script>");
            return;
        }
        if (TextBox2.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，员工密码不得为空'); </script>");
            return;
        }
        if (TextBox3.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，员工姓名不得为空'); </script>");
            return;
        }
        if (TextBox4.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，员工职务不得为空'); </script>");
            return;
        }
        if (TextBox5.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，员工月薪不得为空'); </script>");
            return;
        }
        if (TextBox6.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，员工初始满意度不得为空'); </script>");
            return;
        }
        if (TextBox1.Text.Length != 4)
        {
            Response.Write("<script language=javascript> alert('对不起，员工编号位数是4位'); </script>");
            return;
        }
        if (TextBox2.Text.Length != 6)
        {
            Response.Write("<script language=javascript> alert('对不起，员工密码位数是6位'); </script>");
            return;
        }
        for (int i = 0; i < TextBox5.Text.Length; i++)
        {
            if (string.Compare(TextBox5.Text.Substring(i, 1), "0") == -1 || string.Compare(TextBox5.Text.Substring(i, 1), "9") == 1)
            {
                Response.Write("<script language=javascript> alert('员工月薪请输入数字');</script> ");
                return;
            }
        }
        for (int i = 0; i < TextBox6.Text.Length; i++)
        {
            if (string.Compare(TextBox6.Text.Substring(i, 1), "0") == -1 || string.Compare(TextBox6.Text.Substring(i, 1), "9") == 1)
            {
                Response.Write("<script language=javascript> alert('员工初始满意度请输入数字');</script> ");
                return;
            }
        }
        if (Convert.ToInt32(TextBox6.Text)<0 || Convert.ToInt32(TextBox6.Text) > 100)
        {
            Response.Write("<script language=javascript> alert('对不起，输入的员工初始满意度不符'); </script>");
            return;
        }

        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string sql = "select * from  yuangong where yno='" + TextBox1.Text + "'";
        OdbcCommand myCommand = new OdbcCommand(sql, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {
            Response.Write("<script language=javascript> alert('管理员编号有重复');</script> ");
            return;
        }
        string sql1 = " insert into yuangong values ( '" + TextBox1.Text + "' ,'" + TextBox2.Text + "' ,'";
        sql1 = sql1 + TextBox3.Text + "' ,'" + TextBox4.Text + "', '" + TextBox5.Text + "', '" + TextBox6.Text+ "') ";
        myCommand = new OdbcCommand(sql1, con);
        //Response.Write(sql2);
        myCommand.ExecuteNonQuery(); //在录入，修改，删除时用
        Response.Write("<script language=javascript> alert('录入成功');</script> ");
        GridView1.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
    }
}