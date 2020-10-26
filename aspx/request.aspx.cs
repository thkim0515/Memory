using System;
using System.Collections.Generic;
using System.Data.SqlClient;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class request : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        nickname.Text = Session["Nickname"].ToString();
        email.Text = Session["email"].ToString();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (gopub_none.Checked)
        {
            gopub.Value = "비공개";
        }
        else if (gopub_all.Checked)
        {
            gopub.Value = "전체공개";
        }
        else if (gopub_mem.Checked)
        {
            gopub.Value = "회원공개";
        }

        String savePath = @"C:\inetpub\wwwroot\ASP_Project2\request_img\";

        if (ImageUpload.HasFile)
        {
            string fileName = ImageUpload.FileName;  // imgUp 에있는 파일평 따오기
            savePath = savePath + fileName;          // 지역변수 설정
            ImageUpload.SaveAs(savePath);            // 설정한 지역변수값 등록
        }
        //파일 업로드 구문 끝

        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=2020Project; Integrated Security=False;uid=kim; pwd=qwer1234");
        con.Open();

        string sql = "Insert Into requestpost (name,email,title,contents,writedate,readcount,image,gopublic) Values (@name,@email,@title,@contents,@writedate,0,@image,@gopublic)";
   
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@name", nickname.Text);
        cmd.Parameters.AddWithValue("@email", email.Text);
        cmd.Parameters.AddWithValue("@title", title.Text);
        cmd.Parameters.AddWithValue("@contents", content.Text);
        cmd.Parameters.AddWithValue("@writedate", DateTime.Now.ToShortDateString());
        cmd.Parameters.AddWithValue("@image", ImageUpload.FileName);
        cmd.Parameters.AddWithValue("@gopublic", gopub.Value);

        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("~/ASP_Project2/request_Board.aspx");
    }
}