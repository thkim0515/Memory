using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //관리자계정 구분
        if (Session["Super"] != null)
        {
            if (Session["Super"].ToString() == "관리자") // Super값이 '관리자'라면 ( 관리자 계정이라면, ) 회원관리 버튼을 추가
            {
                Btn_Admin.Visible = true;
                testlabel.Text = "관리자로 로그인";
            }
            else// 관리자 계정이 아니라면 마이페이지 이동버튼 추가
            {
                Btn_Mypage.Visible = true;
                testlabel.Text = "일반계정으로 로그인";
            }
        }
        //세션값의 존재여부에 따른 로그인 버튼관리
        if (Session["Nickname"] != null) // 세션이 존재한다면 . 
        {
            Nickname.Style.Add("display", "block");       // 닉네임 라벨 보이기
            Btn_Logout.Style.Add("display", "block");     // 로그아웃 버튼 보이기
            Login_ID.Style.Add("display", "none");        // ID 텍스트박스 숨기기
            Login_PWD.Style.Add("display", "none");       // PW 텍스트박스 숨기기
            infoLink.Style.Add("display", "none");        // 회원가입,아이디,패스워드 Division 숨기기
            Btn_Log.Style.Add("display", "none");         // 로그인 버튼 숨기기
            Nickname.Text = Session["Nickname"].ToString() + "님 반갑습니다."; // 세션 ( 닉네임 ) + 문자열 출력
        }
        else if (Session["Nickname"] == null)
        { // 세션이 존재하지 않는다면 .
            Nickname.Style.Add("display", "none");        // 닉네임 숨기기;
            Btn_Mypage.Style.Add("display", "none");      // 마이페이지 버튼 숨기기;
            Btn_Admin.Style.Add("display", "none");       // 회원관리 버튼 숨기기;
            Btn_Logout.Style.Add("display", "none");      // 로그아웃 버튼 숨기기
        }
    }
    protected void Btn_Click(object sender, EventArgs e)
    {
        Response.Redirect("Main.aspx");                  // 메인페이지 이동
    }

    protected void Login_button(object sender, EventArgs e)
    {
        if (LoginInfo(Login_ID.Text, Login_PWD.Text))     // 아이디, 패스워드 텍스트박스의 문자열이 데이터베이스와 일치하면,
        {
            SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=2020Project; Integrated Security=False;uid=kim; pwd=qwer1234");

            // userinfo 테이블로부터 아이디, 이메일, 닉네임 ,관리자계정 여부 데이터를 가져옴
            string sql2 = "Select id,email,nickname,super From userinfo Where id=@id";
            SqlCommand cmd2 = new SqlCommand(sql2, con);
            cmd2.Parameters.AddWithValue("@id", Login_ID.Text);

            con.Open();
            SqlDataReader rd = cmd2.ExecuteReader();

            while (rd.Read())
            {
                getemail.Value = String.Format("{0}", rd["email"]);   // 게시글 작성시 표시할 이메일 세션값
                getnick.Value = String.Format("{0}", rd["nickname"]); // 로그인후 로그인창에 표시할 닉네임값
                getsuper.Value = String.Format("{0}", rd["super"]);   // 관리자 계정 구분용
            }
            rd.Close();
            con.Close();

            //  ======================== 로그인시 버튼 컨트룰 & 세션 관리 ====================================
            Session["Nickname"] = getnick.Value; // 게시글 작성, 메인페이지 로그인박스내에 표기할 닉네임 세션값
            Session["email"] = getemail.Value;   // 게시글 작성시 표시할 이메일 세션값
            Session["Super"] = getsuper.Value;   // 관리자 계정 구분용 세션값  /* Int32.Parse(getsuper.Value);*/ 

/*  테스트  */// testlabel.Text = Session["Super"].ToString(); // 관리자 계정 구분 TEST용 라벨
            
            if (Session["Nickname"].ToString() != null) // 세션값이 존재한다면 . 
            {
                Nickname.Style.Add("display", "block");       // 닉네임 라벨 보이기
                Btn_Logout.Style.Add("display", "block");     // 로그아웃 버튼 보이기
                Login_ID.Style.Add("display", "none");        // ID 텍스트박스 숨기기
                Login_PWD.Style.Add("display", "none");       // PW 텍스트박스 숨기기
                infoLink.Style.Add("display", "none");        // 회원가입,아이디,패스워드 Division 숨기기
                Btn_Log.Style.Add("display", "none");         // 로그인 버튼 숨기기
                Nickname.Text = Session["Nickname"].ToString() + "님 반갑습니다."; // 세션 ( 닉네임 ) + 문자열 출력
                //Server.Transfer("sell.aspx");
            }
            else
            { // 세션값이 존재하지 않는다면 .
                //  -------------  //
            }
            Server.Transfer("Main.aspx"); // 메인페이지 세션 저장 + 리로드
        }
        else
        {   // 아이디 패스워드 하나라도 일치하지 않을경우, 일치하지않음을 경고하고 재 로그인 시킴
            Response.Write("<script type='text/javascript'>alert('가입된계정이 아니거나, 아이디 또는 패스워드가 일치하지않습니다.'); </script>");
        }
    }

    // 로그인시도를 할 경우 데이터베이스 내에 ID와 PWD일치 여부를 판별하여 count 수를 증가한다. 
    bool LoginInfo(string userID, string password)
    {
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=2020Project; Integrated Security=False;uid=kim; pwd=qwer1234");

        string sql = "select count(id) from userinfo where id = @ID and password = @Password";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@ID", userID);
        cmd.Parameters.AddWithValue("@Password", password);

        // 텍스트 박스 내 아이디와 패스워드가 일치할 경우, count수 증가 
        con.Open();
        int count = (int)cmd.ExecuteScalar();
        con.Close();

        //1개 이상의 count값 리턴
        return count > 0;
    }
    // 로그아웃 버튼 클릭 구문
    protected void Btn_Logout_Click(object sender, EventArgs e) // 로그아웃 버튼 클릭시
    {
        Response.Write("<script type='text/javascript'>alert('로그아웃 되었습니다.'); </script>");
        //Session.Remove("Nickname"); // 세션제거
        Session.Clear();
        // 로그인시 나오는 라벨 버튼 숨김
        Nickname.Style.Add("display", "none");    // 닉네임 라벨 숨기기
        Btn_Mypage.Style.Add("display", "none");  // 마이페이지 버튼 숨기기
        Btn_Admin.Style.Add("display", "none");   // 회원관리 버튼 숨기기
        Btn_Logout.Style.Add("display", "none");  // 로그아웃 버튼 숨기기
        // 로그인시 요구하는 텍스트박스, 링크, 버튼 보이기
        Login_ID.Style.Add("display", "block");   // 아이디 텍스트 박스 보이기
        Login_PWD.Style.Add("display", "block");  // 패스워드 텍스트 박스 보이기
        infoLink.Style.Add("display", "block");   // 하이퍼링크 보이기
        Btn_Log.Style.Add("display", "block");    // 회원가입,아이디,패스워드 Division 보이기
        Response.Redirect("Main.aspx");           // 메인페이지 리로드
    }

    protected void Btn_Admin_Click(object sender, EventArgs e) // 회원관리 버튼 클릭시
    {
        ContentPlaceHolder MainContent = FindControl("MainContent") as ContentPlaceHolder;
        Server.Transfer("useradmin.aspx");
    }

