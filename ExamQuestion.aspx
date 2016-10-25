<%@ Page Title="" Language="C#" MasterPageFile="~/MyTemplate.master" AutoEventWireup="true" CodeFile="ExamQuestion.aspx.cs" Inherits="ExamQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table class="auto-style1">
    <tr>
        <td class="exam_header" colspan="2">
            <asp:Image ID="Image1" runat="server" Height="200px" Width="100%" />
        </td>
    </tr>
    <tr>
        <td class="exam_right">
            <asp:GridView ID="grvQuestion" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" Width="100%">
                <AlternatingRowStyle BackColor="PaleGoldenrod" />
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="qstID" DataNavigateUrlFormatString="answer.aspx?qs={0}" Text="پاسخ" />
                    <asp:BoundField DataField="QstID" HeaderText="کد سوال"></asp:BoundField>
                    <asp:BoundField DataField="QstInfo" HeaderText="شرح"></asp:BoundField>
                    <asp:TemplateField HeaderText="تصویر">
                      
                        <ItemTemplate>
                            <asp:Image ID="Image1" ImageUrl='<%# "QuestionImages\\"+ Eval("QstImg") %>'    Visible='<%#   (Eval("QstImg").ToString()!="")?true:false %>' runat  ="server" Height="150px" Width="150px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                     <asp:TemplateField HeaderText="پاسخ">
                  
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox1" Text="" Width="450px" CssClass="obj" runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField ButtonType="Button" Text="ثبت">
                    <ControlStyle CssClass="obj" />
                    </asp:ButtonField>
                </Columns>
                <FooterStyle BackColor="Tan" />
                <HeaderStyle BackColor="Tan" Font-Bold="True" />
                <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                <SortedAscendingCellStyle BackColor="#FAFAE7" />
                <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                <SortedDescendingCellStyle BackColor="#E1DB9C" />
                <SortedDescendingHeaderStyle BackColor="#C2A47B" />
            </asp:GridView>
        </td>
        <td class="exam_left">
            <asp:GridView ID="grvUser" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="UInfo" HeaderText="اعضاء گروه">
                    <ItemStyle Width="100%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="درصد">
                      
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Percentage").ToString()+" %" %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>

