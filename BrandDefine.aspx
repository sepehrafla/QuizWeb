<%@ Page Title="" Language="C#" MasterPageFile="~/MyTemplate.master" AutoEventWireup="true" CodeFile="BrandDefine.aspx.cs" Inherits="BrandDefine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style2 {
        width: 136px;
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
        <td class="auto-style2">نام برند<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" CssClass="vld" ErrorMessage="نام برند الزامی است">*</asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server" CssClass="obj" Width="450px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">انتخاب لوگو</td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="obj" Width="450px" />
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
        <td>
            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="obj" Text="انصراف" Width="100px" OnClick="btnCancel_Click" />
        </td>
    </tr>
</table>
</asp:Content>

