<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup.aspx.cs" Inherits="signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <%--가운데 정렬--%>
            <div id="signupcenter">

            <section class="signup-top">            
                <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images/logo5.png" OnClick="ImageButton1_Click" Width="300px" runat="server" />
            </section>
            </div>

            <section class="signup-mid">
            <h3 class="signuptop">약관 동의</h3>
                <hr />  <br />
            
                 <%--<section class="signup-mid-mid">   내용물 가운데 정렬시도--%>
            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="Checkbox1_Check" />
            <asp:Label ID="Label1" runat="server" Text="가입약관, 개인정보약관에 모두 동의합니다." Font-Size="Large" Font-Bold="true"></asp:Label>

            <br /><br /><br />

            <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True"/>
            <asp:Label ID="Label2" runat="server" Text="가입약관 동의" Font-Size="Large" Font-Bold="true"></asp:Label><br />
            <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="200px" Width="500px"
                text="여러분을 환영합니다.

                      중헌책 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 중헌책 서비스의 이용과 관련하여 중헌책 서비스를 제공하는 중헌책 주식회사(이하 ‘중헌책’)와 이를 이용하는 중헌책 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 중헌책 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.

                      중헌책 서비스를 이용하시거나 중헌책 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다."></asp:TextBox>

            <br /><br /><br />

            <asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="True"/>
            <asp:Label ID="Label3" runat="server" Text="개인정보약관 동의" Font-Size="Large" Font-Bold="true"></asp:Label><br />
                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Height="200px" Width="500px"
               text="정보통신망법 규정에 따라 중헌책에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 중헌책 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 중헌책는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다."></asp:TextBox>

                <br /><br /><br /><br />
                <%--</section>--%>

                <asp:Button ID="Button1" runat="server" Text="취소" Height="80px" Width="227px" />
                <asp:Button ID="Button2" runat="server" Text="다음" Height="80px" Width="227px" OnClick="Button2_Click"/>
            </section>
            
            

        </div>
    </form>
</body>
</html>
