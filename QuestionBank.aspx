<%@ Page Title="" Language="C#" MasterPageFile="~/MyTemplate.master" AutoEventWireup="true" CodeFile="QuestionBank.aspx.cs" Inherits="QuestionBank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 141px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <p>
                    شخصی که لاگ این کرده، فقط آزمونهای خودش را بتواند سوال طرح کند</p>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">آزمون</td>
            <td>
                <asp:DropDownList ID="drpExam" runat="server" BackColor="Yellow" CssClass="obj" Width="450px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">سوال</td>
            <td>
                <asp:TextBox ID="txtQuestion" runat="server" CssClass="obj" Rows="5" TextMode="MultiLine" Width="450px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">تصویر</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="obj" Width="450px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">پاسخ</td>
            <td>
                <asp:TextBox ID="txtAnswer" runat="server" CssClass="obj" Rows="5" TextMode="MultiLine" Width="450px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Button ID="btnSave" runat="server" CssClass="obj" Text="ثبت" Width="100px" OnClick="btnSave_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

