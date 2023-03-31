using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;        //ODBC命名空间
using System.Data;

public partial class code_admin_count : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        Label2.Text = "";
        CheckBox1.Checked = false;
        CheckBox2.Checked = false;
        CheckBox3.Checked = false;
        CheckBox4.Checked = false;
        CheckBox5.Checked = false;
        DropDownList1.SelectedIndex = 0;
        DropDownList2.SelectedIndex = 0;
        DropDownList3.SelectedIndex = 0;
        DropDownList4.SelectedIndex = 0;
        DropDownList5.SelectedIndex = 0;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string sql2, sql3;
        sql3 = "";
        if (CheckBox1.Checked == true)
        {
            sql3 += " sell.cno='" + DropDownList1.Text + "' and ";
        }
        if (CheckBox2.Checked == true)
        {
            sql3 += " pno='" + DropDownList2.Text + "' and ";
        }
        if (CheckBox3.Checked == true)
        {
            if (DropDownList3.Text != "--请选择--")
            {
                sql3 += " year(ride)=" + DropDownList3.Text + " and ";
            }
        }
        if (CheckBox4.Checked == true)
        {
            if (DropDownList4.Text != "--请选择--")
            {
                sql3 += " month(ride)=" + DropDownList4.Text + " and ";
            }
        }
        if (CheckBox5.Checked == true)
        {
            if (DropDownList5.Text != "--请选择--")
            {
                sql3 += " day(ride)=" + DropDownList5.Text + " and ";
            }
        }

        sql3 += " '1'='1'";


        string sql;
        sql = "select sno,pno,cno,ride from sell ";
        sql = sql + "where" + sql3;

        OdbcCommand mycommand = new OdbcCommand(sql, con);
        OdbcDataReader sdr = mycommand.ExecuteReader();
        if (sdr.Read())
        {
            SqlDataSource1.SelectCommand = sql;
            GridView1.DataBind();
        }
        else
        {
            Response.Write("<script language=javascript> alert('没有查到数据');</script>");
            Label1.Text = "0";
            Label2.Text = "0";
            return;
        }

        int zrs = 0, zje = 0;
        sql2 = "select count(*) as rs  from sell ";
        sql2 = sql2 + "where" + sql3;
        mycommand = new OdbcCommand(sql2, con);
        sdr = mycommand.ExecuteReader();
        if (sdr.Read())
        {
            zrs = Convert.ToInt32(sdr["rs"].ToString());
        }
        sql2 = "";
        sql2 = "select sum(cprice) as je from car, sell  where car.cno = sell.cno and ";
        sql2 = sql2 + sql3;

        mycommand = new OdbcCommand(sql2, con);
        sdr = mycommand.ExecuteReader();
        if (sdr.Read())
        {
            zje = Convert.ToInt32(sdr["je"].ToString());
        }

        Label1.Text = zrs.ToString();
        Label2.Text = zje.ToString();

    }


    protected void CheckBox4_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox3.Checked == false)
        {

            Response.Write("<script language=javascript> alert('请先选择要查询的年');</script>");
            CheckBox4.Checked = false;
            return;
        }
    }

    protected void CheckBox5_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox4.Checked == false)
        {

            Response.Write("<script language=javascript> alert('请先选择要查询的月');</script>");
            CheckBox5.Checked = false;
            return;
        }
    }

    protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox4.Checked == true)
            CheckBox4.Checked = false;
        if (CheckBox5.Checked == true)
            CheckBox5.Checked = false;
    }
}