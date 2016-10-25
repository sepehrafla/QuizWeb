<%@ Page Title="" Language="C#" MasterPageFile="~/MyTemplate.master" AutoEventWireup="true" CodeFile="Answer.aspx.cs" Inherits="Answer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style2 {
            width: 141px;
        }
    .auto-style3 {
        width: 524px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">سوال</td>
        <td class="auto-style3">
            <asp:TextBox ID="txtQuestion" runat="server" CssClass="obj" Rows="5" TextMode="MultiLine" Width="450px" ReadOnly="True"></asp:TextBox>
        </td>
        <td rowspan="2">
            <asp:Image ID="Image1" runat="server" Width="350px" />
        </td>
    </tr>
    <tr>
        <td class="auto-style2">پاسخ</td>
        <td class="auto-style3">
            <asp:TextBox ID="txtAnswer" runat="server" CssClass="obj" Rows="5" TextMode="MultiLine" Width="450px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:Button ID="btnSave" runat="server" CssClass="obj" OnClick="btnSave_Click" Text="ثبت پاسخ" />
        </td>
        <td class="auto-style3">
            <asp:Button ID="btnUpdate" runat="server" CssClass="obj" OnClick="btnUpdate_Click" Text="تصحیح پاسخ" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>

