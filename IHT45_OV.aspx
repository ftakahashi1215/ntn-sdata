<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/sdata.Master" CodeBehind="IHT45_OV.aspx.vb" Inherits="NTN.IHT45_OV" %>
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
            height: 38px;
        }
        .lblText {
            text-align: center;
            margin-bottom: 0px;
        }
        .auto-style6 {
            height: 22px;
        }
        .auto-style12 {
            height: 203px;
        }
        .auto-style13 {
            height: 20px;
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
                <asp:Button ID="btnTR" runat="server" Text="Trends" CssClass="auto-style4" />
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
                <asp:DropDownList ID="ddlLineNo" runat="server" Height="25px" style="margin-left: 0px" AutoPostBack="True">
                    <asp:ListItem Selected="True" Value="4">Line 4</asp:ListItem>
                    <asp:ListItem Value="5">Line 5</asp:ListItem>
                </asp:DropDownList>
             </td>
             <td style="text-align: right">
                 &nbsp;&nbsp;
                 &nbsp;<asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="auto-style4" />
             </td>
        </tr>
    </table>

 <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="False" EnableViewState="False" ViewStateMode="Disabled">
                        <Triggers>
                          <asp:AsyncPostBackTrigger ControlID="tmr1" EventName="Tick" />
                        </Triggers>
                <ContentTemplate>

    <table cellpadding="0" cellspacing="0" class="auto-style3">
       <tr>
         <td style="text-align: center">
                                <asp:Label ID="lblErrMsg" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" Text="Error message" Visible="False" ForeColor="Red"></asp:Label>
                            </td>
       </tr>
       <tr>
         <td class="auto-style5">
            <table width="100%" border="0" cellpadding="0">
                <tr>
                    <td width="75px" nowrap>
                        &nbsp;</td>
                    <td width="60px">
                        &nbsp;</td>
                    <td  width="160px" style="text-align: right" nowrap>
                        &nbsp;</td>
                    <td width="65px" nowrap>
                        &nbsp;</td>
                    <td width="200px" style="text-align: right" nowrap>
                        &nbsp;</td>
                    <td>
                                            &nbsp;&nbsp;
                        </td>           
                    <td >
                    </td>
                </tr>
            
            </table>
             &nbsp;</td>
       </tr>
       <tr>
         <td>&nbsp;</td>
       </tr>
    </table>


        <table width = 100%>
        <tr>
        <td style="vertical-align: top">
          <table >
             <tr>
                    <td colspan="5" class='subtitle1'>
                    HARDENING&nbsp;
                    </td>
                </tr>
             <tr>
                    <td colspan="5">
                        <asp:Label ID="lblCTstart_H" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="Hardening time" Width="160px"></asp:Label>
                    </td>
             
            </tr>
              <tr>
                  <td></td>
                  <td id="Td1" runat="server">&nbsp;</td>
                  <td style="text-align: center">
                      <asp:Label ID="Label4" runat="server" Font-Size="X-Small" Text="Part ID"></asp:Label>
                  </td>
                  <td></td>
                  <td width="30%"></td>
              </tr>
             <tr>
                <td></td>
                <td nowrap> &nbsp;</td>
                        <td  style="text-align: center">
                                <asp:Label ID="lblHPartID" runat="server" Text="ID" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" Width="60px" CssClass="lblText" Enabled="False"></asp:Label>
                            </td><td>&nbsp;</td>
                        <td></td>
             </tr>
             <tr>
                    <td></td>
                    <td></td>
                    <td >&nbsp;</td>
                    <td>&nbsp;</td>
                    <td></td>
                </tr>
             <tr class="toprow">
                 <td></td>
                 <td nowrap>Low Limit</td>
                 <td>VAL</td>
                 <td nowrap>Hi Limit</td>
                 <td></td>
             <tr>
                 <td class="auto-style13"></td>
                 <td class="auto-style13"></td>
                 <td class="auto-style13"></td>
                 <td class="auto-style13"></td>
                 <td class="auto-style13"></td>
              <tr>
                  <td>
                      <asp:Label ID="lblH1a" runat="server" Text="Energy:"></asp:Label>
                  </td>
                  <td>
                      <asp:Label ID="lblH6" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                  </td>
                  <td cssclass="NGdata">
                      <asp:Label ID="lblH4" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                  </td>
                  <td>
                      <asp:Label ID="lblH5" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                  </td>
                  <td>
                      <asp:Label ID="lblH1b" runat="server" Text="kW*sec"></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td nowrap class="auto-style6">
                      <asp:Label ID="lblH4a" runat="server" Text="ID flow:"></asp:Label>
                  </td>
                  <td class="auto-style6">
                      <asp:Label ID="lblH9" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                  </td>
                  <td cssclass="NGdata" class="auto-style6">
                      <asp:Label ID="lblH7" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                  </td>
                  <td class="auto-style6">
                      <asp:Label ID="lblH8" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                  </td>
                  <td class="auto-style6">
                      <asp:Label ID="lbl4b" runat="server" Text="Ltr/min"></asp:Label>
                  </td>
              </tr>
                 <tr>
                     <td nowrap>
                         <asp:Label ID="lblH8a" runat="server" Text="OD flow:"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lblH12" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                     </td>
                     <td cssclass="NGdata">
                         <asp:Label ID="lblH10" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lblH11" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lblH8b" runat="server" Text="Ltr/min"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td nowrap>
                         <asp:Label ID="lblH3a" runat="server" Text="ID press:"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lblH15" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                     </td>
                     <td cssclass="NGdata">
                         <asp:Label ID="lblH13" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lblH14" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lblH3b" runat="server" Text="PSI"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td class="auto-style6" nowrap>
                         <asp:Label ID="lblH5a" runat="server" Text="OD pres:"></asp:Label>
                     </td>
                     <td class="auto-style6">
                         <asp:Label ID="lblH18" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                     </td>
                     <td class="auto-style6" cssclass="NGdata">
                         <asp:Label ID="lblH16" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                     </td>
                     <td class="auto-style6">
                         <asp:Label ID="lblH17" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                     </td>
                     <td class="auto-style6">
                         <asp:Label ID="lblH5b" runat="server" Text="PSI"></asp:Label>
                     </td>
                 </tr>
              <tr>
                  <td>
                      <asp:Label ID="lblH10a" runat="server" Text="Temperature:"></asp:Label>
                  </td>
                  <td>
                      <asp:Label ID="lblH21" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                  </td>
                  <td cssclass="NGdata">
                      <asp:Label ID="lblH19" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                  </td>
                  <td>
                      <asp:Label ID="lblH20" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                  </td>
                  <td>
                      <asp:Label ID="lblH10b" runat="server" Text="F"></asp:Label>
                  </td>
              </tr>
                 <tr>
                     <td nowrap>
                         <asp:Label ID="lblH9a" runat="server" Text="Quench 2nd flow:"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lblH24" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                     </td>
                     <td cssclass="NGdata">
                         <asp:Label ID="lblH22" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lblH23" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                     </td>
                     <td>
                         <asp:Label ID="lblH9b" runat="server" Text="Ltr/min"></asp:Label>
                     </td>
                 </tr>
                 <tr>
                     <td nowrap>
                         <asp:Label ID="lblH6a" runat="server" Text="Heat time:"></asp:Label>
                     </td>
                     <td>&nbsp;</td>
                     <td cssclass="NGdata">
                         <asp:Label ID="lblH26" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                     </td>
                     <td>&nbsp;</td>
                     <td>
                         <asp:Label ID="lblH6b" runat="server" Text="sec"></asp:Label>
                     </td>
                 </tr>
              <tr>
                  <td nowrap class="auto-style13">
                  </td>
                  <td class="auto-style13"></td>
                  <td cssclass="NGdata" class="auto-style13">
                  </td>
                  <td class="auto-style13"></td>
                  <td class="auto-style13">
                  </td>
              </tr>
              <tr>
                  <td nowrap>Hard part Status</td>
                  <td>&nbsp;</td>
                  <td cssclass="NGdata">
                      <asp:Label ID="lblH25" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                  </td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td nowrap>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td cssclass="NGdata">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
              <tr>
                  <td nowrap>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td cssclass="NGdata">&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
              </tr>
          </table>
         </td>
         
         <td valign = "top">
           <table>
               <tr>
                   <td colspan="5" class='subtitle1'>
                      TEMPERING
                    </td>
               </tr>
               <tr>
                  <td colspan="4">

                      <asp:Label ID="lblCTstart_T" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="Temper time" Width="160px"></asp:Label>

                  </td>
               </tr>
               <tr>
                   <td></td>
                   <td nowrap style="text-align: center">&nbsp;</td>
                   <td nowrap style="text-align: center">
                       <asp:Label ID="Label6" runat="server" Font-Size="X-Small" Text="Part ID"></asp:Label>
                   </td>
                   <td nowrap style="text-align: center">&nbsp;</td>
               </tr>
               <tr>
                   <td>

                   </td>
                   <td nowrap style="text-align: center"> 
                        &nbsp;</td>
                    <td  style="text-align: center">
                        <asp:Label ID="lblTPartID" runat="server" Text="ID" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" Width="60px" CssClass="lblText"></asp:Label>
                    </td><td style="text-align: center">
                        &nbsp;</td><td></td></tr>
              <tr><td>
                  &nbsp;</td><td>
                      &nbsp;</td><td CssClass="NGdata">
                      &nbsp;</td><td>
                      &nbsp;</td><td>
                  </td>
              </tr>
              <tr class="toprow"><td></td><td nowrap>Low Limit</td><td>VAL</td><td nowrap>Hi Limit</td><td></td></tr>
              <tr><td></td><td>
                  </td><td CssClass="NGdata"></td><td>&nbsp;</td><td>
                  </td>
              </tr>
              <tr><td>
                        <asp:Label ID="Label15" runat="server" Text="Current:"></asp:Label>
                    </td><td>
                        <asp:Label ID="lblT6" runat="server" Text="ID" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" Width="60px" CssClass="lblText"></asp:Label>
                    </td><td CssClass="NGdata">
                        <asp:Label ID="lblT4" runat="server" Text="ID" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" Width="60px" CssClass="lblText"></asp:Label>
                    </td><td>
                        <asp:Label ID="lblT5" runat="server" Text="ID" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" Width="60px" CssClass="lblText"></asp:Label>
                    </td><td>
                        <asp:Label ID="Label26" runat="server" Text="Amp"></asp:Label>
                    </td>
              </tr>
              <tr><td>
                        <asp:Label ID="Label16" runat="server" Text="Part Temperature:"></asp:Label>
                    </td><td>
                        <asp:Label ID="lblT9" runat="server" Text="ID" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" Width="60px" CssClass="lblText"></asp:Label>
                 </td><td CssClass="NGdata">
                        <asp:Label ID="lblT7" runat="server" Text="ID" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" Width="60px" CssClass="lblText"></asp:Label>
                    </td><td>
                        <asp:Label ID="lblT8" runat="server" Text="ID" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" ForeColor="Black" Width="60px" CssClass="lblText"></asp:Label>
                    </td><td>
                        <asp:Label ID="Label27" runat="server" Text="F"></asp:Label>
                    </td>
              </tr>
              <tr><td>
                        &nbsp;</td><td>
                        &nbsp;</td><td CssClass="NGdata">
                        &nbsp;</td><td>
                        &nbsp;</td><td>
                        &nbsp;</td>
              </tr>
              <tr><td>
                        Temper part status</td><td>
                 </td><td CssClass="NGdata">
                        <asp:Label ID="lblT10" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CssClass="lblText" ForeColor="Black" Text="ID" Width="60px"></asp:Label>
                  </td><td>&nbsp;</td><td>
                        &nbsp;</td>
              </tr>
              <tr><td class="auto-style13">
                        </td><td class="auto-style13">
                 </td><td CssClass="NGdata" class="auto-style13">
                        </td><td class="auto-style13">
                        </td><td class="auto-style13">
                        </tr>
              <tr><td>
                        &nbsp;</td><td>
                        &nbsp;</td><td CssClass="NGdata">
                        &nbsp;</td><td>
                        &nbsp;</td><td>
                        &nbsp;</tr>
              <tr><td nowrap>
                        &nbsp;</td><td>
                        &nbsp;</td><td CssClass="NGdata">&nbsp;</td><td>&nbsp;</td><td>
                  &nbsp;</td>
              </tr>
              <tr><td nowrap>
                  &nbsp;</td><td>
                        &nbsp;</td><td CssClass="NGdata">&nbsp;</td><td>&nbsp;</td><td>
                  &nbsp;</td>
              </tr>
              <tr><td nowrap>
                        &nbsp;</td><td>
                        &nbsp;</td><td CssClass="NGdata">
                        &nbsp;</td><td>
                        &nbsp;</td><td>
                      &nbsp;</td>
              </tr>
              <tr ><td colspan = "5" height="50px" ></td></tr>
              <tr><td colspan="1"></td><td colspan = "4">
                  </td>
              </tr>
            </table>
         </td>
        </tr>
      </table>
             
    <table>
        <tr>
            <td width="400px" class="auto-style12">
                &nbsp;</td>
            <td class="auto-style12">
                </td>
            <td align="center" class="auto-style12">
            </td>
            <td valign="middle" class="auto-style12">
                </td>
            <td class="auto-style12" >
                &nbsp;
            </td>
            <td class="auto-style12">
                </td>
            <td width="40%" class="auto-style12">
            </td>
        </tr>
    </table>

  </ContentTemplate>
</asp:UpdatePanel>
    <asp:Timer ID="tmr1" runat="server" Interval="15000"></asp:Timer>
</asp:Content>

