<%@ Page Title="" Language="C#" MasterPageFile="~/code/MasterPage3.master" AutoEventWireup="true" CodeFile="mmweihu.aspx.cs" Inherits="code_admin_mmweihu" %>

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
            width: 50%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <td>
        <table class="auto-style21">
            <tr>
                <td class="auto-style22" colspan="2" style="background-color: #99CCFF">密码维护</td>
            </tr>
            <tr>
                <td class="auto-style23">管理员编号：</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">输入原始密码：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">输入新密码：</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">再次输入新密码：</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style22" colspan="2" style="background-color: #99CCFF">
                    <asp:Button ID="Button2" runat="server" Text="确定" OnClick="Button2_Click" style="width: 50px" />
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="重置" />
                </td>
            </tr>
        </table>
    </td>
</asp:Content>

