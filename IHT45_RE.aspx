<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sdata.Master" CodeBehind="IHT45_RE.aspx.vb" Inherits="NTN.IHT45_RE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PageTitle" runat="server">
    <title>Current Recipies</title>
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE"/>
    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 85px;
            height: 25px;
        }
        .auto-style6 {
            width: 50px;
        }
        .HardTtl {
            width: 200px;
            white-space: nowrap;
        }
         .TemTtl {
            width: 200px;
            white-space: nowrap;
        }
        .tbxStyle1 {
            text-align: center;
        }
        .auto-style7 {
            width: 200px;
            white-space: nowrap;
            height: 26px;
        }
        .auto-style8 {
            height: 26px;
        }
   </style>
    <link href="../../../../Assets/CSS/IHTrecipe.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
      <table cellpadding="0" cellspacing="0" class="auto-style3">
          <tr>
              <td style="text-align: center">
            <asp:Label ID="lblLine" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="XX-Large" Text="IH Current Recipe"></asp:Label>
              </td>
          </tr>
    </table>
      <table cellpadding="0" cellspacing="0" class="auto-style3" >
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
                <asp:Button ID="btnAL" runat="server" Text="Alarms" CssClass="auto-style4" />
             </td>
             <td class="auto-style4">
                 &nbsp;</td>
             <td class="auto-style4">
             </td>
             <td style="text-align: right">
                 <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="auto-style4" />
             </td>
        </tr>
    </table>

    <table cellpadding="0" cellspacing="0" class="auto-style3">
       <tr>
         <td>&nbsp;</td>
       </tr>
    </table>

        <table width="100%" border="0" cellpadding="0">
            <tr>
                <td nowrap style="width: 90px">
                    <asp:Label ID="lblPartNumber" runat="server" Text="Part Number:"></asp:Label>
                </td>
                <td style="width: 80px">
                    <asp:TextBox ID="txtPart_Nr" runat="server" BorderStyle="Inset" ReadOnly="True"
                        ToolTip="Part Number" Wrap="False" CssClass="tbxStyle1" Width="50px"></asp:TextBox>
                </td>
                <td nowrap style="width: 70px">
                    <asp:Label ID="lblPart_Type" runat="server" Text="Part Type:"></asp:Label>
                </td>
                <td style="width: 80px">
                    <asp:TextBox ID="txtPart_Type" runat="server" BorderStyle="Inset" ReadOnly="True"
                        ToolTip="Part Type" CssClass="tbxStyle1" Width="50px"></asp:TextBox>
                </td>
                <td nowrap style="width: 140px">
                    <asp:Label ID="lblDate" runat="server" Text="Current recipe date:"></asp:Label>
                </td>
                <td style="width: 180px">
                    <asp:TextBox ID="txtRecipeDate" runat="server" BorderStyle="Inset" ReadOnly="True"
                        ToolTip="Recipe date"></asp:TextBox>
                </td>
                <td nowrap style="width: 90px">
                    <asp:CheckBox ID="chbHist" runat="server" Text="Historical" AutoPostBack="True" />
                </td>
                <td nowrap style="width: 180px">
                    <asp:TextBox ID="tbxRecipeDate" runat="server" BorderStyle="Inset"
                        ToolTip="Historical recipe date " TextMode="Date" Visible="False" AutoPostBack="True"></asp:TextBox>
                        <asp:ImageButton runat="Server" ID="Image1" ImageUrl="~/Images/Calendar_scheduleHS.png" AlternateText="Click here to display calendar" Visible="False" />
                          <asp:CalendarExtender ID="Calendar1" runat="server" TargetControlID="tbxRecipeDate" PopupButtonID="Image1"></asp:CalendarExtender>
                </td>
                <td>
                    <asp:DropDownList ID="ddlRecipeDates" runat="server" DataSourceID="SqlIHTRecipe" DataTextField="Start_DT" DataValueField="ID" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="9">
                    <asp:Label runat="server" ID="lblMessage" Font-Names="Arial" ForeColor="Red">Message</asp:Label>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                </td>
                <td colspan="2">
                    &nbsp;
                </td>
                <td width="200">
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <table width="100%">
            <tr>
                <td valign="top">
                    <table id="tblHarden" runat="server" width="100%">
                        <colgroup>
                            <col id="col1" nowrap="nowrap" />
                            <col id="col2" nowrap="nowrap" align="center" />
                            <col id="col3" nowrap="nowrap" />
                            <col id="col4" nowrap="nowrap" />
                            <col id="col5" nowrap="nowrap" />
                        </colgroup>
                        <tr>
                            <td  bgcolor="#CFFFF7" class="HardTtl">
                                <b>Harden Recipe</b></td>
                            <td width="20px">
                            </td>
                            <td width="50px">
                            </td>
                            <td >
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="HardTtl">
                                &nbsp;</td>
                            <td width="20px">
                    <asp:Label ID="lblDate0" runat="server" Text="Current:"></asp:Label>
                            </td>
                            <td width="50px">
                                &nbsp;</td>
                            <td >
                                <b>&nbsp;<asp:Label ID="lblDateS" runat="server" Text="Selected:" Font-Bold="False"></asp:Label>
                                </b></td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                Harden Power Level:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH1" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                %
                            </td>
                            <td >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH1" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                Harden Heat Time:
                            </td>
                            <td width="70px" >
                                <asp:TextBox CssClass="hardValue" ID="tbxH2" runat="server" ToolTip="Harden Heat Time"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px" >
                                sec
                            </td>
                            <td nowrap>
                                <asp:TextBox CssClass="hardValue" ID="tbxOH2" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                Harden OD Q. Delay:
                            </td>
                            <td width="50px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH3" runat="server" ToolTip="Harden ID Q. Delay"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                sec
                            </td>
                            <td nowrap>
                                <asp:TextBox CssClass="hardValue" ID="tbxOH3" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                Harden OD Q. Time:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH4" runat="server" ToolTip="Harden ID Q. Time"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                sec
                            </td>
                            <td nowrap>
                                <asp:TextBox CssClass="hardValue" ID="tbxOH4" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                Cycle time:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH5" runat="server" ToolTip="Harden OD Q. Time"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                sec
                            </td>
                            <td nowrap>
                                <asp:TextBox CssClass="hardValue" ID="tbxOH5" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                Energy High:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH6" runat="server" ToolTip="Harden OD Q. Time"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                kWts</td>
                            <td nowrap>
                                <asp:TextBox CssClass="hardValue" ID="tbxOH6" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                Energy Low:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH7" runat="server" ToolTip="ID Quench Flow High"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                kWts</td>
                            <td >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH7" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                ID Quench Flow High:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH8" runat="server" ToolTip="ID Quench Flow Low"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                lpm</td>
                            <td >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH8" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                ID Quench Flow Low:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH9" runat="server" ToolTip="OD Quench Flow High"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                lpm</td>
                            <td >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH9" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                ID Quench Pressure High:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH10" runat="server" ToolTip="OD Quench Flow Low"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                kgcm </td>
                            <td >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH10" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                ID Quench Pressure Low:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH11" runat="server" ToolTip="Quench pressure High"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                kgcm</td>
                            <td >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH11" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="auto-style7">
                                OD Quench Pressure High:
                            </td>
                            <td width="70px" class="auto-style8">
                                <asp:TextBox CssClass="hardValue" ID="tbxH12" runat="server" ToolTip="Quench pressure Low"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px" class="auto-style8">
                                kgcm </td>
                            <td class="auto-style8" >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH12" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="auto-style8">
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                OD Quench Pressure Low:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH13" runat="server" ToolTip="Harden Energy High"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                kgcm </td>
                            <td nowrap>
                                <asp:TextBox CssClass="hardValue" ID="tbxOH13" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                Index time limit: </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH14" runat="server" ToolTip="Harden Energy Low"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                sec</td>
                            <td >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH14" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                Quench time limit:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH15" runat="server" ToolTip="Quench temperature High"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                sec</td>
                            <td >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH15" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                Quench temperature High:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH16" runat="server" ToolTip="Quench temperature Low"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                °F</td>
                            <td >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH16" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="auto-style7">
                                Quench temperature SP:
                            </td>
                            <td width="70px" class="auto-style8">
                                <asp:TextBox CssClass="hardValue" ID="tbxH17" runat="server" ToolTip="Quench temperature Appr"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px" class="auto-style8">
                                °F</td>
                            <td class="auto-style8" >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH17" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="auto-style8">
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                Quench temperature Low: </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH18" runat="server" ToolTip="Quench temperature Appr"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                °F</td>
                            <td >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH18" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  >
                                Quench ID Delay: </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH19" runat="server" ToolTip="Quench temperature Appr"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                sec</td>
                            <td >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH19" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                Quench ID Time: </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH20" runat="server" ToolTip="Quench temperature Appr"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                sec</td>
                            <td>
                                <asp:TextBox CssClass="hardValue" ID="tbxOH20" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                Quench OD Flow High: </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH21" runat="server" ToolTip="Quench temperature Appr"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                lpm</td>
                            <td >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH21" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                Quench OD Flow Low: </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxH22" runat="server" ToolTip="Quench temperature Appr"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td width="50px">
                                lpm</td>
                            <td >
                                <asp:TextBox CssClass="hardValue" ID="tbxOH22" runat="server" ToolTip="Harden power level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td width="50px">
                                &nbsp;</td>
                            <td >
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td width="50px">
                                &nbsp;</td>
                            <td >
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td width="50px">
                                &nbsp;</td>
                            <td >
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td width="50px">
                                &nbsp;</td>
                            <td >
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td  class="HardTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td width="50px">
                                &nbsp;</td>
                            <td >
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                   </table>
                </td>
                <td valign="top">
                    <table id="tblTemper" width="100%" runat="server">
                        <colgroup>
                            <col id="col6" nowrap />
                            <col id="col7" nowrap />
                            <col id="col8" nowrap />
                            <col id="col9" nowrap />
                            <col id="col10" nowrap />
                        </colgroup>
                        <tr>
                            <td  bgcolor="#CFFFF7" class="TemTtl">
                                <b>Temper Recipe</b>
                            </td>
                            <td width="70px">
                            </td>
                            <td class="auto-style6">
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                &nbsp;</td>
                            <td width="70px">
                    <asp:Label ID="lblDate1" runat="server" Text="Current:"></asp:Label>
                            </td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td>
                                <b>
                    <asp:Label ID="lblDateST" runat="server" Text="Selected:" Font-Bold="False"></asp:Label>
                                </b></td>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                Temper Power Level:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxT1" runat="server" ToolTip="Temper Power Level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="auto-style6">
                                %
                            </td>
                            <td nowrap>
                                <asp:TextBox CssClass="hardValue" ID="tbxOT1" runat="server" ToolTip="Temper Power Level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                Temper Index Time:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxT2" runat="server" ToolTip="Temper Heat Time"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="auto-style6">
                                sec
                            </td>
                            <td nowrap>
                                <asp:TextBox CssClass="hardValue" ID="tbxOT2" runat="server" ToolTip="Temper Power Level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                Temper CV Index Time:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxT3" runat="server" ToolTip="Temper Soak Time"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="auto-style6">
                                sec
                            </td>
                            <td nowrap>
                                <asp:TextBox CssClass="hardValue" ID="tbxOT3" runat="server" ToolTip="Temper Power Level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                Temper Current High:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxT4" runat="server" ToolTip="Temper 1 part energy High"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="auto-style6">
                                Amp</td>
                            <td nowrap>
                                <asp:TextBox CssClass="hardValue" ID="tbxOT4" runat="server" ToolTip="Temper Power Level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                Temper Current Low:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxT5" runat="server" ToolTip="Temper 1 part energy Low"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="auto-style6">
                                Amp</td>
                            <td nowrap>
                                <asp:TextBox CssClass="hardValue" ID="tbxOT5" runat="server" ToolTip="Temper Power Level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                Part temperature High:
                            </td>
                            <td width="70px" >
                                <asp:TextBox CssClass="hardValue" ID="tbxT6" runat="server" ToolTip=" St6 part temperature High"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="auto-style6" >
                                °F</td>
                            <td nowrap >
                                <asp:TextBox CssClass="hardValue" ID="tbxOT6" runat="server" ToolTip="Temper Power Level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                Part temperature Low:
                            </td>
                            <td width="70px">
                                <asp:TextBox CssClass="hardValue" ID="tbxT7" runat="server" ToolTip="St6 part temperature Appr"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="auto-style6">
                                °F</td>
                            <td nowrap>
                                <asp:TextBox CssClass="hardValue" ID="tbxOT7" runat="server" ToolTip="Temper Power Level"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td nowrap>
                                &nbsp;</td>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td nowrap>
                                &nbsp;</td>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td nowrap>
                                &nbsp;</td>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td nowrap>
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td nowrap>
                                &nbsp;</td>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td class="auto-style6" >
                                &nbsp;</td>
                            <td nowrap>
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                &nbsp;</td>
                            <td width="70px" >
                                &nbsp;</td>
                            <td class="auto-style6" >
                                &nbsp;</td>
                            <td nowrap >
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td nowrap>
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td nowrap>
                                &nbsp;</td>
                            <td >
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td nowrap>
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td nowrap>
                                &nbsp;</td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="TemTtl">
                                &nbsp;</td>
                            <td width="70px">
                                &nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td >
                            </td>
                        </tr>
                       
                    </table>
                    <asp:SqlDataSource ID="SqlIHTRecipe" runat="server" ConnectionString="<%$ ConnectionStrings:IHT45ConnectionString %>" SelectCommand="SELECT * FROM [Recipe4T]" ></asp:SqlDataSource>
                </td>
            </tr>
        </table>

</asp:Content>

