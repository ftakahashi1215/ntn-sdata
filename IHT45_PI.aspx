<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sdata.Master" CodeBehind="IHT45_PI.aspx.vb" Inherits="NTN.IHT45_PI" %>
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
            width: 878px;
        }
        .auto-style8 {
            font-weight: bold; /* font-style: italic; */;
            text-align: center;
            background-color: #FFFFCC;
            width: 44px;
        }
        .auto-style30 {
            width: 44px;
        }
        .auto-style39 {
            text-align: center;
            font-weight: bold;
            font-size: 18px;
            padding: 3px;
            background-color: #FFCC66;
            width: 876px;
            height: 27px;
        }
        .auto-style40 {
            width: 876px;
        }
        .auto-style46 {
            width: 958px;
        }
        .auto-style48 {
            height: 27px;
        }
        .auto-style50 {
            width: 105%;
        }
        .auto-style54 {
            width: 876px;
            height: 130px;
        }
        .auto-style59 {
            height: 21px;
        }
        .auto-style60 {
            font-weight: bold; /* font-style: italic; */;
            text-align: center;
            background-color: #FFFFCC;
            width: 148px;
            height: 24px;
        }
        .auto-style61 {
            width: 148px;
        }
        .auto-style63 {
            width: 149px;
        }
        .auto-style67 {
            text-align: center;
            font-weight: bold;
            font-size: 18px;
            padding: 3px;
            background-color: #FFCC66;
            width: 876px;
            height: 25px;
        }
        .auto-style68 {
            width: 149px;
            height: 21px;
        }
        .auto-style72 {
            width: 876px;
            border: 2px solid #000000;
            background-color: #FFFFFF;
        }
        .auto-style75 {
            font-weight: bold; /* font-style: italic; */;
            text-align: center;
            background-color: #FFFFCC;
            width: 149px;
            height: 24px;
        }
        .auto-style89 {
            font-weight: bold; /* font-style: italic; */;
            text-align: center;
            background-color: #FFFFCC;
            width: 45px;
        }
        .auto-style90 {
            width: 45px;
        }
        .auto-style91 {
            width: 44px;
            height: 21px;
        }
        .auto-style92 {
            width: 45px;
            height: 21px;
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
                <asp:Button ID="btnAL" runat="server" Text="Alarms" CssClass="auto-style4" />
             </td>
             <td class="auto-style4">
                <asp:Button ID="btnRE" runat="server" Text="Recipe" CssClass="auto-style4" />
             </td>
             <td class="auto-style4">
                 &nbsp;</td>
             <td class="auto-style4">
                 &nbsp;</td>
             <td style="text-align: right"><asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="auto-style4" />
             </td>
        </tr>
    </table>

    <table cellpadding="0" cellspacing="0" class="auto-style3">
       <tr>
         <td style="text-align: center" class="auto-style46">
             <asp:Label ID="lblErrMsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" Text="Error message" ForeColor="Red"></asp:Label>
           </td>
       </tr>
       <tr>
         <td style="text-align: center" class="auto-style46">
             <table cellpadding="2" class="auto-style50">
                 <tr>
                     <td nowrap class="auto-style48">
                         &nbsp;</td>
                 </tr>
                 </table>
           </td>
       </tr>
       <tr>
         <td style="text-align: center" class="auto-style46">
             <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" Width="108%">
                 <table align="center" cellpadding="0" cellspacing="0" class="auto-style5">
                     <tr>
                         <td class='auto-style39' style="text-align: center" colspan="2">
                             <asp:Label ID="LBLHARDENDATA" runat="server" Text="Hardening Process data "></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style40" style="text-align: center">
                             <asp:Label ID="lblDate" runat="server" Font-Names="Arial" Font-Size="Small" Text="Date:"></asp:Label>
                             <asp:TextBox ID="tbxDateH" runat="server" AutoPostBack="True" BorderStyle="Inset" TextMode="Date" ToolTip="Alarm date " Width="80px"></asp:TextBox>
                             <asp:CalendarExtender ID="tbxDateH_CalendarExtender" runat="server" PopupButtonID="Image1" TargetControlID="tbxDateH"> </asp:CalendarExtender>
                         <asp:ImageButton ID="Image1" runat="Server" AlternateText="Click here to display calendar" ImageUrl="~/Images/Calendar_scheduleHS.png" />
                         </td>
                         <td class="auto-style40" style="text-align: center">
                             <asp:DropDownList ID="ddlDataListH" runat="server" AutoPostBack="True" DataSourceID="SqlHardenPartInfo" DataTextField="Start_DT" DataValueField="Start_DT">
                             </asp:DropDownList>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style54" colspan="2">
                             <table cellpadding="2" class="auto-style72">
                                 <tr>
                                     <td class="auto-style8" style="border: 1px solid #000000">Energy</td>
                                     <td class="auto-style8" style="border: 1px solid #000000">U/L</td>
                                     <td class="auto-style8" style="border: 1px solid #000000">Q. Flow ID</td>
                                     <td class="auto-style89" style="border: 1px solid #000000">U/L</td>
                                     <td class="auto-style89" style="border: 1px solid #000000">Q. Flow OD</td>
                                     <td class="auto-style89" style="border: 1px solid #000000">U/L</td>
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     <td class="auto-style89" style="border: 1px solid #000000">Q. Press ID</td>
                                     <td class="auto-style89" style="border: 1px solid #000000">U/L</td>
                                     <td class="toprow" style="border: 1px solid #000000">Q. Press OD</td>
                                     <td class="auto-style89" style="border: 1px solid #000000">U/L</td>
                                     <td class="auto-style89" style="border: 1px solid #000000">Q. Temper.</td>
                                     <td class="auto-style89" style="border: 1px solid #000000">U/L</td>
                                     <td class="auto-style89" style="border: 1px solid #000000">Q. 2nd Flow</td>
                                     
                                     <td class="auto-style89" style="border: 1px solid #000000">U/L</td>
                                     
                                     <td class="auto-style89" style="border: 1px solid #000000">Part OK</td>
                                     <td class="auto-style89" style="border: 1px solid #000000">Heat time</td>
                                     
                                     
                                     <td class="auto-style89" style="border: 1px solid #000000">Start time</td>
                                     
                                     <td class="auto-style89" style="border: 1px solid #000000">End time</td>
                                     
                                 </tr>
                                 <tr>
                                     <td rowspan="2" style="border: 1px solid #000000; text-align: center;" class="auto-style30">
                                         <asp:Label ID="lblH4" runat="server" Text="0"></asp:Label>
                                     </td>
                                     <td style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;" class="auto-style30">
                                         <asp:Label ID="lblH5" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                     </td>
                                     <td rowspan="2" style="border: 1px solid #000000; text-align: center;" class="auto-style30">
                                         <asp:Label ID="lblH7" runat="server" Text="0"></asp:Label>
                                     </td>
                                     <td style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;" class="auto-style90">
                                         <asp:Label ID="lblH8" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                     </td>
                                     <td rowspan="2" style="border: 1px solid #000000; text-align: center;" class="auto-style90">
                                         <asp:Label ID="lblH10" runat="server" Text="0"></asp:Label>
                                     </td>
                                     <td style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;" class="auto-style90">
                                         <asp:Label ID="lblH11" runat="server" Text="0" Font-Size="X-Small"></asp:Label>
                                     </td>
                                     
                                     
                                     <td class="auto-style90" rowspan="2" style="border: 1px solid #000000; text-align: center;">
                                         <asp:Label ID="lblH13" runat="server" Text="0"></asp:Label>
                                     </td>
                                     <td style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;" class="auto-style90">
                                         <asp:Label ID="lblH14" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                     </td>
                                     <td class="auto-style90" rowspan="2" style="border: 1px solid #000000; text-align: center;">
                                         <asp:Label ID="lblH16" runat="server" Text="0"></asp:Label>
                                     </td>
                                     <td style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;">
                                         <asp:Label ID="lblH17" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                     </td>
                                     <td class="auto-style90" rowspan="2" style="border: 1px solid #000000; text-align: center;">
                                         <asp:Label ID="lblH19" runat="server" Text="0"></asp:Label>
                                     </td>
                                     <td style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;">
                                         <asp:Label ID="lblH20" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                     </td>
                                     <td rowspan="2" style="border: 1px solid #000000; text-align: center;" class="auto-style90">
                                         <asp:Label ID="lblH22" runat="server" Text="0"></asp:Label>
                                     </td>
                                     <td style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;" class="auto-style90">
                                         <asp:Label ID="lblH23" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                     </td>
                                     <td rowspan="2" style="border: 1px solid #000000; text-align: center;" class="auto-style90">
                                         <asp:Label ID="lblH25" runat="server" Text="0"></asp:Label>
                                     </td>
                                     
                                     
                                     <td class="auto-style90" rowspan="2" style="border: 1px solid #000000; text-align: center;">
                                         <asp:Label ID="lblH26" runat="server" Text="0"></asp:Label>
                                     </td>
                                     
                                     
                                     <td class="auto-style90" rowspan="2" style="border: 1px solid #000000; text-align: center;">
                                         <asp:Label ID="lblH27" runat="server" Text="0"></asp:Label>
                                     </td>
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     <td class="auto-style90" rowspan="2" style="border: 1px solid #000000; text-align: center;">
                                         <asp:Label ID="lblH28" runat="server" Text="0"></asp:Label>
                                     </td>
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                     
                                 </tr>
                                 <tr>
                                     <td style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;" class="auto-style91">
                                         <asp:Label ID="lblH6" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                     </td>
                                     <td style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;" class="auto-style92">
                                         <asp:Label ID="lblH9" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                     </td>
                                     <td style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;" class="auto-style92">
                                         <asp:Label ID="lblH12" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                     </td>
                                     <td style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;" class="auto-style92">
                                         <asp:Label ID="lblH15" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                     </td>
                                     <td style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;" class="auto-style59">
                                         <asp:Label ID="lblH18" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                     </td>
                                     <td style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;" class="auto-style59">
                                         <asp:Label ID="lblH21" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                     </td>
                                     <td style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;" class="auto-style59">
                                         <asp:Label ID="lblH24" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                     </td>
                                     
                                     
                                     
                                     
                                     
                                 </tr>
                             </table>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style40" colspan="2">&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="auto-style40" colspan="2">
                             <table align="center" cellpadding="0" cellspacing="0" class="auto-style5">
                                 <tr>
                                     <td class="auto-style67" style="text-align: center" colspan="2">
                                         <asp:Label ID="LBLTEMPERDATA" runat="server" Text="Temper Process data "></asp:Label>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="auto-style40" style="text-align: center">
                                         <asp:Label ID="lblDate1" runat="server" Font-Names="Arial" Font-Size="Small" Text="Date:"></asp:Label>
                                         <asp:TextBox ID="tbxDateT" runat="server" AutoPostBack="True" BorderStyle="Inset" TextMode="Date" ToolTip="Alarm date " Width="80px"></asp:TextBox>
                                         <asp:CalendarExtender ID="tbxDateT_CalendarExtender" runat="server" PopupButtonID="Image2" TargetControlID="tbxDateT">
                                         </asp:CalendarExtender>
                                         <asp:ImageButton ID="Image2" runat="Server" AlternateText="Click here to display calendar" ImageUrl="~/Images/Calendar_scheduleHS.png" />
                                     </td>
                                     <td class="auto-style40" style="text-align: center">
                                         <asp:DropDownList ID="ddlDataListT" runat="server" AutoPostBack="True" DataSourceID="SqlTemperPartInfo" DataTextField="Time_Stamp" DataValueField="Time_Stamp">
                                         </asp:DropDownList>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="auto-style54" colspan="2">
                                         <table cellpadding="2" class="auto-style72">
                                             <tr>
                                                 <td class="auto-style75" style="border: 1px solid #000000">Current</td>
                                                 <td class="auto-style75" style="border: 1px solid #000000">U/L</td>
                                                 <td class="auto-style75" style="border: 1px solid #000000">Part Temperature</td>
                                                 <td class="auto-style75" style="border: 1px solid #000000">U/L</td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style63" rowspan="2" style="border: 1px solid #000000; text-align: center;">
                                                     <asp:Label ID="lblT4" runat="server" Text="0"></asp:Label>
                                                 </td>
                                                 <td class="auto-style63" style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;">
                                                     <asp:Label ID="lblT5" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                                 </td>
                                                 <td class="auto-style63" rowspan="2" style="border: 1px solid #000000; text-align: center;">
                                                     <asp:Label ID="lblT7" runat="server" Text="0"></asp:Label>
                                                 </td>
                                                 <td class="auto-style63" style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;">
                                                     <asp:Label ID="lblT8" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td class="auto-style68" style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;">
                                                     <asp:Label ID="lblT6" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                                 </td>
                                                 <td class="auto-style68" style="border: 1px solid #000000; background-color: #CCCCCC; text-align: center;">
                                                     <asp:Label ID="lblT9" runat="server" Font-Size="X-Small" Text="0"></asp:Label>
                                                 </td>
                                             </tr>
                                         </table>
                                     </td>
                                 </tr>
                             </table>
                         </td>
                     </tr>
                 </table>
             </asp:Panel>
             
           </td>
       </tr>
       <tr>
         <td class="auto-style46">
             <asp:SqlDataSource ID="SqlHardenPartInfo" runat="server" ConnectionString="<%$ ConnectionStrings:IHT45ConnectionString %>" SelectCommand="SELECT * FROM [AlarmLog4]"></asp:SqlDataSource>
             <asp:SqlDataSource ID="SqlTemperPartInfo" runat="server" ConnectionString="<%$ ConnectionStrings:IHT45ConnectionString %>" SelectCommand="SELECT * FROM [AlarmLog4]"></asp:SqlDataSource>
           </td>
       </tr>
    </table>

    <br />
    </asp:Content>

