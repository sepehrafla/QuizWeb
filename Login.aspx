<%@ Page Title="" Language="C#" MasterPageFile="~/MyTemplate.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 144px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">نام کاربر:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" CssClass="vld" ErrorMessage="نام کاربر الزامی است">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtName" runat="server" CssClass="obj" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">پین کد <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPinCode" CssClass="vld" ErrorMessage="رمز الزامی است">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtPinCode" runat="server" CssClass="obj" TextMode="Password" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="vld" ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="btnSignIn" runat="server" CssClass="obj" OnClick="btnSignIn_Click" Text="ورود" Width="100px" />
            </td>
            <td>
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">کاربر جدید</td>
            <td>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/UserDefine.aspx">ثبت نام</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>

