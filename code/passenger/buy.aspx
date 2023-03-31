<%@ Page Title="" Language="C#" MasterPageFile="~/code/MasterPage2.master" AutoEventWireup="true" CodeFile="buy.aspx.cs" Inherits="code_passenger_buy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style22 {
            text-align: center;
        }
        .auto-style27 {
            text-align: center;
            width: 57px;
        }
        .auto-style28 {
            text-align: right;
            width: 102px;
            height: 40px;
        }
        .auto-style29 {
            height: 40px;
        }
        .auto-style31 {
            width: 114px;
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <td>
        <table class="auto-style21">
            <tr>
                <td class="auto-style22" colspan="4" style="background-color: #99CCFF">购票</td>
            </tr>
            <tr>
                <td class="auto-style28">支付单号：</td>
                <td colspan="2" class="auto-style29">
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>
                </td>
                <td rowspan="7">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="cno" DataSourceID="SqlDataSource1">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="cno" HeaderText="cno" ReadOnly="True" SortExpression="cno" />
                            <asp:BoundField DataField="cprice" HeaderText="cprice" SortExpression="cprice" />
                            <asp:BoundField DataField="yno" HeaderText="yno" SortExpression="yno" />
                            <asp:BoundField DataField="cstime" HeaderText="cstime" SortExpression="cstime" />
                            <asp:BoundField DataField="cftime" HeaderText="cftime" SortExpression="cftime" />
                            <asp:BoundField DataField="cpos1" HeaderText="cpos1" SortExpression="cpos1" />
                            <asp:BoundField DataField="cpos2" HeaderText="cpos2" SortExpression="cpos2" />
                            <asp:BoundField DataField="cpos3" HeaderText="cpos3" SortExpression="cpos3" />
                            <asp:BoundField DataField="cpos4" HeaderText="cpos4" SortExpression="cpos4" />
                            <asp:BoundField DataField="cpos5" HeaderText="cpos5" SortExpression="cpos5" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT cno, cprice, yno, cstime, cftime, cpos1, cpos2, cpos3, cpos4, cpos5 FROM citybus.car"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style28">乘客编号：</td>
                <td colspan="2" class="auto-style29">
                    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style28">出发地：</td>
                <td class="auto-style31">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="zname" DataValueField="zname">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT zname FROM citybus.pos"></asp:SqlDataSource>
                </td>
                <td class="auto-style27" rowspan="2">
                    <asp:Button ID="Button3" runat="server" Text="查询" OnClick="Button3_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style28">目的地：</td>
                <td class="auto-style31">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="zname" DataValueField="zname">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT zname FROM citybus.pos"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT zname FROM citybus.pos"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style28">车辆编号：</td>
                <td class="auto-style29" colspan="2">
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="cno" DataValueField="cno">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT cno FROM citybus.car"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style28">乘车日期：</td>
                <td colspan="2" class="auto-style29">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style28">票价:</td>
                <td colspan="2" class="auto-style29">
                    <asp:Label ID="Label2" runat="server" Text=" "></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style22" colspan="3" style="background-color: #99CCFF">
                    <asp:Button ID="Button2" runat="server" Text="购票" OnClick="Button2_Click" />
                </td>
                <td style="background-color: #99CCFF">&nbsp;</td>
            </tr>
        </table>
    </td>
</asp:Content>

