Public Class IHT45_AL
    Inherits System.Web.UI.Page

    Private RepLine As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RepLine = Request.QueryString("Line")
        If RepLine = "" Or RepLine = Nothing Then
            RepLine = "4"
        End If
        If Not IsPostBack Then
            Dim newListItem As ListItem
            Dim myYear As Integer = Today.Year
            For i = myYear - 4 To myYear
                newListItem = New ListItem(i.ToString, i.ToString)
                ddlYear.Items.Add(newListItem)
                If i = myYear Then
                    newListItem.Selected = True
                End If
            Next
            Dim myMonth As Integer = Today.Month
            ddlMonth.Items.FindByValue(myMonth.ToString).Selected = True
            Dim myDate As Date = Today()
            tbxAlDate2.Text = Today.ToShortDateString
            tbxAlDate1.Text = (myDate.AddDays(-5)).ToShortDateString
        End If


        LineNoSet(RepLine)
        lblLine.Text = "IHT line " + RepLine + " Alarm list"

        If rblHistSelect.SelectedValue = 0 Then
            pl1.Visible = False
            pl2.Visible = True
            pl3.Visible = False
            lblDate2.Text = "Date:  "
            Dim DateSel1, DateSel2 As Date
            DateSel1 = tbxAlDate2.Text
            DateSel2 = DateSel1.AddDays(1)
            SqlIHT45Alarms.SelectCommand = "SELECT [LogTime], [AlmName] FROM [IH" + RepLine + "_AlarmLog_VW] WHERE ([LogTime] > '" + DateSel1.ToString + "' AND [LogTime] < '" + DateSel2.ToString + "') ORDER BY [LogTime] DESC"
            SqlIHT45Alarms.DataBind()
            gvAlarms.Visible = True
            gvAlarms.DataBind()
            gvAlarmPareto.Visible = False
            chtAlarmPareto.Visible = False
        End If
        If rblHistSelect.SelectedValue = 1 Then
            pl1.Visible = False
            pl2.Visible = False
            pl3.Visible = True
            lblDate1.Text = "Date:  "
            lblYear.Text = "Year:  "
            lblMonth.Text = "Month:  "
            Dim DateSel1 As Date = ddlMonth.SelectedItem.ToString + "/1/" + ddlYear.SelectedItem.ToString
            Dim DateSel2 As Date = DateSel1.AddMonths(1)
            SqlAlarmPareto.SelectCommand = "SELECT [AlmName] AS Description, Count([AlmName]) Amount FROM [IH" + RepLine + "_AlarmLog_VW] WHERE ([LogTime] > '" + DateSel1.ToString + "' AND [LogTime] < '" + DateSel2.ToString + "') Group by [AlmName]  ORDER BY [Amount] DESC"
            SqlAlarmPareto.DataBind()
            gvAlarmPareto.Visible = True
            gvAlarmPareto.DataBind()
            gvAlarms.Visible = False
            Dim ParRows As Integer = gvAlarmPareto.Rows.Count
            chtAlarmPareto.Visible = True
            chtAlarmPareto.Height = 30 * ParRows + 75
            chtAlarmPareto.DataBind()
        End If
        If rblHistSelect.SelectedValue = 2 Then
            pl1.Visible = True
            pl2.Visible = True
            pl3.Visible = False
            lblDate1.Text = "Date:  "
            lblDate1.Text = "From date:  "
            lblDate2.Text = "To date:  "
            Dim DateSel1 As Date = tbxAlDate1.Text
            Dim DateSel2 As Date = tbxAlDate2.Text
            DateSel2 = DateSel2.AddDays(1)
            SqlAlarmPareto.SelectCommand = "SELECT [AlmName] AS Description, Count([AlmName]) Amount FROM [IH" + RepLine + "_AlarmLog_VW] WHERE ([LogTime] > '" + DateSel1.ToString + "' AND [LogTime] < '" + DateSel2.ToString + "') Group by [AlmName]  ORDER BY [Amount] DESC"
            SqlAlarmPareto.DataBind()
            gvAlarmPareto.Visible = True
            gvAlarmPareto.DataBind()
            Dim ParRows As Integer = gvAlarmPareto.Rows.Count
            gvAlarms.Visible = False
            chtAlarmPareto.Visible = True
            chtAlarmPareto.Height = 30 * ParRows + 75
            chtAlarmPareto.DataBind()
        End If
        Cal2.EndDate = Today()
        Cal1.EndDate = tbxAlDate2.Text
        Dim myDate1 As Date = tbxAlDate1.Text
        Dim myDate2 As Date = tbxAlDate2.Text
        If myDate2 > Today() Then
            tbxAlDate2.Text = Today.ToShortDateString
            tbxAlDate1.Text = (Today.AddDays(-5)).ToShortDateString
        End If
        If myDate2 < myDate1 Then
            tbxAlDate1.Text = tbxAlDate2.Text
        End If


        '



    End Sub

    Private Sub LineNoSet(ln As String)
        btnOV.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_OV.aspx?Line=" + ln
        btnPI.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_PI.aspx?Line=" + ln
        btnRE.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_RE.aspx?Line=" + ln
        btnTR.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_TR.aspx?Line=" + ln
    End Sub

    Protected Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click
        Response.Write("<script language='javascript'>javascript:window.print();</script>")
    End Sub
End Class