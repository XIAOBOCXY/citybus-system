using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;

public partial class code_admin_editpassenger : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Page")//判断是否是分页事件
        {
            return;//跳出执行 下面按钮执行代码
        }
        int rowSelected = Convert.ToInt32(e.CommandArgument);
        //rowSelected = 0;
        if (rowSelected > 9) rowSelected = 0;
        TextBox1.Text = GridView1.Rows[rowSelected].Cells[0].Text;
        TextBox2.Text = GridView1.Rows[rowSelected].Cells[1].Text;
        TextBox3.Text = GridView1.Rows[rowSelected].Cells[2].Text;
        string xb = GridView1.Rows[rowSelected].Cells[3].Text;
        if (xb == "男")
        {
            RadioButton1.Checked = true;
            RadioButton2.Checked = false;
        }
        if (xb == "女")
        {
            RadioButton2.Checked = true;
            RadioButton1.Checked = false;
        }
        TextBox5.Text = GridView1.Rows[rowSelected].Cells[4].Text;
        TextBox6.Text = GridView1.Rows[rowSelected].Cells[5].Text;
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
        if (RadioButton1.Checked == false && RadioButton2.Checked == false)
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
        string sql = "select * from  passenger where pno='" + TextBox1.Text + "'";
        OdbcCommand myCommand = new OdbcCommand(sql, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {

        }
        else
        {
            Response.Write("<script language=javascript> alert('对不起，该乘客编号不存在'); </script>");
            return;
        }
        string sql1 = " update passenger set pmm='" + TextBox2.Text + "' ,pname='" + TextBox3.Text + "' ,";
        sql1 = sql1 + " psex='" + xb + "' ,pid='" + TextBox5.Text + "' ,pphone='" + TextBox6.Text + "'";
        sql1 = sql1 + " where pno='" + TextBox1.Text + "'";
        myCommand = new OdbcCommand(sql1, con);  //将SQL语句装入缓冲区
        myCommand.ExecuteNonQuery(); //在录入，修改，删除时用
        Response.Write("<script language=javascript> alert('修改成功');</script> ");
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

    protected void Button4_Click(object sender, EventArgs e)
    {
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string sql = " select * from passenger where ";
        if (TextBox1.Text != "")
            sql = sql + " pno='" + TextBox1.Text + "' and  ";
        if (TextBox2.Text != "")
            sql = sql + " pmm='" + TextBox2.Text + "' and  ";
        if (TextBox3.Text != "")
            sql = sql + " pname='" + TextBox3.Text + "' and  ";
        if (RadioButton1.Checked == true)
            sql = sql + " psex='" + "男" + "' and  ";
        if (RadioButton2.Checked == true)
            sql = sql + " psex='" + "女" + "' and  ";
        if (TextBox5.Text != "")
            sql = sql + "pid='" + TextBox5.Text + "' and ";
        if (TextBox6.Text != "")
            sql = sql + "pphone='" + TextBox6.Text + "' and ";
        sql = sql + " '1'='1' ";  //查询关口语句
        //Response.Write(sql);
        OdbcCommand myCommand = new OdbcCommand(sql, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {
            SqlDataSource1.SelectCommand = sql;//刷新GRIDVIEW
            GridView1.DataBind();
        }
        else
        {
            Response.Write("<script language=javascript> alert('查无此人');</script> ");
            return;
        }
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Response.Write("<script language=javascript> alert('乘客编号，不得为空');</script> ");
            return;
        }
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string s = "select * from passenger where pno='" + TextBox1.Text + "'";
        OdbcCommand myCommand = new OdbcCommand(s, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {
            
        }
        else
        {
            Response.Write("<script language=javascript> alert('查无此人');</script> ");
            return;
        }
        string sql = " delete from passenger where pno='" + TextBox1.Text + "'";
        myCommand = new OdbcCommand(sql, con);
        myCommand.ExecuteNonQuery();
        Response.Write("<script language=javascript> alert('删除成功');</script> ");
        GridView1.DataBind();
    }
}