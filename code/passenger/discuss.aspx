<%@ Page Title="" Language="C#" MasterPageFile="~/code/MasterPage2.master" AutoEventWireup="true" CodeFile="discuss.aspx.cs" Inherits="code_passenger_discuss" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style22 {
            text-align: center;
        }
        .auto-style23 {
            height: 24px;
        }
        .auto-style24 {
            text-align: right;
            width: 50%;
        }
        .auto-style25 {
            height: 24px;
            text-align: right;
            width: 821px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <td>
        <table class="auto-style21">
            <tr>
                <td class="auto-style22" colspan="2" style="background-color: #99CCFF">留言评论</td>
            </tr>
            <tr>
                <td class="auto-style25">请选择你要评价的员工：</td>
                <td class="auto-style23">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="y1" DataValueField="yno">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT yno, concat(yno,&quot; | &quot; ,yname) as y1 FROM citybus.yuangong"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">留言评价：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Height="112px" Width="361px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">评分(100分为满分）：</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style22" colspan="2" style="background-color: #99CCFF">
                    <asp:Button ID="Button2" runat="server" Text="提交" OnClick="Button2_Click" />
                </td>
            </tr>
        </table>
    </td>
</asp:Content>

