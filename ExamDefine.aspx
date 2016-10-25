<%@ Page Title="" Language="C#" MasterPageFile="~/MyTemplate.master" AutoEventWireup="true" CodeFile="ExamDefine.aspx.cs" Inherits="ExamDefine" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style2 {
        width: 165px;
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
        <td class="auto-style2">نام آزمون<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" CssClass="vld" ErrorMessage="نام آزمون  الزامی است">*</asp:RequiredFieldValidator>
        </td>
        <td>
            <asp:TextBox ID="txtName" runat="server" CssClass="obj" Width="450px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">تصویر:</td>
        <td>
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="Obj" Width="450px" />
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
            <asp:Button ID="btnSave" runat="server" CssClass="obj" OnClick="btnSave_Click" Text="ثبت آزمون" CausesValidation="False" />
        </td>
        <td>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>

