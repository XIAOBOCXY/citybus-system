using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;

public partial class code_admin_addcar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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
        if (TextBox1.Text.Length >3 )
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
        string sql1 = "select * from  car where cno='" + TextBox1.Text + "' ";
        OdbcCommand myCommand = new OdbcCommand(sql1, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {
            Response.Write("<script language=javascript> alert('查询到车辆编号有重复');</script> ");
            return;
        }
        string sql = "select * from  car where yno='" + DropDownList1.SelectedValue + "' ";
        myCommand = new OdbcCommand(sql,con);  //将SQL语句装入缓冲区
        sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {
            Response.Write("<script language=javascript> alert('该员工已有驾驶的车辆');</script> ");
            return;
        }
        string sql2 = " insert into car values ( '" + TextBox1.Text + "' ,'" + TextBox2.Text + "' ,'" +DropDownList1.SelectedValue+"'," ;
        sql2 = sql2 + " '" + TextBox3.Text + "' ,'" + TextBox4.Text + "', '" + DropDownList2.SelectedValue + "', '" + DropDownList3.SelectedValue + "', '" + DropDownList4.SelectedValue + "', '" + DropDownList5.SelectedValue + "', '" + DropDownList6.SelectedValue + "') ";
        myCommand = new OdbcCommand(sql2, con);
        Response.Write(sql2);
        myCommand.ExecuteNonQuery(); //在录入，修改，删除时用
        Response.Write("<script language=javascript> alert('录入成功');</script> ");
        GridView1.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        DropDownList1.SelectedIndex = 0;
        TextBox3.Text = "";
        TextBox4.Text = "";
        DropDownList1.SelectedIndex = 0;
        DropDownList2.SelectedIndex = 0;
        DropDownList3.SelectedIndex = 0;
        DropDownList4.SelectedIndex = 0;
        DropDownList5.SelectedIndex = 0;
    }
}