
<%@ Page Title="Add Author" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="add_author.aspx.cs" Inherits="BookNest.add_author" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
 <div>
        <center>
            <h1>Add Author</h1>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
  <br />
 <table border="3">
     <tr>
<td>Author Name:</td>
 <td>  
     <asp:TextBox ID="txtnm" runat="server"></asp:TextBox>

 </td> 

     </tr>
 <tr> <td>Author Email:</td><td>
     <asp:TextBox ID="txteml" runat="server"></asp:TextBox>  </td> </tr>
  <tr> <td></td><td> <asp:Button ID="Button1" runat="server" Text="Add Author" OnClick="Button1_Click" /></td> </tr>
 </table> </center> </div>

</asp:Content><asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
