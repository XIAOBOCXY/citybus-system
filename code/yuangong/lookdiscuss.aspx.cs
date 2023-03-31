using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;        //ODBC命名空间
using System.Data;

public partial class code_yuangong_lookdiscuss : System.Web.UI.Page
{
    string user;
    protected void Page_Load(object sender, EventArgs e)
    {
        user = Session["currentuser"].ToString();
        Label1.Text = user;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string sql="dis.yno='"+user+"' and ";
        if (CheckBox1.Checked == true)
        {
            sql += " dis.pno='" + DropDownList1.Text + "' and ";
        }
        else if(CheckBox2.Checked == true)
        {
            sql += " dis.ddate='" + TextBox1.Text + "' and ";
        }
        sql += " '1'='1';";
        //Response.Write(sql);
        string sql1;
        sql1 = "SELECT citybus.dis.dno, citybus.dis.yno, citybus.dis.discuss, citybus.dis.dscore,  citybus.dis.ddate ,  citybus.dis.pno FROM citybus.dis";
        sql1 += " where " + sql;
        //Response.Write(sql1);
        OdbcCommand mycommand = new OdbcCommand(sql1, con);
        OdbcDataReader sdr = mycommand.ExecuteReader();
        if (sdr.Read())
        {
            SqlDataSource2.SelectCommand = sql1;
            GridView1.DataBind();
        }
        else
        {
            Response.Write("<script language=javascript> alert('没有查到数据');</script>");
            CheckBox1.Checked = false;
            CheckBox2.Checked = false;
            DropDownList1.SelectedIndex = 0;
            TextBox1.Text = "";
            return;
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        CheckBox1.Checked = false;
        CheckBox2.Checked = false;
        DropDownList1.SelectedIndex = 0;
        TextBox1.Text = "";
    }
}