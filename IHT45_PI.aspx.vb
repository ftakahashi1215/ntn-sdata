Imports System.Data
Imports System.Data.SqlClient
Imports System.Net.Mail


Public Class IHT45_PI
    Inherits System.Web.UI.Page
    Private RepLine, PartIDH, PartIDT As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RepLine = Request.QueryString("Line")
        If RepLine = "" Or RepLine = Nothing Then
            RepLine = "4"
        End If
        tbxDateH_CalendarExtender.EndDate = Today
        tbxDateT_CalendarExtender.EndDate = Today
        lblErrMsg.Text = ""
        LineNoSet(RepLine)
        lblLine.Text = "IHT line " + RepLine + " part info"
        Dim SelectPartIDH As String = ""
        Dim SelectPartIDT As String = ""
        Dim myDateH1, myDateH2, myDateT1, myDateT2 As Date
        If Not IsPostBack Then
            PartIDH = Request.QueryString("PartIDH")
            PartIDT = Request.QueryString("PartIDT")
            tbxDateH.Text = Today.ToShortDateString
            myDateH1 = tbxDateH.Text
            myDateH2 = myDateH1.AddDays(1)
            tbxDateT.Text = Today.ToShortDateString
            myDateT1 = tbxDateT.Text
            myDateT2 = myDateT1.AddDays(1)
            SqlHardenPartInfo.SelectCommand = "SELECT [ID], [Start_DT], [PartID] FROM [HardCycle" + RepLine + "T] WHERE ([Start_DT] > '" + myDateH1.ToString + "' and [Start_DT] < '" + myDateH2.ToString + "') ORDER BY [ID] DESC"
            SqlTemperPartInfo.SelectCommand = "SELECT [ID], [Time_Stamp], [PartID] FROM [TempCycle" + RepLine + "T] WHERE ([Time_Stamp] > '" + myDateT1.ToString + "' and [Time_Stamp] < '" + myDateT2.ToString + "') ORDER BY [ID] DESC"

            If PartIDH = "" Or PartIDH = Nothing Then
                SelectPartIDH = "Select TOP 1 * from HardCycle" + RepLine + "T Order by ID Desc"
            Else
                SelectPartIDH = "Select TOP 1 * from HardCycle" + RepLine + "T WHERE Start_DT = '" + PartIDH + "'"
            End If

            If PartIDT = "" Or PartIDT = Nothing Then
                SelectPartIDT = "Select TOP 1 * from TempCycle" + RepLine + "T Order by ID Desc"
            Else
                SelectPartIDT = "Select TOP 1 * from TempCycle" + RepLine + "T WHERE Time_Stamp = '" + PartIDT + "'"
            End If

        Else
            myDateH1 = tbxDateH.Text
            myDateH2 = myDateH1.AddDays(1)
            myDateT1 = tbxDateT.Text
            myDateT2 = myDateT1.AddDays(1)
            SqlHardenPartInfo.SelectCommand = "SELECT [ID], [Start_DT], [PartID] FROM [HardCycle" + RepLine + "T] WHERE ([Start_DT] > '" + myDateH1.ToString + "' and [Start_DT] < '" + myDateH2.ToString + "') ORDER BY [ID] DESC"
            SqlTemperPartInfo.SelectCommand = "SELECT [ID], [Time_Stamp], [PartID] FROM [TempCycle" + RepLine + "T] WHERE ([Time_Stamp] > '" + myDateT1.ToString + "' and [Time_Stamp] < '" + myDateT2.ToString + "') ORDER BY [ID] DESC"
            PartIDH = ddlDataListH.SelectedValue
            PartIDT = ddlDataListT.SelectedValue
            SelectPartIDH = "Select TOP 1 * from HardCycle" + RepLine + "T WHERE Start_DT = '" + PartIDH + "'"
            SelectPartIDT = "Select TOP 1 * from TempCycle" + RepLine + "T WHERE Time_Stamp = '" + PartIDT + "'"
        End If
        lblErrMsg.Text = ""
        DispHardenData(SelectPartIDH)
        DispTemperData(SelectPartIDT)
    End Sub

    Private Sub LineNoSet(ln As String)
        btnAL.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_AL.aspx?Line=" + ln
        btnOV.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_OV.aspx?Line=" + ln
        btnRE.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_RE.aspx?Line=" + ln
        btnTR.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_TR.aspx?Line=" + ln
    End Sub

    Private Function GetSQLdata(sel As String) As DataTable
        Dim sqlConnection1 As New SqlConnection(ConfigurationManager.ConnectionStrings("IHT45ConnectionString").ConnectionString)
        Dim cmd As New SqlCommand(sel, sqlConnection1)
        Dim mydt As New DataTable()
        Try
            sqlConnection1.Open()
            Dim da As New SqlDataAdapter(cmd)
            da.Fill(mydt)
            sqlConnection1.Close()
        Catch ex As Exception
            lblErrMsg.Text = "SQL server error - contact electrical department." '+ ex.ToString
        End Try
        Return mydt 'returnValue
    End Function

    Private Sub DispHardenData(sel As String)
        Dim dt As DataTable
        dt = GetSQLdata(sel)
        Dim myHardLbls() As Label = {lblH4, lblH5, lblH6, lblH7, lblH8, lblH9, lblH10, lblH11, lblH12, lblH13, lblH14, lblH15, lblH16, lblH17, lblH18, lblH19, lblH20, lblH21, lblH22, lblH23, lblH24, lblH25, lblH26, lblH27, lblH28}
        LBLHARDENDATA.Text = "Hardening data for PartId = " + dt.Rows(0)(0).ToString + " - Bearing ID = " + dt.Rows(0)(1).ToString
        For i = 0 To 24
            If dt.Rows(0)(i + 4).ToString = "" Then
                myHardLbls(i).Text = "."
            Else
                myHardLbls(i).Text = dt.Rows(0)(i + 4).ToString
            End If
        Next
    End Sub

    Private Sub DispTemperData(sel As String)
        Dim dt As DataTable
        dt = GetSQLdata(sel)
        Dim myTempLbls() As Label = {lblT4, lblT5, lblT6, lblT7, lblT8, lblT9}
        LBLTEMPERDATA.Text = "Temper data for PartId = " + dt.Rows(0)(0).ToString + " - Bearing ID = " + dt.Rows(0)(1).ToString
        For i = 0 To 5
            If dt.Rows(0)(i + 4).ToString = "" Then
                myTempLbls(i).Text = "."
            Else
                myTempLbls(i).Text = dt.Rows(0)(i + 4).ToString
            End If
        Next
    End Sub

    Protected Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click
        Response.Write("<script language='javascript'>javascript:window.print();</script>")
    End Sub

End Class