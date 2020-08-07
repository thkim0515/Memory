using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class signup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Checkbox1_Check(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            CheckBox2.Checked = true;
            CheckBox3.Checked = true;
        }

        if (CheckBox1.Checked == false)
        {
            CheckBox2.Checked = false;
            CheckBox3.Checked = false;
        }
    }

    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("main.aspx"));
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if(CheckBox2.Checked == true && CheckBox3.Checked == true)
        {
            Response.Redirect(string.Format("signup2.aspx"));
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('약관에 동의해 주세요.');</script>");
        }
        
    }


}