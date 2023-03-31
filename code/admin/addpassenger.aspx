<%@ Page Title="" Language="C#" MasterPageFile="~/code/MasterPage3.master" AutoEventWireup="true" CodeFile="addpassenger.aspx.cs" Inherits="code_admin_addpassenger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style23 {
            width: 94px;
            height: 33px;
        }
        .auto-style24 {
            text-align: right;
            width: 148px;
            height: 33px;
        }
        .auto-style25 {
            width: 100px;
            height: 33px;
        }
        .auto-style26 {
            text-align: center;
        }
        .auto-style27 {
            text-align: center;
            height: 31px;
        }
        .auto-style28 {
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <td>
        <table class="auto-style21">
            <tr>
                <td colspan="3" style="background-color: #99CCFF" class="auto-style26">乘客信息录入</td>
            </tr>
            <tr>
                <td class="auto-style24">乘客编号：</td>
                <td class="auto-style25">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td rowspan="6">
                    <div class="auto-style26">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="pno" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="pno" HeaderText="pno" ReadOnly="True" SortExpression="pno" />
                            <asp:BoundField DataField="pmm" HeaderText="pmm" SortExpression="pmm" />
                            <asp:BoundField DataField="pname" HeaderText="pname" SortExpression="pname" />
                            <asp:BoundField DataField="psex" HeaderText="psex" SortExpression="psex" />
                            <asp:BoundField DataField="pid" HeaderText="pid" SortExpression="pid" />
                            <asp:BoundField DataField="pphone" HeaderText="pphone" SortExpression="pphone" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT pno, pmm, pname, psex, pid, pphone FROM citybus.passenger"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">乘客密码：</td>
                <td class="auto-style25">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">乘客姓名：</td>
                <td class="auto-style25">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">乘客性别：</td>
                <td class="auto-style25">
                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="sex" Text="男" />
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="sex" Text="女" />
                </td>
            </tr>
            <tr>
                <td class="auto-style24">乘客身份证号：</td>
                <td class="auto-style25">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">乘客联系方式：</td>
                <td class="auto-style23">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style27" colspan="2" style="background-color: #99CCFF">
                    <asp:Button ID="Button2" runat="server" Text="录入" OnClick="Button2_Click" />
                    <asp:Button ID="Button3" runat="server" Text="重置" OnClick="Button3_Click" />
                </td>
                <td style="background-color: #99CCFF" class="auto-style28"></td>
            </tr>
        </table>
    </td>
</asp:Content>

