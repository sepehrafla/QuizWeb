<%@ Page Title="" Language="C#" MasterPageFile="~/MyTemplate.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 155px;
        }
        .auto-style3 {
            width: 155px;
            height: 28px;
        }
        .auto-style4 {
            height: 28px;
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
            <td class="auto-style3">سال تولد</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtBirth" runat="server" CssClass="obj" Width="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBirth" CssClass="vld" ErrorMessage="سال تولد  الزامی است">*</asp:RequiredFieldValidator>
&nbsp;
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtBirth" CssClass="vld" ErrorMessage="سال تولد بین 1300 تا 1390 مجاز است" MaximumValue="1390" MinimumValue="1300" Type="Integer">*</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">جنسیت</td>
            <td>
                <asp:RadioButton ID="rdbMale" runat="server" Checked="True" GroupName="Gender" Text="مــرد" />
&nbsp;&nbsp;
                <asp:RadioButton ID="rdbFemale" runat="server" GroupName="Gender" Text="زن" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">تحصیلات</td>
            <td>
                <asp:RadioButton ID="rdbAS" runat="server" GroupName="Education" Text="کاردانی" />
&nbsp;
                <asp:RadioButton ID="rdbBS" runat="server" Checked="True" GroupName="Education" Text="کارشناسی" />
&nbsp;
                <asp:RadioButton ID="rdbMS" runat="server" GroupName="Education" Text="کارشناسی ارشد" />
&nbsp;
                <asp:RadioButton ID="rdbPhd" runat="server" GroupName="Education" Text="دکترا" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">ملیت</td>
            <td>
                <asp:DropDownList ID="drpNation" runat="server" CssClass="obj" Width="450px">
                    <asp:ListItem>ایران</asp:ListItem>
                    <asp:ListItem>فرانسه</asp:ListItem>
                    <asp:ListItem>کانادا</asp:ListItem>
                    <asp:ListItem>ترکیه</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">آدرس</td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="obj" Rows="5" TextMode="MultiLine" Width="450px"></asp:TextBox>
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
            <td class="auto-style2">رمز
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword" CssClass="vld" ErrorMessage="رمز  الزامی است">*</asp:RequiredFieldValidator>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="obj" MaxLength="20" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">تائید رمز<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtConfirm" ControlToValidate="txtPassword" CssClass="vld" ErrorMessage="رمزوارد شده اشتباه است">*</asp:CompareValidator>
            </td>
            <td>
                <asp:TextBox ID="txtConfirm" runat="server" CssClass="obj" MaxLength="20" TextMode="Password" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">ایمیل<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtMail" CssClass="vld" ErrorMessage="ایمیل  الزامی است">*</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtMail" CssClass="vld" ErrorMessage="ایمیل وارد شده نا معتبراست" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
            <td>
                <asp:TextBox ID="txtMail" runat="server" CssClass="obj" Width="450px"></asp:TextBox>
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
                <asp:Button ID="btnSave" runat="server" CssClass="obj" Text="تائید" Width="100px" />
            </td>
            <td>
                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="obj" OnClick="btnCancel_Click" Text="انصراف" Width="100px" />
            </td>
        </tr>
    </table>
</asp:Content>

