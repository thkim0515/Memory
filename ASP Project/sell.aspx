<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="sell.aspx.cs" Inherits="sell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container">
        <br />
        <br />
        <br />
        <div id="algincenter">

            <fieldset class="py-4">

                <asp:Label ID="Label5" runat="server" Text="작성자" CssClass="sell_left"></asp:Label>
                <asp:TextBox ID="name" runat="server" ReadOnly="True" Height="30px"></asp:TextBox>
                <p></p>
                <asp:Label ID="Label6" runat="server" Text="이메일" CssClass="sell_left"></asp:Label>
                <asp:TextBox ID="email" runat="server" ReadOnly="True" Height="30px"></asp:TextBox>
                <p></p>

                <asp:Label ID="Label1" runat="server" Text="제목" CssClass="sell_left"></asp:Label>
                <asp:TextBox ID="title" runat="server" Placeholder="게시글 제목을 입력하세요" CssClass="sell_right"></asp:TextBox>

                <p></p>

                <asp:Label ID="Label2" runat="server" Text="사진 첨부" CssClass="sell_left"></asp:Label>
                <asp:FileUpload ID="ImageUpload" runat="server" CssClass="sell_right" Height="60%" />

                <p></p>
                <br />
                <br />

                <asp:TextBox ID="contents" runat="server" TextMode="MultiLine" Height="500px" Width="90%" CssClass="sell_content_left"></asp:TextBox>

                <p></p>

                <asp:Label ID="Label7" runat="server" Text="판매가격" CssClass="sell_tag_left"></asp:Label>
                <asp:TextBox ID="price" runat="server" CssClass="sell_tag_right"></asp:TextBox>
                <p></p>

                <asp:Label ID="Label3" runat="server" Text="태그" CssClass="sell_tag_left"></asp:Label>
                <asp:TextBox ID="tag" runat="server" CssClass="sell_tag_right"></asp:TextBox>

                <p></p>

                <asp:Label ID="Label4" runat="server" Text="공개설정" CssClass="sell_left"></asp:Label>
                전체공개<asp:RadioButton runat="server" Text="전체공개" CssClass="sell_radio_right"></asp:RadioButton>
                회원공개<asp:RadioButton runat="server" Text="회원공개" CssClass="sell_radio_right"></asp:RadioButton>
                <p></p>
                <br />
            </fieldset>

            <asp:Button ID="Button1" runat="server" Text="취소" Height="60px" Width="130px" CssClass="sell_button_cancle" />
            <asp:Button ID="Upload" runat="server" Text="확인" Height="60px" Width="130px" CssClass="sell_button_apply" OnClick="btnWrite_Click" />
        </div>

    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

