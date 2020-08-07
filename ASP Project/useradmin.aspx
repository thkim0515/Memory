<%@ Page Title="" Language="C#" MasterPageFile="~/ASP_Project2/Site.master" AutoEventWireup="true" CodeFile="useradmin.aspx.cs" Inherits="ASP_Project2_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="imageboard">
       <asp:GridView  ID="userinfo" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="userinfoData" EnableModelValidation="True"
           AllowPaging="True"  CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowSorting="True" HorizontalAlign="Center">
           <Columns>
               <asp:BoundField DataField="super" HeaderText="관리자 권한" ReadOnly="True" SortExpression="super" ItemStyle-HorizontalAlign="Center"  ItemStyle-Width="180px" HeaderStyle-HorizontalAlign="Center"  HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="PostHeader" />
               <asp:BoundField DataField="id" HeaderText="아이디" ReadOnly="True" SortExpression="id" ItemStyle-HorizontalAlign="Center"  ItemStyle-Width="180px" HeaderStyle-HorizontalAlign="Center"  HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="PostHeader" />
               <asp:BoundField DataField="password" HeaderText="비밀번호" SortExpression="password" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader"/>
               <asp:BoundField DataField="nickname" HeaderText="닉네임" SortExpression="nickname" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader"/>
               <asp:BoundField DataField="name" HeaderText="이름" SortExpression="name" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader"/>
               <asp:BoundField DataField="phone" HeaderText="핸드폰번호" SortExpression="phone" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="120px" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader"/>
               <asp:BoundField DataField="address" HeaderText="주소" SortExpression="address" />
               <asp:BoundField DataField="email" HeaderText="이메일" SortExpression="email" />
               <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center" HeaderText="회원탈퇴">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="회원탈퇴" OnClientClick="return confirm('정말로 회원탈퇴 시키겠습니까?'); "></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center" HeaderText="관리자 권한부여">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Update" Text="관리자 권한부여" OnClientClick="return confirm('관리자 권한을 부여하시겠습니까?'); "></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
           </Columns>
           <FooterStyle BackColor="White" ForeColor="#000066" />
           <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
           <RowStyle ForeColor="#000066" />
           <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
       </asp:GridView>
         <asp:SqlDataSource ID="userinfoData" runat="server" ConnectionString="<%$ ConnectionStrings:2020ProjectConnectionString2 %>" 
             SelectCommand="SELECT [id], [password], [nickname], [name], [phone], [address], [email] ,[super]FROM [userinfo]"
             DeleteCommand="Delete From userinfo where [id]=@id" 
             UpdateCommand="Update userinfo set super='관리자' where [id]=@id">

         </asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" Runat="Server">
    
</asp:Content>

