<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sdata.Master" CodeBehind="IHT45_AL.aspx.vb" Inherits="NTN.IHT45_AL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 85px;
            height: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
      <table cellpadding="0" cellspacing="0" class="auto-style3">
          <tr>
              <td style="text-align: center">
            <asp:Label ID="lblLine" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="XX-Large" Text="IH Alarms"></asp:Label>
              </td>
          </tr>
    </table>
      <table cellpadding="0" cellspacing="0" class="auto-style3">
         <tr>
           <td class="auto-style4">
                <asp:Button ID="btnOV" runat="server" Text="Overview" CssClass="auto-style4" />
           </td>
             <td class="auto-style4">
                <asp:Button ID="btnTR" runat="server" Text="Trends" CssClass="auto-style4" />
             </td>
             <td class="auto-style4">
                <asp:Button ID="btnPI" runat="server" Text="Part info" CssClass="auto-style4" />
             </td>
             <td class="auto-style4">
                <asp:Button ID="btnRE" runat="server" Text="Recipe" CssClass="auto-style4" />
             </td>
             <td class="auto-style4">
                 &nbsp;</td>
             <td class="auto-style4">
                 &nbsp;</td>
             <td style="text-align: right">
                 <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="auto-style4" />
             </td>
        </tr>
    </table>

    <table cellpadding="0" cellspacing="0" class="auto-style3">
       <tr>
         <td>
             &nbsp;</td>
       </tr>
       <tr>
         <td>
            <table width="100%" border="0" cellpadding="0">
                <tr style="vertical-align: middle">
                    <td nowrap style="width: 300px">
                        <asp:RadioButtonList ID="rblHistSelect" runat="server" RepeatDirection="Horizontal" Font-Names="Arial" Font-Size="Small" AutoPostBack="True">
                            <asp:ListItem Selected="True" Value="0">By date</asp:ListItem>
                            <asp:ListItem Value="1">By month</asp:ListItem>
                            <asp:ListItem Value="2">By date range</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td nowrap style="vertical-align: middle">
                        <table align="left" cellpadding="0" cellspacing="0" >
                            <tr>
                                <td>
                        <asp:Panel ID="pl1" runat="server" Wrap="False" Width="200px">
                            <asp:Label ID="lblDate1" runat="server" Text="Date:" Font-Names="Arial" Font-Size="Small"></asp:Label>
                            <asp:TextBox ID="tbxAlDate1" runat="server" AutoPostBack="True" BorderStyle="Inset" TextMode="Date" ToolTip="Alarm date " Width="80px"></asp:TextBox>
                            <asp:ImageButton ID="Image1" runat="Server" AlternateText="Click here to display calendar" ImageUrl="~/Images/Calendar_scheduleHS.png" />
                            &nbsp;
                           
                        </asp:Panel>
                                </td>
                                <td>
                            <asp:Panel ID="pl2" runat="server" Width="200px" Wrap="False">
                                <asp:Label ID="lblDate2" runat="server" Font-Names="Arial" Font-Size="Small" Text="Date:"></asp:Label>
                                <asp:TextBox ID="tbxAlDate2" runat="server" AutoPostBack="True" BorderStyle="Inset" TextMode="Date" ToolTip="Alarm date " Width="80px"></asp:TextBox>
                                <asp:ImageButton ID="Image2" runat="Server" AlternateText="Click here to display calendar" ImageUrl="~/Images/Calendar_scheduleHS.png" />
                            </asp:Panel>
                                </td>
                            </tr>
                        </table>
                        &nbsp;&nbsp;&nbsp;
                            <br />
                    </td>
                   <td nowrap >
                        <asp:Panel ID="pl3" runat="server" Wrap="False" Width="200px">
                            <asp:Label ID="lblYear" runat="server" Text="Year:" Font-Names="Arial" Font-Size="Small"></asp:Label>
                        &nbsp;
                            <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" DataValueField="ID">

                            </asp:DropDownList>
                            &nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblMonth" runat="server" Font-Names="Arial" Font-Size="Small" Text="Month:"></asp:Label>
                            &nbsp;
                            <asp:DropDownList ID="ddlMonth" runat="server" AutoPostBack="True" DataTextField="IH_Recipe_Date" DataValueField="ID">
                                <asp:ListItem Value="1">Jan</asp:ListItem>
                                <asp:ListItem Value="2">Feb</asp:ListItem>
                                <asp:ListItem Value="3">Mar</asp:ListItem>
                                <asp:ListItem Value="4">Apr</asp:ListItem>
                                <asp:ListItem Value="5">May</asp:ListItem>
                                <asp:ListItem Value="6">Jun</asp:ListItem>
                                <asp:ListItem Value="7">Jul</asp:ListItem>
                                <asp:ListItem Value="8">Aug</asp:ListItem>
                                <asp:ListItem Value="9">Sep</asp:ListItem>
                                <asp:ListItem Value="10">Oct</asp:ListItem>
                                <asp:ListItem Value="11">Nov</asp:ListItem>
                                <asp:ListItem Value="12">Dec</asp:ListItem>
                            </asp:DropDownList>
                        </asp:Panel>
                    </td>
                    <td >&nbsp;
                     </td>
                    <td >
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="9">
                        <asp:Label runat="server" ID="lblMessage" Font-Names="Arial" ForeColor="Red" Visible="False">Message</asp:Label>
                    </td>
                </tr>
            </table>
         </td>
       </tr>
       <tr>
         <td>
         </td>
       </tr>
       <tr>
         <td>
             <br />
             <asp:GridView ID="gvAlarms" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlIHT45Alarms" ForeColor="Black" GridLines="Vertical">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:BoundField DataField="LogTime" HeaderText="DateTime" ReadOnly="True" SortExpression="LogTime" />
                     <asp:BoundField DataField="AlmName" HeaderText="Alarm Description" ReadOnly="True" SortExpression="AlmName" />
                 </Columns>
                 <FooterStyle BackColor="#CCCC99" />
                 <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                 <RowStyle BackColor="#F7F7DE" />
                 <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                 <SortedAscendingCellStyle BackColor="#FBFBF2" />
                 <SortedAscendingHeaderStyle BackColor="#848384" />
                 <SortedDescendingCellStyle BackColor="#EAEAD3" />
                 <SortedDescendingHeaderStyle BackColor="#575357" />
             </asp:GridView>
             <asp:SqlDataSource ID="SqlIHT45Alarms" runat="server" ConnectionString="<%$ ConnectionStrings:IHT45ConnectionString %>" SelectCommand="SELECT * FROM [AlarmLog4]" >
            </asp:SqlDataSource>
             <asp:GridView ID="gvAlarmPareto" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlAlarmPareto" ForeColor="Black" GridLines="Vertical">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:BoundField DataField="Description" HeaderText="Description" ReadOnly="True" SortExpression="Description" />
                     <asp:BoundField DataField="Amount" HeaderText="Amount" ReadOnly="True" SortExpression="Amount" />
                 </Columns>
                 <FooterStyle BackColor="#CCCC99" />
                 <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                 <RowStyle BackColor="#F7F7DE" />
                 <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                 <SortedAscendingCellStyle BackColor="#FBFBF2" />
                 <SortedAscendingHeaderStyle BackColor="#848384" />
                 <SortedDescendingCellStyle BackColor="#EAEAD3" />
                 <SortedDescendingHeaderStyle BackColor="#575357" />
             </asp:GridView>
             <asp:SqlDataSource ID="SqlAlarmPareto" runat="server" ConnectionString="<%$ ConnectionStrings:IHT45ConnectionString %>" SelectCommand="SELECT * FROM [AlarmLog4]" ></asp:SqlDataSource>
             <br />
             <asp:Chart ID="chtAlarmPareto" runat="server" BackColor="PapayaWhip" DataSourceID="SqlAlarmPareto" Height="600px" Width="800px">
                 <Series>
                     <asp:Series ChartType="Bar" Color="Red" CustomProperties="DrawingStyle=Emboss" Font="Arial, 9.75pt" IsValueShownAsLabel="True" IsXValueIndexed="True" LabelBackColor="Beige" LabelBorderColor="Yellow" Name="Series1" XValueMember="Description" YValueMembers="Amount">
                     </asp:Series>
                 </Series>
                 <ChartAreas>
                     <asp:ChartArea Name="ChartArea1">
                         <AxisX IsReversed="True">
                             <LabelStyle Interval="1" />
                         </AxisX>
                         <AxisX2 IsReversed="True">
                         </AxisX2>
                         <Area3DStyle Enable3D="True" PointDepth="50" PointGapDepth="50" WallWidth="10" />
                     </asp:ChartArea>
                 </ChartAreas>
                 <BorderSkin PageColor="Transparent" SkinStyle="Emboss" />
             </asp:Chart>
           </td>
       </tr>
       <tr>
         <td>&nbsp;</td>
       </tr>
       <tr>
         <td>&nbsp;</td>
       </tr>
    </table>

    <asp:CalendarExtender ID="Cal1" runat="server" TargetControlID="tbxAlDate1" PopupButtonID="Image1"></asp:CalendarExtender>
    <asp:CalendarExtender ID="Cal2" runat="server" TargetControlID="tbxAlDate2" PopupButtonID="Image2"></asp:CalendarExtender>

    <br />
</asp:Content>

