<%@ Page Title="" Language="C#" MasterPageFile="~/ASP_Project2/Site.master" AutoEventWireup="true" CodeFile="sellpost.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="imageboard">
        <asp:GridView ID="sellpost" runat="server" AutoGenerateColumns="False" DataKeyNames="num" DataSourceID="sellpostData" EnableModelValidation="True"
            AllowPaging="True" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowSorting="True" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="num" HeaderText="게시글번호" InsertVisible="False" ReadOnly="True" SortExpression="num" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="180px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="PostHeader" />
                <asp:TemplateField HeaderText="이미지" ItemStyle-Width="100px" ItemStyle-Height="100px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader">
                    <ItemTemplate>
                        <a href="<%# "View.aspx?No=" + Eval("num")%>">
                            <asp:Image ID="imggeUpload" ImageUrl='<%# "images/" + Eval("image") %>' runat="server" Height="150px" Width="160px" /></a>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Height="150px" Width="140px"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="작성자" SortExpression="name" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader" />
                <asp:TemplateField HeaderText="제목" ItemStyle-Width="50%">
                    <ItemTemplate>
                        <a href="<%# "View.aspx?No=" + Eval("num")%>"><%# Eval("Title") %></a>
                    </ItemTemplate>
                    <HeaderStyle Width="250px" />
                    <ItemStyle Width="50%"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="price" HeaderText="판매자 희망가격" SortExpression="writedate" DataFormatString="{0:#,###}" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="writedate" HeaderText="작성일" SortExpression="writedate" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader" />
                <asp:BoundField DataField="readcount" HeaderText="조회수" SortExpression="readcount" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        <%--검색기능--%>
        <asp:DropDownList id="search_object" runat="server">
            <asp:ListItem Value="title">제목</asp:ListItem>
            <asp:ListItem Value="name">작성자</asp:ListItem>
            <asp:ListItem Value="contents">내용</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="SearchBox" runat="server" TextMode="SingleLine" placeholder="검색할 내용을 입력해주세요." CssClass="section_search_textbox"></asp:TextBox>
        <asp:Button runat="server" Text="검색" CssClass="post_search_button" OnClick="Search_Click" />
        <asp:SqlDataSource ID="sellpostData" runat="server" ConnectionString="<%$ ConnectionStrings:2020ProjectConnectionString %>" SelectCommand="SELECT [num], [name], [title], [writedate], [readcount], [image] FROM [sellpost] ORDER BY [num] DESC"></asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

