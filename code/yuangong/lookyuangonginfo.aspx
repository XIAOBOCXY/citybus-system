<%@ Page Title="" Language="C#" MasterPageFile="~/code/MasterPage.master" AutoEventWireup="true" CodeFile="lookyuangonginfo.aspx.cs" Inherits="code_yuangong_lookinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style22 {
            height: 24px;
            text-align: center;
        }
        .auto-style23 {
            text-align: right;
            width: 50%;
        }
        .auto-style24 {
            text-align: right;
            width: 50%;
            height: 24px;
        }
        .auto-style25 {
            height: 24px;
            text-align: left;
        }
        .auto-style26 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <td>
        <table class="auto-style21" style="font-size: large; background-color: #99CCFF;">
            <tr>
                <td class="auto-style22" colspan="2">员工个人信息</td>
            </tr>
            <tr>
                <td class="auto-style24">员工编号：</td>
                <td class="auto-style25">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">员工密码：</td>
                <td class="auto-style26">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">员工姓名：</td>
                <td class="auto-style26">
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">员工职务：</td>
                <td class="auto-style26">
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">员工月薪：</td>
                <td class="auto-style26">
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">员工满意度：</td>
                <td class="auto-style26">
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
    </td>
</asp:Content>