/*  테스트 */protected void testBTN(object sender, EventArgs e)
             {
                   Server.Transfer("sell.aspx");
             }

    protected void Search_Click(object sender, EventArgs e) // 검색기능
    {
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=2020Project; Integrated Security=False;uid=kim; pwd=qwer1234");

        string sql = "select * from sellpost where title = @title";
        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("@title", SearchBox.Text);

        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();

        while (rd.Read())
        {
            testTitle.Text = String.Format("{0}, {1}, {2}, {3},{4}<br/>",
                rd["title"], rd["writedate"], rd["Name"], rd["readcount"], rd["num"]);
        }
        rd.Close();
        con.Close();
    }
}

// 관리자계정 구분하는 구문

//Session["Super"] = getsuper.Value; /* Int32.Parse(getsuper.Value);*/
//Session["Super"] = getsuper.Value;


//if (Session["Super"].ToString() == "1") // Super값이 1이라면 ( 관리자 계정이라면, ) 회원관리 버튼을 추가
//{
//    Btn_Admin.Style.Add("display", "block");
//    tester.Text = "admin";
//}
//else // 관리자 계정이 아니라면 마이페이지 이동버튼 추가
//{
//    tester.Text = "mypage";
//    Btn_Mypage.Style.Add("display", "block");
//}