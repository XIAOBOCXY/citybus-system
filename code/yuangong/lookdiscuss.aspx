<%@ Page Title="" Language="C#" MasterPageFile="~/code/MasterPage.master" AutoEventWireup="true" CodeFile="lookdiscuss.aspx.cs" Inherits="code_yuangong_lookdiscuss" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style22 {
            text-align: center;
        }
        .auto-style23 {
            width: 134px;
            text-align: right;
        }
        .auto-style25 {
            text-align: left;
            width: 219px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <td>
        <table class="auto-style21">
            <tr>
                <td class="auto-style22" colspan="3" style="background-color: #99CCFF">查看留言评论</td>
            </tr>
            <tr>
                <td class="auto-style23">
                    员工编号：</td>
                <td class="auto-style25">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
                <td rowspan="3">
                    <div class="auto-style22">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="dno" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="dno" HeaderText="dno" ReadOnly="True" SortExpression="dno" />
                                <asp:BoundField DataField="yno" HeaderText="yno" SortExpression="yno" />
                                <asp:BoundField DataField="discuss" HeaderText="discuss" SortExpression="discuss" />
                                <asp:BoundField DataField="dscore" HeaderText="dscore" SortExpression="dscore" />
                                <asp:BoundField DataField="ddate" HeaderText="ddate" SortExpression="ddate" />
                                <asp:BoundField DataField="pno" HeaderText="pno" SortExpression="pno" />
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT dno, yno, discuss, dscore, ddate, pno FROM citybus.dis ;"></asp:SqlDataSource>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text=" " />
                    乘客编号：</td>
                <td class="auto-style25">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataValueField="pno" DataTextField="p1">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT distinct pno ,concat(pno, &quot; | &quot; ,pname) as p1 FROM citybus.passenger"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">
                    <asp:CheckBox ID="CheckBox2" runat="server" Text=" " />
                    留言日期：</td>
                <td class="auto-style25">
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style22" colspan="2" style="background-color: #99CCFF">
                    <asp:Button ID="Button2" runat="server" Text="查询" OnClick="Button2_Click" />
                    <asp:Button ID="Button3" runat="server" Text="重置" OnClick="Button3_Click" />
                </td>
                <td style="background-color: #99CCFF">&nbsp;</td>
            </tr>
        </table>
    </td>
</asp:Content>

