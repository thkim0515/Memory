using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ASP_Project2_Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        String savePath = @"request_img\";

        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=2020Project; Integrated Security=False;uid=kim; pwd=qwer1234");

            con.Open();

            string strSql = "Update requestpost SET readcount=readcount + 1 where num=" + Request["No"];
            SqlCommand cmd = new SqlCommand(strSql, con);
            cmd.ExecuteNonQuery();

            strSql = "Select * from requestpost where num = " + Request["No"];

            cmd = new SqlCommand(strSql, con);

            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                nickname.Text = rd["name"].ToString();
                writeday.Text = rd["writedate"].ToString();
                readcount.Text = rd["readcount"].ToString();
                title.Text = rd["title"].ToString();
                Contents.Text = rd["contents"].ToString();
                imageout.ImageUrl = savePath + rd["image"].ToString();
            }
            rd.Close();
            con.Close();
        }
    }

    
    protected void back_board_Btn(object sender, EventArgs e)
    {
        Response.Redirect("sellpost.aspx");                                                  // 목록버튼 클릭시
    }
}