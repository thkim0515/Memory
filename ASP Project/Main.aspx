<%@ Page Title="" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <%--sellpost 그리드뷰--%>
    <asp:GridView ID="sellpostMain" runat="server" AutoGenerateColumns="False" DataKeyNames="num" DataSourceID="SqlDataSource1" EnableModelValidation="True"
        AllowPaging="True" CellPadding="3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" AllowSorting="True" HorizontalAlign="Center">
        <Columns>
            <asp:BoundField DataField="num" HeaderText="num" InsertVisible="False" ReadOnly="True" SortExpression="num" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="PostHeader">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="PostHeader"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="PostHeader">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="PostHeader"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="PostHeader">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="PostHeader"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="writedate" HeaderText="writedate" SortExpression="writedate" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="PostHeader">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="PostHeader"></HeaderStyle>
            </asp:BoundField>
            <asp:BoundField DataField="image" HeaderText="image" SortExpression="image" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-CssClass="PostHeader">
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="PostHeader"></HeaderStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="이미지" ItemStyle-Width="100px" ItemStyle-Height="100px" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" HeaderStyle-CssClass="PostHeader">
                <ItemTemplate>
                    <a href="<%# "View.aspx?No=" + Eval("num")%>">
                        <asp:Image ID="imggeUpload" ImageUrl='<%# "images/" + Eval("image") %>' runat="server" Height="150px" Width="160px" /></a>
                </ItemTemplate>

                <HeaderStyle HorizontalAlign="Center" CssClass="PostHeader"></HeaderStyle>

                <ItemStyle HorizontalAlign="Center" Height="150px" Width="140px"></ItemStyle>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:2020ProjectConnectionString4 %>" SelectCommand="SELECT TOP (4)  [num], [name], [title], [writedate], [image] FROM [sellpost] ORDER BY [writedate]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="Server">
</asp:Content>

<%--테스트 구문 


             <asp:TemplateField HeaderText="" InsertVisible="False" SortExpression="CustomerId">
               <ItemTemplate>
                   <table>
                       <tr>
                           <td>
                               <asp:Image ID="imggeUpload" ImageUrl='<%# "images/" + Eval("image") %>' runat="server" Height="200px" Width="200px" />
                               <asp:HiddenField runat="server" ID="image1url" />
                               <asp:Image ID="Image1" ImageUrl='<%# "images/" + Eval("image") %>' runat="server" Height="200px" Width="200px" />
                           </td>  
                       </tr>
                       <tr>
                           <td style="text-align:center;">책제목: <asp:Label ID="Label2" runat="server" Text='<%# Eval("title")  %>'></asp:Label></td>
                       </tr>
                   </table>
               </ItemTemplate>
           </asp:TemplateField>
    
--%>