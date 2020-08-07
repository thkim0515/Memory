using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class sell : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        name.Text = Session["Nickname"].ToString();
        email.Text = Session["email"].ToString();
    }
    protected void btnWrite_Click(object sender, EventArgs e)
    {
        //파일 업로드 구문 시작
        String savePath = @"C:\inetpub\wwwroot\ASP_Project2\Images\";

        if (ImageUpload.HasFile)
        {
            string fileName = ImageUpload.FileName;
            savePath = savePath + fileName;
            ImageUpload.SaveAs(savePath);
        }
        //파일 업로드 구문 끝

        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=2020Project; Integrated Security=False;uid=kim; pwd=qwer1234");
        con.Open();


        string sql = "Insert Into sellpost (name,email,title,contents,writedate,readcount,image,price) Values (@name,@email,@title,@contents,@writedate,0,@image,@price)";
        // NULL EXCEPTION 방지 _ 임시방편 - 포스트 넘버 체크
        string sql2 = "Insert Into reply (postnumber) Values (0)";

        SqlCommand cmd = new SqlCommand(sql, con);
        SqlCommand cmd2 = new SqlCommand(sql2, con);
        cmd.Parameters.AddWithValue("@name", name.Text);
        cmd.Parameters.AddWithValue("@email", email.Text);
        cmd.Parameters.AddWithValue("@title", title.Text);
        cmd.Parameters.AddWithValue("@contents", contents.Text);
        cmd.Parameters.AddWithValue("@price", price.Text);
        cmd.Parameters.AddWithValue("@writedate", DateTime.Now.ToShortDateString());
        cmd.Parameters.AddWithValue("@image", ImageUpload.FileName);

        cmd.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();

        con.Close();

        Response.Redirect("~/ASP_Project2/Main.aspx");

    }
}