<%@ Page Title="" Language="C#" MasterPageFile="~/code/MasterPage3.master" AutoEventWireup="true" CodeFile="alldiscuss.aspx.cs" Inherits="code_admin_alldiscuss" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style22 {
            text-align: center;
        }
        .auto-style25 {
            text-align: right;
            width: 145px;
            height: 24px;
        }
        .auto-style26 {
            width: 25px;
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <td>
        
        <table class="auto-style21">
            <tr>
                <td class="auto-style22" colspan="3" style="background-color: #99CCFF">留言评论管理</td>
            </tr>
            <tr>
                <td class="auto-style25">留言评论编号：</td>
                <td class="auto-style26">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td rowspan="4">
                    <div class="auto-style22">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="dno" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="dno" HeaderText="dno" ReadOnly="True" SortExpression="dno" />
                            <asp:BoundField DataField="yno" HeaderText="yno" SortExpression="yno" />
                            <asp:BoundField DataField="discuss" HeaderText="discuss" SortExpression="discuss" />
                            <asp:BoundField DataField="dscore" HeaderText="dscore" SortExpression="dscore" />
                            <asp:BoundField DataField="ddate" HeaderText="ddate" SortExpression="ddate" />
                            <asp:BoundField DataField="pno" HeaderText="pno" SortExpression="pno" />
                            <asp:ButtonField CommandName="Select" HeaderText="操作" ShowHeader="True" Text="选择" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT dno, yno, discuss, dscore, ddate, pno FROM citybus.dis"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text=" " />
                    员工编号：</td>
                <td class="auto-style26">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="yy" DataValueField="yno">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT yno, concat(yno,&quot; | &quot; ,yname) as yy FROM citybus.yuangong"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">留言评论日期：</td>
                <td class="auto-style26">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:CheckBox ID="CheckBox2" runat="server" Text=" " />
                    乘客编号：</td>
                <td class="auto-style26">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="pp" DataValueField="pno">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT pno, concat(pno,&quot; | &quot; ,pname) as pp FROM citybus.passenger"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="background-color: #99CCFF" class="auto-style22">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="修改" />
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="重置" />
                </td>
                <td style="background-color: #99CCFF" class="auto-style22">
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="查询" />
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="删除" />
                </td>
            </tr>
        </table>
        
    </td>
</asp:Content>

