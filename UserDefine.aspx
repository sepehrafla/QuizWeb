<%@ Page Title="" Language="C#" MasterPageFile="~/MyTemplate.master" AutoEventWireup="true" CodeFile="UserDefine.aspx.cs" Inherits="UserDefine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .auto-style2 {
            width: 155px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">فامیلی و نام</td>
            <td>
                <asp:TextBox ID="txtInfo" runat="server" CssClass="obj" Width="450px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInfo" CssClass="vld" ErrorMessage="مشخصات الزامی است">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">نام کاربر</td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="obj" MaxLength="20" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserName" CssClass="vld" ErrorMessage="نام کاربر  الزامی است">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="vld" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="btnSave" runat="server" CssClass="obj" Text="تائید" Width="100px" OnClick="btnSave_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

