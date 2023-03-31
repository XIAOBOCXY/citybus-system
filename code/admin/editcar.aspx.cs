using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;

public partial class code_admin_editcar : System.Web.UI.Page
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
        TextBox1.Text= GridView1.Rows[rowSelected].Cells[0].Text;
        TextBox2.Text= GridView1.Rows[rowSelected].Cells[1].Text;
        DropDownList1.SelectedValue = GridView1.Rows[rowSelected].Cells[2].Text;
        TextBox3.Text= GridView1.Rows[rowSelected].Cells[3].Text;
        TextBox4.Text= GridView1.Rows[rowSelected].Cells[4].Text;
        DropDownList2.SelectedValue = GridView1.Rows[rowSelected].Cells[5].Text;
        DropDownList3.SelectedValue = GridView1.Rows[rowSelected].Cells[6].Text;
        DropDownList4.SelectedValue = GridView1.Rows[rowSelected].Cells[7].Text;
        DropDownList5.SelectedValue = GridView1.Rows[rowSelected].Cells[8].Text;
        DropDownList6.SelectedValue = GridView1.Rows[rowSelected].Cells[9].Text;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，车辆编号不得为空'); </script>");
            return;
        }
        if (TextBox2.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，车票价格不得为空'); </script>");
            return;
        }
        if (TextBox3.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，车辆首发时间不得为空'); </script>");
            return;
        }
        if (TextBox4.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，车辆末班时间不得为空'); </script>");
            return;
        }
        if (TextBox1.Text.Length > 3)
        {
            Response.Write("<script language=javascript> alert('对不起，车辆编号位数不能大于3位'); </script>");
            return;
        }
        int i;
        for (i = 0; i < TextBox2.Text.Length; i++)
        {
            if (string.Compare(TextBox2.Text.Substring(i, 1), "0") == -1 || string.Compare(TextBox2.Text.Substring(i, 1), "9") == 1)
            {
                Response.Write("<script language=javascript> alert('车票价格请输入数字');</script> ");
                return;
            }
        }
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string sql = "select * from  car where cno='" + TextBox1.Text + "'";
        OdbcCommand myCommand = new OdbcCommand(sql, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {

        }
        else
        {
            Response.Write("<script language=javascript> alert('对不起，该车辆编号不存在'); </script>");
            return;
        }
        string sql1 = " update car set cprice='" + TextBox2.Text + "' ,yno='" + DropDownList1.SelectedValue + "' ,";
        sql1 = sql1 + " cstime='" + TextBox3.Text + "' ,cftime='" + TextBox4.Text + "' ,cpos1='" + DropDownList2.SelectedValue + "',";
        sql1 = sql1 + "cpos2='" + DropDownList3.SelectedValue + "',cpos3='" + DropDownList4.SelectedValue + "',cpos4='" + DropDownList5.SelectedValue + "',cpos5='" + DropDownList6.SelectedValue + "'";
        sql1 = sql1 + " where cno='" + TextBox1.Text + "'";
        myCommand = new OdbcCommand(sql1, con);  //将SQL语句装入缓冲区
        myCommand.ExecuteNonQuery(); //在录入，修改，删除时用
        Response.Write("<script language=javascript> alert('修改成功');</script> ");
        GridView1.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        DropDownList1.SelectedIndex = 0;
        TextBox3.Text = "";
        TextBox4.Text = "";
        DropDownList2.SelectedIndex = 0;
        DropDownList3.SelectedIndex = 0;
        DropDownList4.SelectedIndex = 0;
        DropDownList5.SelectedIndex = 0;
        CheckBox1.Checked = false;
        CheckBox2.Checked = false;
        CheckBox3.Checked = false;
        CheckBox4.Checked = false;
        CheckBox5.Checked = false;
        CheckBox6.Checked = false;
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string sql = " select * from car where ";
        if (TextBox1.Text != "")
            sql = sql + " cno='" + TextBox1.Text + "' and  ";
        if (TextBox2.Text != "")
            sql = sql + " cprice='" + TextBox2.Text + "' and  ";
        if (CheckBox1.Checked==true)
            sql = sql + " yno='" + DropDownList1.Text + "' and  ";
        if (TextBox3.Text != "")
            sql = sql + " cstime='" + TextBox3.Text + "' and  ";
        if (TextBox4.Text != "")
            sql = sql + " cftime='" + TextBox4.Text + "' and  ";
        if (CheckBox2.Checked== true)
            sql = sql + "cpos1='" + DropDownList2.Text + "' and ";
        if (CheckBox3.Checked == true)
            sql = sql + "cpos2='" + DropDownList3.Text + "' and ";
        if (CheckBox4.Checked == true)
            sql = sql + "cpos3='" + DropDownList4.Text + "' and ";
        if (CheckBox5.Checked == true)
            sql = sql + "cpos4='" + DropDownList5.Text + "' and ";
        if (CheckBox6.Checked == true)
            sql = sql + "cpos5='" + DropDownList6.Text + "' and ";
        sql = sql + " '1'='1' ";  //查询关口语句
        //Response.Write(sql);
        OdbcCommand myCommand = new OdbcCommand(sql, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {
            SqlDataSource2.SelectCommand = sql;//刷新GRIDVIEW
            GridView1.DataBind();
        }
        else
        {
            Response.Write("<script language=javascript> alert('没有找到符合条件的车辆');</script> ");
            return;
        }
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Response.Write("<script language=javascript> alert('车辆编号，不得为空');</script> ");
            return;
        }
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string s = "select * from car where cno='" + TextBox1.Text + "'";
        OdbcCommand myCommand = new OdbcCommand(s, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {

        }
        else
        {
            Response.Write("<script language=javascript> alert('车辆编号不存在');</script> ");
            return;
        }
        string sql = " delete from car where cno='" + TextBox1.Text + "'";
        myCommand = new OdbcCommand(sql, con);
        myCommand.ExecuteNonQuery();
        Response.Write("<script language=javascript> alert('删除成功');</script> ");
        GridView1.DataBind();
    }
}