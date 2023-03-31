using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.Odbc;

public partial class code_passenger_discuss : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Response.Write("<script language=javascript> alert('请输入留言评论');</script>");
            return;
        }
        if (TextBox2.Text == "")
        {
            Response.Write("<script language=javascript> alert('请输入分数');</script>");
            return;
        }
        if (TextBox2.Text != "")
        {
            for (int i = 0; i < TextBox2.Text.Length; i++)
            {
                if (string.Compare(TextBox2.Text.Substring(i, 1), "0") == -1 || string.Compare(TextBox2.Text.Substring(i, 1), "9") == 1)
                {
                    Response.Write("<script language=javascript> alert('分数请输入数字');</script> ");
                    return;
                }
            }
        }
        string user = Session["currentuser"].ToString();
        OdbcConnection con = DB.lianjie(); //ODBC方式调用连接类
        con.Open();
        string yno = DropDownList1.SelectedValue.ToString();
        string pl = TextBox1.Text.ToString();
        int score = Convert.ToInt32(TextBox2.Text);
        string dno = "";
        string date= DateTime.Now.ToString("yyyyMMdd");
        dno +=date+user + yno;
        string sql = "insert into dis values ('" + dno + "','" + yno + "','" + pl + "',";
        sql += " '" + score + "','" + date + "','" + user + "')";
        OdbcCommand mycommand = new OdbcCommand(sql, con);
        OdbcDataReader sdr = mycommand.ExecuteReader();
        Response.Write("<script language=javascript> alert( '留言评论成功');</script>");
    }
}