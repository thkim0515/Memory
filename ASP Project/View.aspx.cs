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
        ListDisplay();

        recommend_label.Text = Session["Nickname"].ToString();

        String savePath = @"images\";

        if (!IsPostBack)
        {
            SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=2020Project; Integrated Security=False;uid=kim; pwd=qwer1234");

            con.Open();

            string strSql = "Update sellpost SET readcount=readcount + 1 where num=" + Request["No"];
            SqlCommand cmd = new SqlCommand(strSql, con);
            cmd.ExecuteNonQuery();

            strSql = "Select * from sellpost where num = " + Request["No"];

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
    private void ListDisplay()
    {
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=2020Project; Integrated Security=False;uid=kim; pwd=qwer1234");

        con.Open();
        string strSql = "Select * from sellpost where num = " + Request["No"];
        SqlCommand cmd = new SqlCommand(strSql, con);
        cmd.ExecuteNonQuery();
        cmd = new SqlCommand(strSql, con);
        SqlDataReader rd = cmd.ExecuteReader();
        rd.Read();
        number_che.Value = rd["num"].ToString();
        rd.Close();

        string strSql2 = "Select * from reply where postnumber = " + Request["No"];
        SqlCommand cmd2 = new SqlCommand(strSql2, con);
        cmd2.ExecuteNonQuery();
        cmd2 = new SqlCommand(strSql2, con);
        SqlDataReader rd2 = cmd2.ExecuteReader();
        rd2.Read();
        string strSql3 = "SELECT [nickname], [comment], [writedate] FROM [reply] where postnumber = " + Request["No"];
        rd2.Close();

        relpy_comment.SelectCommand = strSql3;
        //int count = (int)cmd2.ExecuteScalar();

        //if (count > 0)
        //{
        //    SqlDataReader rd2 = cmd2.ExecuteReader();
        //    rd2.Read();
        //    if (rd2["postnumber"].ToString() != null)
        //    {
        //        postnum_che.Value = rd2["postnumber"].ToString();
        //    }
        //    rd2.Close();
        //}

        //if (number_che.Value == post_num.Value)
        //{
        //    string strSql3 = "SELECT [nickname], [comment], [writedate] FROM [reply] where postnumber = " + Request["No"];

        //    relpy_comment.SelectCommand = strSql3;
        //}
        //else
        //{

        //}

        con.Close();
    }

    protected void View_Recom_Btn(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=2020Project; Integrated Security=False;uid=kim; pwd=qwer1234");
        string strSql = Request["No"];
        post_num.Value = strSql;

        string sql = "Insert Into reply (nickname,comment,writedate,postnumber) Values ( @nickname, @comment,@writedate,@postnumber)";

        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@nickname", recommend_label.Text);
        cmd.Parameters.AddWithValue("@comment", reply.Text);
        cmd.Parameters.AddWithValue("@writedate", DateTime.Now.ToShortDateString());
        cmd.Parameters.AddWithValue("@postnumber", post_num.Value);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        Response.Write("<script type='text/javascript'>alert('댓글등록 성공'); </script>");
        Response.Redirect(Request.Url.PathAndQuery);
    }
    protected void back_board_Btn(object sender, EventArgs e)
    {
        Response.Redirect("sellpost.aspx");
    }
}