<%@ Page Title="" Language="C#" MasterPageFile="~/code/MasterPage3.master" AutoEventWireup="true" CodeFile="addcar.aspx.cs" Inherits="code_admin_addcar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style22 {
            text-align: center;
        }
        .auto-style25 {
            width: 152px;
            text-align: right;
            height: 30px;
        }
        .auto-style26 {
            width: 188px;
            height: 30px;
        }
        .auto-style27 {
            width: 152px;
            text-align: right;
            height: 30px;
        }
        .auto-style28 {
            width: 188px;
            height: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <td>
        <table class="auto-style21">
            <tr>
                <td class="auto-style22" colspan="3" style="background-color: #99CCFF">车辆信息录入</td>
            </tr>
            <tr>
                <td class="auto-style25">车辆编号：</td>
                <td class="auto-style26">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td rowspan="10">
                    <div class="auto-style22">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="cno" DataSourceID="SqlDataSource2">
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
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT cno, cprice, yno, cstime, cftime, cpos1, cpos2, cpos3, cpos4, cpos5 FROM citybus.car"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">车票价格：</td>
                <td class="auto-style26">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">车辆驾驶员：</td>
                <td class="auto-style26">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="p1" DataValueField="yno">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT yno,concat(yno,&quot; | &quot;, yname,&quot; | &quot;, yjob) as p1 FROM citybus.yuangong"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">车辆首发时间：</td>
                <td class="auto-style26">
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Time"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">车辆末班时间：</td>
                <td class="auto-style26">
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Time"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style27">车辆站点1：</td>
                <td class="auto-style28">
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="z1" DataValueField="zname">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT zname,concat(zno,&quot; | &quot; , zname) as z1 FROM citybus.pos"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">车辆站点2：</td>
                <td class="auto-style26">
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="z1" DataValueField="zname">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">车辆站点3：</td>
                <td class="auto-style26">
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource3" DataTextField="z1" DataValueField="zname">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">车辆站点4：</td>
                <td class="auto-style26">
                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource3" DataTextField="z1" DataValueField="zname">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">车辆站点5：</td>
                <td class="auto-style26">
                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource3" DataTextField="z1" DataValueField="zname">
                    </asp:DropDownList>
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

