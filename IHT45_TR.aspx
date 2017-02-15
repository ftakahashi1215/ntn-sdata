<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sdata.Master" CodeBehind="IHT45_TR.aspx.vb" Inherits="NTN.IHT45_TR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 85px;
            height: 25px;
        }
        .auto-style5 {
            height: 21px;
        }
        .auto-style6 {
            width: 516px;
        }
        .auto-style7 {
            width: 149px;
        }
        .auto-style8 {
            border: 2px solid #000000;
        }
        .lblAllign {
            text-align:center;
        }
    .auto-style9 {
        width: 43px;
    }
    .auto-style10 {
        width: 37px;
    }
    </style>
    <link href="../../../../Assets/CSS/Analog.css" type="text/css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
      <table cellpadding="0" cellspacing="0" class="auto-style3">
          <tr>
              <td style="text-align: center">
            <asp:Label ID="lblLine" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="XX-Large" Text="Line"></asp:Label>
                  <br />
             <asp:Label ID="lblErrMsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" ForeColor="Red"></asp:Label>
              </td>
          </tr>
    </table>
      <table cellpadding="0" cellspacing="0" class="auto-style3">
         <tr>
           <td class="auto-style4">
                <asp:Button ID="btnOV" runat="server" Text="Overview" CssClass="auto-style4" />
           </td>
             <td class="auto-style4">
                <asp:Button ID="btnPI" runat="server" Text="Part info" CssClass="auto-style4" />
             </td>
             <td class="auto-style4">
                <asp:Button ID="btnAL" runat="server" Text="Alarms" CssClass="auto-style4" />
             </td>
             <td class="auto-style4">
                <asp:Button ID="btnRE" runat="server" Text="Recipe" CssClass="auto-style4" />
             </td>
             <td class="auto-style4">
                 &nbsp;</td>
             <td nowrap class="auto-style4">
                 <asp:Button ID="btnExport" runat="server" Text="Export" />
             </td>
             <td style="text-align: right"><asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="auto-style4" />
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
             <table cellpadding="3" cellspacing="3" >
                 <tr>
                     <td style="border: medium solid #000000" class="auto-style6"  >
                          <table cellpadding="0" cellspacing="0" >
                             <tr>
                               <td class="auto-style4">
                                    <asp:Label ID="Label1" runat="server" Font-Names="Arial" Font-Size="Large" Text="HARDEN"></asp:Label>
                               </td>
                                 <td class="auto-style4">
                                    <asp:Button ID="btnHE" runat="server" Text="Energy" CssClass="auto-style4" BackColor="#E6E6E6" BorderColor="Red" BorderStyle="Ridge" BorderWidth="4px" />
                                 </td>
                                 <td class="auto-style4">
                                    <asp:Button ID="btnHIDF" runat="server" Text="ID Flow" CssClass="auto-style4" BackColor="#E6E6E6" BorderColor="Green" BorderStyle="Ridge" BorderWidth="4px" />
                                 </td>
                                 <td class="auto-style4">
                                    <asp:Button ID="btnHODF" runat="server" Text="OD Flow" CssClass="auto-style4" BackColor="#E6E6E6" BorderColor="Green" BorderStyle="Ridge" BorderWidth="4px" />
                                 </td>
                                 <td class="auto-style4">
                                    <asp:Button ID="btnHIDP" runat="server" Text="ID Press" CssClass="auto-style4" BackColor="#E6E6E6" BorderColor="Green" BorderStyle="Ridge" BorderWidth="4px" />
                                 </td>
                                 <td nowrap class="auto-style4">
                                    <asp:Button ID="btnHODP" runat="server" Text="OD Press" CssClass="auto-style4" BackColor="#E6E6E6" BorderColor="Green" BorderStyle="Ridge" BorderWidth="4px" />
                                 </td>
                                 <td nowrap class="auto-style4">
                                     &nbsp;</td>
                            </tr>
                        </table>
                     </td>
                     <td style="border: medium solid #000000" >
                          <table cellpadding="0" cellspacing="0">
                             <tr>
                               <td class="auto-style4">
                                    <asp:Label ID="Label2" runat="server" Font-Names="Arial" Font-Size="Large" Text="TEMPER"></asp:Label>
                               </td>
                                 <td class="auto-style4">
                                    <asp:Button ID="btnTC" runat="server" Text="Current" CssClass="auto-style4" BackColor="#E6E6E6" BorderColor="Green" BorderStyle="Ridge" BorderWidth="4px" />
                                 </td>
                                 <td class="auto-style4">
                                    <asp:Button ID="btnTT" runat="server" Text="Temperature" CssClass="auto-style4" BackColor="#E6E6E6" BorderColor="Green" BorderStyle="Ridge" BorderWidth="4px" />
                                 </td>
                                 <td class="auto-style4">
                                     &nbsp;</td>
                            </tr>
                        </table>

                     </td>
                 </tr>
             </table>
             <br />
            
         </td>
       </tr>
       <tr>
         <td  class="auto-style5">
              <table cellpadding="2" >
                 <tr>
                     <td nowrap style="border: 1px solid #0000FF; vertical-align: middle; text-align: center;">
                         <asp:RadioButtonList ID="rblHist" runat="server" RepeatDirection="Horizontal" Width="180px" AutoPostBack="True">
                             <asp:ListItem Selected="True" Value="1">Current</asp:ListItem>
                             <asp:ListItem Value="2">Historical</asp:ListItem>
                         </asp:RadioButtonList>
                     </td>
                     <td nowrap style="border: 1px solid #0000FF; vertical-align: middle; text-align: center;" class="auto-style7">
                         <table cellpadding="0" cellspacing="0" class="auto-style3">
                             <tr>
                                 <td>

                                 <asp:Label ID="lblDate0" runat="server" Text="Points:" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                 </td>
                                 <td>

                    

                                <asp:TextBox ID="tbxGnum" runat="server" AutoPostBack="True" EnableViewState="False" TextMode="Number" ViewStateMode="Disabled" Visible="True" Width="40px" Wrap="False">100</asp:TextBox>
                         
                                 </td>
                             </tr>
                         </table>

                     </td>
                     <td nowrap style="border: 1px solid #0000FF; vertical-align: middle; text-align: center;">
                         &nbsp;<asp:CheckBox ID="cbxHideLim" runat="server" Text="Hide limits" AutoPostBack="True" />
                        &nbsp;&nbsp;

                     </td>
                     <td nowrap style="border: 1px solid #0000FF; vertical-align: middle; text-align: center;">
                         &nbsp;<asp:Label ID="lblDate1" runat="server" Text="Scale: Upper" Font-Names="Arial" Font-Size="Small"></asp:Label>

                    

                                <asp:TextBox ID="tbxChtSU" runat="server" AutoPostBack="True" EnableViewState="False" TextMode="Number" ViewStateMode="Disabled" Visible="True" Width="40px" Wrap="False"></asp:TextBox>
                         
                                 &nbsp;<asp:Label ID="lblDate2" runat="server" Text="Lower" Font-Names="Arial" Font-Size="Small"></asp:Label>
                                 &nbsp;<asp:TextBox ID="tbxChtSL" runat="server" AutoPostBack="True" EnableViewState="False" TextMode="Number" ViewStateMode="Disabled" Visible="True" Width="40px" Wrap="False"></asp:TextBox>
                         
                                 &nbsp;&nbsp;

                     </td>
                     <td nowrap style="border: 1px solid #0000FF; vertical-align: middle; text-align: center;">
                            
                             <asp:Panel ID="plDate" runat="server">

                                 <table cellspacing="1">
                                     <tr>
                                         <td>
                                             <asp:Label ID="lblDate" runat="server" Font-Names="Arial" Font-Size="Small" Text="Date:"></asp:Label>
                                         </td>
                                         <td>
                                             <asp:TextBox ID="tbxDate" runat="server" AutoPostBack="True" BorderStyle="Inset" TextMode="Date" ToolTip="Alarm date " Width="80px"></asp:TextBox>
                                             <asp:CalendarExtender ID="Cal1" runat="server" PopupButtonID="Image1" TargetControlID="tbxDate">
                                             </asp:CalendarExtender>
                                         </td>
                                         <td nowrap class="auto-style10" style="text-align: left">
                                             <asp:ImageButton ID="Image1" runat="Server" AlternateText="Click here to display calendar" ImageUrl="~/Images/Calendar_scheduleHS.png" />
                                             &nbsp;
                                         </td>
                                         <td nowrap style="vertical-align: middle; text-align: right;" class="auto-style9">
                                             <asp:Label ID="lblShift" runat="server" Text="Shift:"></asp:Label>
                                             &nbsp;</td>
                                         <td>
                                             <asp:RadioButtonList ID="rblShift" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                                                 <asp:ListItem Selected="True" Value="1"></asp:ListItem>
                                                 <asp:ListItem Value="2"></asp:ListItem>
                                                 <asp:ListItem Value="3"></asp:ListItem>
                                                 <asp:ListItem Value="4">All</asp:ListItem>
                                             </asp:RadioButtonList>
                                         </td>
                                     </tr>
                                 </table>
                             </asp:Panel>

                     </td>
                     <td>&nbsp; &nbsp;

                     </td>
                 </tr>
             </table>
            

         </td>
       </tr>
       <tr>
         <td style="text-align: center" >
                            &nbsp;</td>
       </tr>
       <tr>
         <td>
                            <asp:Chart ID="chtData" runat="server" BorderlineColor="Black" BorderlineDashStyle="Solid" BorderlineWidth="3" Width="900px" Height="500px"  ViewStateMode="Disabled">
                                <Series>
                                <asp:Series BorderWidth="1" ChartType="Line" Color="Black" Name="Series1" IsXValueIndexed="True" PostBackValue="#VALX{MM/dd/yyyy H:mm:ss}, #INDEX" ToolTip="#VALX" MarkerBorderWidth="2" MarkerColor="255, 128, 0" MarkerSize="10" MarkerBorderColor="Maroon"  >
                                </asp:Series>
                                <asp:Series BorderWidth="2" ChartType="Line" Color="Red" Name="Series2" IsXValueIndexed="True" >
                                </asp:Series>
                                <asp:Series BorderWidth="2" ChartType="Line" Color="Red" Name="Series3"  IsXValueIndexed="True" >
                                </asp:Series>
                                    <asp:Series ChartArea="ChartArea1" ChartType="Line" Enabled="False" Name="Series4">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1" BackGradientStyle="None" BackColor="Transparent">
                                      <AxisY IsStartedFromZero="False">
                                        <MajorGrid Interval="Auto" LineColor="Gray" />
                                        <MajorTickMark Interval="Auto" LineColor="Gray" />
                                        <LabelStyle Interval="Auto" />
                                      </AxisY>
                                      <AxisX>
                                        <MajorGrid Interval="Auto" IntervalType="Auto" LineColor="Gray" />
                                        <MajorTickMark Interval="Auto" IntervalType="Auto" LineColor="Gray" />
                                        <LabelStyle Interval="Auto" IntervalType="Auto" Format="MM/dd/yyyy H:mm:ss" />
                                      </AxisX>
                                      <Position Height="86.5" Width="94" X="3" Y="10" />
                                    </asp:ChartArea>
                                </ChartAreas>
                                <Titles>
                                  <asp:Title Name="Title1" Text="Quality chart" Font="Arial, 12pt">
                                  </asp:Title>
                                </Titles>
                            </asp:Chart>
                            <asp:SqlDataSource ID="SqlIHT45" runat="server" ConnectionString="<%$ ConnectionStrings:IHT45ConnectionString %>" SelectCommand="SELECT * FROM [AlarmLog4]" >
                            </asp:SqlDataSource>
                            <br />
             </td>
       </tr>
        <tr>
         <td >
                            <asp:Panel ID="plPartInfo" runat="server" Visible="False">
                                <table cellpadding="2">
                                    <tr>
                                        <td>
                                            <table cellpadding="2" class="auto-style8">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Font-Names="Arial" Text="Date:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblPD" runat="server" BackColor="White" BorderColor="Black" BorderWidth="1px" Font-Names="Arial" Text="Date:" Width="100px" CssClass="lblAllign"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label4" runat="server" Font-Names="Arial" Text="Value:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblPV" runat="server" BackColor="White" BorderColor="Black" BorderWidth="1px" Font-Names="Arial" Text="0" Width="50px" CssClass="lblAllign"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label5" runat="server" Font-Names="Arial" Text="Hi limit:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblPH" runat="server" BackColor="White" BorderColor="Black" BorderWidth="1px" Font-Names="Arial" Text="0" Width="50px" CssClass="lblAllign"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label6" runat="server" Font-Names="Arial" Text="Low limit:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblPL" runat="server" BackColor="White" BorderColor="Black" BorderWidth="1px" Font-Names="Arial" Text="0" Width="50px" CssClass="lblAllign"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <table cellpadding="0" cellspacing="0" class="auto-style3">
                                                <tr>
                                                    <td style="text-align: center">
                                                        <asp:Button ID="btnL" runat="server" Text="&lt;" />
                                                    </td>
                                                    <td style="text-align: center">
                                                        <asp:Button ID="btnR" runat="server" Text="&gt;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Button ID="btnInfo" runat="server" Text="Info" Width="60px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
            </td>
       </tr>
   </table>

    <br />


</asp:Content>


