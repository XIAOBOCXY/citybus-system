using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;


public partial class code_passenger_buy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string user = Session["currentuser"].ToString();
        Label1.Text = user;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text == "")
        {
            Response.Write("<script language=javascript> alert('乘车日期不得为空');</script>");
            return;
        }
        string user = Session["currentuser"].ToString();
        string zfdh = "";
        string c = DropDownList3.SelectedValue;
        string date= String.Format("{0:yyyyMMdd}", Convert.ToDateTime(TextBox2.Text.ToString()));
        zfdh = date + user + c;
        TextBox1.Text = zfdh;
        OdbcConnection con = DB.lianjie();
        con.Open();
        string sql;
        sql = " select cprice from car where  ";
        sql += " cno='" + c + "'";
        sql += " and '1'='1' ";
        OdbcCommand mycommand = new OdbcCommand(sql, con);
        OdbcDataReader sdr = mycommand.ExecuteReader();
        int piaojia = 0;
        if (sdr.Read())
            piaojia = Convert.ToInt32(sdr["cprice"].ToString());
        Label2.Text = piaojia.ToString();//票价

        string sql1;
        sql1 = " select sno from sell where  ";
        sql1 += " sno='" + zfdh + "'";
        sql1 += " and '1'='1' ";
        mycommand = new OdbcCommand(sql1, con);
        sdr = mycommand.ExecuteReader();
        if (sdr.Read())
        {
            Response.Write("<script language=javascript> alert( '你已经购买车票');</script>");
            return;
        }

        string chup = "insert into sell values ('" + zfdh + "','" + user + "','" + c + "',";
        chup += " '" + date + "')" ;
        mycommand = new OdbcCommand(chup, con);
        mycommand.ExecuteNonQuery();
        Response.Write("<script language=javascript> alert( '出票成功');</script>");
        GridView1.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string p1 = DropDownList1.SelectedValue;
        string p2 = DropDownList2.SelectedValue;
        if (p1 == p2)
        {
            Response.Write("<script language=javascript> alert('出发地和目的地不能相同');</script>");
        }
        string sql = "SELECT cno, cprice, yno, cstime, cftime, cpos1, cpos2, cpos3, cpos4, cpos5 FROM citybus.car";
        sql += " where (cpos1='" +p1+"' or cpos2='"+p1 +"' or cpos3='" + p1 +"' or cpos4='"+p1 +"' or cpos5='" +p1 +"') ";
        sql+= "and (cpos1='" + p2 + "' or cpos2='" + p2 + "' or cpos3='" + p2 + "' or cpos4='" + p2 + "' or cpos5='" + p2 + "');";

        //Response.Write(sql);
        OdbcCommand mycommand = new OdbcCommand(sql, con);
        OdbcDataReader sdr = mycommand.ExecuteReader();
        if (sdr.Read())
        {
            SqlDataSource1.SelectCommand = sql;
            GridView1.DataBind();
        }
        else
        {
            Response.Write("<script language=javascript> alert('没有查到符合条件的车辆');</script>");
            return;
        }
    }
}