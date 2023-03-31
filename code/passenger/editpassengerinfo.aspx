<%@ Page Title="" Language="C#" MasterPageFile="~/code/MasterPage2.master" AutoEventWireup="true" CodeFile="editpassengerinfo.aspx.cs" Inherits="code_passenger_editpassengerinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style21 {
            width: 100%;
        }
        .auto-style22 {
            text-align: right;
            width: 50%;
        }
        .auto-style23 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <td>
        <table class="auto-style21">
            <tr>
                <td colspan="2" style="background-color: #99CCFF" class="auto-style23">乘客个人信息修改</td>
            </tr>
            <tr>
                <td class="auto-style22">乘客编号：</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style22">乘客密码：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style22">乘客姓名：</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style22">乘客性别：</td>
                <td>
                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="sex" Text="男" />
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="sex" Text="女" />
                </td>
            </tr>
            <tr>
                <td class="auto-style22">乘客身份证号：</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style22">乘客联系方式：</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="background-color: #99CCFF" class="auto-style23">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="修改" />
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="重置" />
                </td>
            </tr>
        </table>
    </td>
</asp:Content>

