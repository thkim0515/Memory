<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signup2.aspx.cs" Inherits="signup2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <%--가운데 정렬--%>
            <div id="signupalgincenter">

                <section class="signup-top">
                    <asp:ImageButton ID="ImageButton1" ImageUrl="Images/logo5.png" OnClick="ImageButton1_Click" Width="300px" runat="server" />
                </section>
            </div>

            <section class="signup-mid">
                <h3 class="signup-mid-top">기본 정보 입력</h3>
                <hr />
                <br />

                <fieldset class="py-4">
                    <asp:Label runat="server" Text="아이디" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="id" runat="server" CssClass="form_right" Width="300px" Placeholder="ID는 15자이내" MaxLength="15"></asp:TextBox>
                    <asp:Button runat="server" ID="IDCheck" Text="중복체크" onClick="IDCheck_Click"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="ID" ErrorMessage="아이디를 입력하세요." ControlToValidate="id" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>

                    <p></p>

                    <asp:Label runat="server" Text="비밀번호" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="pwd" runat="server" CssClass="form_right" TextMode="Password" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="other" ErrorMessage="패스워드를 입력하세요." ControlToValidate="pwd" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>

                    <p></p>

                    <asp:Label runat="server" Text="비밀번호 확인" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="pwdcheck" runat="server" CssClass="form_right" TextMode="Password" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="other" ErrorMessage="패스워드확인을 입력하세요." ControlToValidate="pwdcheck" CssClass="required" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="other" ErrorMessage="비밀번호가 일치하지 않습니다." ControlToValidate="pwdcheck" ControlToCompare="pwd" Display="Dynamic" CssClass="required"></asp:CompareValidator>

                    <p></p>

                    <asp:Label runat="server" Text="닉네임" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="nickname" runat="server" CssClass="form_right" Width="300px"></asp:TextBox>
                    <asp:Button runat="server" ID="NickCheck" Text="중복체크" onClick="NickCheck_Click"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="nickname" ErrorMessage="닉네임을 입력하세요." ControlToValidate="nickname" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>

                    <p></p>

                    <asp:Label runat="server" Text="이름" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="name" runat="server" CssClass="form_right" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="other" ErrorMessage="이름을 입력하세요." ControlToValidate="name" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>

                    <p></p>

                    <asp:Label runat="server" Text="생년월일" CssClass="form_left"></asp:Label>
                    <%--생년월일 히든필드--%>
                    <asp:HiddenField runat="server" ID="birth" /><asp:HiddenField runat="server" ID="birthyear" /><asp:HiddenField runat="server" ID="birthmonth" /><asp:HiddenField runat="server" ID="birthday" />
                    <%--생년월일 DropDownList--%>
                    <asp:DropDownList ID="lstYear" runat="server" OnSelectedIndexChanged="lstYear_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>년
                    <asp:DropDownList ID="lstMonth" runat="server" OnSelectedIndexChanged="lstMonth_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>월
                    <asp:DropDownList ID="lstDay" runat="server"></asp:DropDownList>일

                    <p></p>

                    <asp:Label runat="server" Text="핸드폰 번호" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="phonesum" runat="server" Visible="false" AutoPostBack="True"></asp:TextBox>
                    <asp:TextBox ID="phone1" runat="server" CssClass="form_right" Width="60px" MaxLength="3"></asp:TextBox>
                    -
                     <asp:TextBox ID="phone2" runat="server" CssClass="form_right" Width="100px" MaxLength="4"></asp:TextBox>
                    -
                     <asp:TextBox ID="phone3" runat="server" CssClass="form_right" Width="100px" MaxLength="4"></asp:TextBox>
                    <%--전화번호 DropDownList--%>
                    <asp:DropDownList runat="server" ID="phone" OnSelectedIndexChanged="phoneList_OnSelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>SKT</asp:ListItem>
                        <asp:ListItem>KT</asp:ListItem>
                        <asp:ListItem>LG U+</asp:ListItem>
                    </asp:DropDownList>

                    <p></p>

                    <asp:Label runat="server" Text="주소" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="address" runat="server" CssClass="form_right" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="other" ErrorMessage="주소를 입력하세요." ControlToValidate="address" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>

                    <br />
                    <p></p>

                    <asp:Label runat="server" Text="이메일" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="email" runat="server" CssClass="form_right" Width="130px"></asp:TextBox>
                    @
                    <asp:TextBox ID="domainText" runat="server" CssClass="form_right" Width="170px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="other" ErrorMessage="이메일을 입력하세요." ControlToValidate="email" Display="dynamic" EnableClientScript="True" CssClass="required"></asp:RequiredFieldValidator>
                    <%--이메일 DropDownList--%>
                    <asp:DropDownList runat="server" ID="EmailList" OnSelectedIndexChanged="EmailList_OnSelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>- 직접입력 -</asp:ListItem>
                        <asp:ListItem>naver.com</asp:ListItem>
                        <asp:ListItem>daum.net</asp:ListItem>
                        <asp:ListItem>google.co.kr</asp:ListItem>
                    </asp:DropDownList>

                    <p></p>

                    <asp:Label runat="server" Text="학교" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="school" runat="server" CssClass="form_right" Width="130px" ReadOnly="true"></asp:TextBox>
                    <asp:DropDownList runat="server">
                        <asp:ListItem>
                        </asp:ListItem>
                    </asp:DropDownList>

                    <p></p>

                    <asp:Label runat="server" Text="학과" CssClass="form_left"></asp:Label>
                    <asp:TextBox ID="major" runat="server" CssClass="form_right" Width="130px" ReadOnly="true"></asp:TextBox>
                    <asp:DropDownList runat="server">
                        <asp:ListItem>
                        </asp:ListItem>
                    </asp:DropDownList>

                    <p></p>
                    <br />
                    <br />
                    <asp:Button runat="server" ID="Signup_Btn" Text="가입하기" OnClick="Signup_Btn_click" CssClass="signup_data_btn" />
                </fieldset>
            </section>
        </div>
    </form>
</body>
</html>
