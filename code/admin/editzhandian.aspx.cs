using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;

public partial class code_admin_editzhandian : System.Web.UI.Page
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
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，站点编号不得为空'); </script>");
            return;
        }
        if (TextBox2.Text == "")
        {
            Response.Write("<script language=javascript> alert('对不起，站点名称不得为空'); </script>");
            return;
        }
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();

        string sql = "select * from  pos where zno='" + TextBox1.Text + "'";
        OdbcCommand myCommand = new OdbcCommand(sql, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {

        }
        else
        {
            Response.Write("<script language=javascript> alert('对不起，该站点编号不存在'); </script>");
            return;
        }

        string sql1 = " update pos set zname='" + TextBox2.Text + "'";
        sql1 = sql1 + " where zno='" + TextBox1.Text + "'";
        myCommand = new OdbcCommand(sql1, con);  //将SQL语句装入缓冲区
        myCommand.ExecuteNonQuery(); //在录入，修改，删除时用
        Response.Write("<script language=javascript> alert('修改成功');</script> ");
        GridView1.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string sql = " select * from pos where ";
        if (TextBox1.Text != "")
            sql = sql + " zno='" + TextBox1.Text + "' and  ";
        if (TextBox2.Text != "")
            sql = sql + " zname='" + TextBox2.Text + "' and  ";
        sql = sql + " '1'='1' ";  //查询关口语句
        OdbcCommand myCommand = new OdbcCommand(sql, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {
            SqlDataSource1.SelectCommand = sql;//刷新GRIDVIEW
            GridView1.DataBind();
        }
        else
        {
            Response.Write("<script language=javascript> alert('查无此站');</script> ");
            return;
        }
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Response.Write("<script language=javascript> alert('站点编号，不得为空');</script> ");
            return;
        }
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string s = "select * from pos where zno='" + TextBox1.Text + "'";
        OdbcCommand myCommand = new OdbcCommand(s, con);  //将SQL语句装入缓冲区
        OdbcDataReader sdr = myCommand.ExecuteReader();   //执行SQL查询
        if (sdr.Read())
        {

        }
        else
        {
            Response.Write("<script language=javascript> alert('查无此站');</script> ");
            return;
        }
        string sql = " delete from pos where zno='" + TextBox1.Text + "'";
        myCommand = new OdbcCommand(sql, con);
        myCommand.ExecuteNonQuery();
        Response.Write("<script language=javascript> alert('删除成功');</script> ");
        GridView1.DataBind();
    }
}