<%@ Page Title="" Language="C#" MasterPageFile="~/code/MasterPage3.master" AutoEventWireup="true" CodeFile="count.aspx.cs" Inherits="code_admin_count" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style22 {
            text-align: center;
        }
        .auto-style23 {
            text-align: right;
            width: 155px;
        }
        .auto-style24 {
            width: 178px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <td>
        <table class="auto-style21">
            <tr>
                <td class="auto-style22" colspan="3" style="background-color: #99CCFF">统计</td>
            </tr>
            <tr>
                <td class="auto-style23">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text=" " />
                    按车辆编号：</td>
                <td class="auto-style24">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="c1" DataValueField="cno">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT cno, concat(cno,&quot; | &quot;,cprice) as c1 FROM citybus.car"></asp:SqlDataSource>
                </td>
                <td rowspan="7">
                    <div class="auto-style22">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="sno" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="sno" HeaderText="sno" ReadOnly="True" SortExpression="sno" />
                            <asp:BoundField DataField="pno" HeaderText="pno" SortExpression="pno" />
                            <asp:BoundField DataField="cno" HeaderText="cno" SortExpression="cno" />
                            <asp:BoundField DataField="ride" HeaderText="ride" SortExpression="ride" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT sno, pno, cno, ride FROM citybus.sell"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">
                    <asp:CheckBox ID="CheckBox2" runat="server" Text=" " />
                    按乘客编号：</td>
                <td class="auto-style24">
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="p1" DataValueField="pno">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT pno,concat(pno,&quot; | &quot; , pname) as p1 FROM citybus.passenger"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">
                    <asp:CheckBox ID="CheckBox3" runat="server" Text=" " OnCheckedChanged="CheckBox3_CheckedChanged" />
                    按年：</td>
                <td class="auto-style24">
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True">
                        <asp:ListItem>--请选择--</asp:ListItem>
                        <asp:ListItem>2019</asp:ListItem>
                        <asp:ListItem>2020</asp:ListItem>
                        <asp:ListItem>2021</asp:ListItem>
                        <asp:ListItem>2022</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">
                    <asp:CheckBox ID="CheckBox4" runat="server" Text=" " OnCheckedChanged="CheckBox4_CheckedChanged" />
                    按月：</td>
                <td class="auto-style24">
                    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True">
                        <asp:ListItem>--请选择--</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">
                    <asp:CheckBox ID="CheckBox5" runat="server" Text=" " OnCheckedChanged="CheckBox5_CheckedChanged" />
                    按日：</td>
                <td class="auto-style24">
                    <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True">
                        <asp:ListItem>--请选择--</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>21</asp:ListItem>
                        <asp:ListItem>22</asp:ListItem>
                        <asp:ListItem>23</asp:ListItem>
                        <asp:ListItem>24</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>26</asp:ListItem>
                        <asp:ListItem>27</asp:ListItem>
                        <asp:ListItem>28</asp:ListItem>
                        <asp:ListItem>29</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>31</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">总出行人数：</td>
                <td class="auto-style24">
                    <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">总消费金额：</td>
                <td class="auto-style24">
                    <asp:Label ID="Label2" runat="server" Text=" "></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style22" colspan="3" style="background-color: #99CCFF">
                    <asp:Button ID="Button2" runat="server" Text="统计" OnClick="Button2_Click" />
                    <asp:Button ID="Button3" runat="server" Text="重置" OnClick="Button3_Click" />
                </td>
            </tr>
        </table>
    </td>
</asp:Content>

