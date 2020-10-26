using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ASP_Project2_Default : System.Web.UI.Page
{
    string strSql = "SELECT [num], [name], [title], [writedate], [readcount], [image] ,[price] FROM [sellpost] ORDER BY [num] DESC";

    protected void Page_Load(object sender, EventArgs e)
    {
        ListDisplay();
        search_object.BorderWidth = 0;
    }
    private void ListDisplay()
    {
        sellpostData.SelectCommand = strSql;

    }
    protected void Search_Click(object sender,EventArgs e)
    {
        strSql = "SELECT [num], [name], [title], [contents],[writedate], [readcount], [image] ,[price] FROM [sellpost] " +
            "where " + search_object.SelectedValue + " Like '%" + SearchBox.Text + "%' ORDER BY [num] desc";

        ListDisplay();
    }
}