<%@ Page Title="" Language="C#" MasterPageFile="~/code/MasterPage3.master" AutoEventWireup="true" CodeFile="addzhandian.aspx.cs" Inherits="code_admin_addzhandian" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style22 {
            text-align: center;
        }
        .auto-style26 {
            width: 130px;
            height: 46px;
            text-align: right;
        }
        .auto-style27 {
            width: 97px;
            text-align: left;
            height: 46px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <td>
        <table class="auto-style21">
            <tr>
                <td class="auto-style22" colspan="3" style="background-color: #99CCFF">站点信息录入</td>
            </tr>
            <tr>
                <td class="auto-style26">站点编号：</td>
                <td class="auto-style27">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td rowspan="2">
                    <div class="auto-style22">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="zno" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="zno" HeaderText="zno" ReadOnly="True" SortExpression="zno" />
                            <asp:BoundField DataField="zname" HeaderText="zname" SortExpression="zname" />
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT zno, zname FROM citybus.pos"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style26">站点名称：</td>
                <td class="auto-style27">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style22" colspan="2" style="background-color: #99CCFF">
                    <asp:Button ID="Button2" runat="server" Text="录入" OnClick="Button2_Click" />
                    <asp:Button ID="Button3" runat="server" Text="重置" OnClick="Button3_Click" />
                </td>
                <td style="background-color: #99CCFF">&nbsp;</td>
            </tr>
        </table>
    </td>
</asp:Content>

