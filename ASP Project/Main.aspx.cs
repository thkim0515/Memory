using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using ASP;

public partial class Main : System.Web.UI.Page
{
    string strSql = "SELECT TOP (4) [num], [name], [title], [writedate], [readcount], [image] ,[price] FROM [sellpost] ORDER BY [num] DESC";
    protected void Page_Load(object sender, EventArgs e)
    {
        ListDisplay();
        //팝업창 구문 - asp_project2_popup_aspx 호출
        //Response.Write("<script language=javascript>window.open('popup.aspx', '작업진행도', 'width =400, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes');</script>");

        //상위데이터 뽑아오는 구문
        // 데이터베이스 내에서 상단 원하는 값 출력하는 구문 MSSQL
        //SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=2020Project; Integrated Security=False;uid=kim; pwd=qwer1234");

        //string sql1 = "select readcount,title from (select row_number() over (order by readcount desc) as rownum, * from sellpost) sellpost where sellpost.rownum between 1 and 1;";
        //SqlCommand Cmd1 = new SqlCommand(sql1, con);
    }
    private void ListDisplay()
    {
        SqlDataSource1.SelectCommand = strSql;
    }

}