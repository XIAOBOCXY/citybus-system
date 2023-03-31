<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .slide:hover,
        .slide:focus {
            box-shadow: inset 6.5em 0 0 0 var(--hover);
        }

        .slide {
            --color: #8fc866;
            --hover: #66c887;
        }

        .button {
            color: var(--color);
            -webkit-transition: 0.25s;
            transition: 0.25s;
        }

            .button:hover, button:focus {
                border-color: var(--hover);
                color: #fff;
            }

        body {
            color: #17181c;
            background: #ffffff;
            font: 300 1em 'Fira Sans', sans-serif;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            -ms-flex-line-pack: center;
            align-content: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            text-align: center;
            min-height: 20vh;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            width: 100%;
            height: 100%;
            margin: 0;
        }

        .button {
            background: none;
            border: 2px solid;
            font: inherit;
            line-height: 1;
            margin: 0.5em;
            padding: 1em 2em;
        }

        .auto-style6 {
            margin: 0;
            padding: 0;
            position: absolute;
            left: 50%;
            top: 45%;
            /*border:1px solid #F00;*/
            transform: translate(-50%,-45%);
        }

        .auto-style7 {
            text-align: left;
            height: 41px;
        }

        .auto-style8 {
            text-align: right;
            height: 41px;
        }

        .auto-style9 {
            height: 41px;
        }

        .table-style1 {
            border: 1px #4cff00;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 1px #a3f082;
        }
        .auto-style10 {
            border: 1px #4cff00;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 1px #a3f082;
            width: 378px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1>员工注册</h1>
        <div class="auto-style6">
            <table class="auto-style10">
                <tr>
                    <td colspan="2" class="auto-style9" style="font-size: large; font-weight: lighter;">注册窗口</td>
                </tr>
                <tr>
                    <td class="auto-style8">用户名：</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">密码：</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">再次确认密码：</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">姓名：</td>
                    <td class="auto-style7">
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">职务：</td>
                    <td class="auto-style7">
                       <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button1" runat="server" Text="注册" CssClass="button slide" OnClick="Button1_Click"/>
                        <asp:Button ID="Button2" runat="server" Text="返回" CssClass="button slide" OnClick="Button2_Click"/>
                    </td>
                </tr>
            </table>
            <br />
        </div>
    </form>
</body>
</html>
