Imports System.Web.UI.DataVisualization.Charting
Imports System.Data
Imports System.Data.SqlClient

Public Class IHT45_TR
    Inherits System.Web.UI.Page

    Private RepLine, SQLSelectCmd As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RepLine = Request.QueryString("Line")
        If RepLine = "" Or RepLine = Nothing Then
            RepLine = "4"
        End If
        If Not IsPostBack Then
            '           ddlLineNo.SelectedValue = Convert.ToInt32(RepLine)
            tbxDate.Text = Now.ToShortDateString
            ViewState("Function") = 1
            ViewState("ChartIndex") = ""
            ViewState("MaxIdx") = 0
        End If
        Cal1.EndDate = Now()

        lblErrMsg.Text = ""
        '       RepLine = ddlLineNo.SelectedValue
        LineNoSet(RepLine)
        lblLine.Text = "IHT line " + RepLine + " trends"


        If rblHist.SelectedValue = 1 Then
            plDate.Visible = False
        Else
            plDate.Visible = True

        End If

        ChartDisp()

        ' ScriptManager.RegisterStartupScript(Me, Page.GetType(), "chtYScale", "chtYScale();", True)

    End Sub

    Private Sub LineNoSet(ln As String)
        btnAL.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_AL.aspx?Line=" + ln
        btnOV.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_OV.aspx?Line=" + ln
        btnPI.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_PI.aspx?Line=" + ln
        btnRE.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_RE.aspx?Line=" + ln
    End Sub

    Private Function GetSQLdata(sel As String) As DataTable
        Dim ConnStrg As New SqlConnection(ConfigurationManager.ConnectionStrings("IHT45ConnectionString").ConnectionString)

        'Dim con As New SqlConnection(ConnStrg)
        Dim cmd As New SqlCommand(sel, ConnStrg)



        Dim mydt As New DataTable()
        Try
            ConnStrg.Open()
            Dim da As New SqlDataAdapter(cmd)

            da.Fill(mydt)

            ConnStrg.Close()
            lblErrMsg.Text = ""
        Catch ex As Exception
            lblErrMsg.Text = "SQL server error - contact electrical department." '+ ex.ToString

        End Try
        Return mydt 'returnValue
    End Function

    Private Sub ChartDisp()
        Dim Title, SQLSelectCol, SQLTable As String
        Dim myFunction As Integer = ViewState("Function")

        Select Case myFunction
            Case 1 'Harden Energy
                Title = "IHT line " + RepLine + " Harden Energy"
                SQLSelectCol = "[ID], [Start_DT],[Energy], [Energy_UL], [Energy_LL]"
                SQLTable = "[HardCycle" + RepLine + "T]"
                chtData.Series("Series1").YValueMembers = "Energy"
                chtData.Series("Series2").YValueMembers = "Energy_UL"
                chtData.Series("Series3").YValueMembers = "Energy_LL"
                chtData.Series("Series4").YValueMembers = "ID"
                chtData.Series("Series1").XValueMember = "Start_DT"
                chtData.Series("Series2").XValueMember = "Start_DT"
                chtData.Series("Series3").XValueMember = "Start_DT"
                chtData.Series("Series4").XValueMember = "Start_DT"
            Case 2 'Harden ID Flow
                Title = "IHT line " + RepLine + " ID Flow"
                SQLSelectCol = "[ID], [Start_DT],[QuFlow_ID], [QuFlow_ID_UL], [QuFlow_ID_LL]"
                SQLTable = "[HardCycle" + RepLine + "T]"
                chtData.Series("Series1").YValueMembers = "QuFlow_ID"
                chtData.Series("Series2").YValueMembers = "QuFlow_ID_UL"
                chtData.Series("Series3").YValueMembers = "QuFlow_ID_LL"
                chtData.Series("Series4").YValueMembers = "ID"
                chtData.Series("Series1").XValueMember = "Start_DT"
                chtData.Series("Series2").XValueMember = "Start_DT"
                chtData.Series("Series3").XValueMember = "Start_DT"
                chtData.Series("Series4").XValueMember = "Start_DT"
            Case 3 'Harden OD Flow
                Title = "IHT line " + RepLine + " OD Flow"
                SQLSelectCol = "[ID], [Start_DT],[QuFlow_OD], [QuFlow_OD_UL], [QuFlow_OD_LL]"
                SQLTable = "[HardCycle" + RepLine + "T]"
                chtData.Series("Series1").YValueMembers = "QuFlow_OD"
                chtData.Series("Series2").YValueMembers = "QuFlow_OD_UL"
                chtData.Series("Series3").YValueMembers = "QuFlow_OD_LL"
                chtData.Series("Series4").YValueMembers = "ID"
                chtData.Series("Series1").XValueMember = "Start_DT"
                chtData.Series("Series2").XValueMember = "Start_DT"
                chtData.Series("Series3").XValueMember = "Start_DT"
                chtData.Series("Series4").XValueMember = "Start_DT"
            Case 4 'Harden ID Pressure
                Title = "IHT line " + RepLine + " ID Pressure"
                SQLSelectCol = "[ID], [Start_DT],[QuPres_ID], [QuPres_ID_UL], [QuPres_ID_LL]"
                SQLTable = "[HardCycle" + RepLine + "T]"
                chtData.Series("Series1").YValueMembers = "QuPres_ID"
                chtData.Series("Series2").YValueMembers = "QuPres_ID_UL"
                chtData.Series("Series3").YValueMembers = "QuPres_ID_LL"
                chtData.Series("Series4").YValueMembers = "ID"
                chtData.Series("Series1").XValueMember = "Start_DT"
                chtData.Series("Series2").XValueMember = "Start_DT"
                chtData.Series("Series3").XValueMember = "Start_DT"
                chtData.Series("Series4").XValueMember = "Start_DT"
            Case 5 'Harden OD Pressure
                Title = "IHT line " + RepLine + " OD Pressure"
                SQLSelectCol = "[ID], [Start_DT],[QuPres_OD], [QuPres_OD_UL], [QuPres_OD_LL]"
                SQLTable = "[HardCycle" + RepLine + "T]"
                chtData.Series("Series1").YValueMembers = "QuPres_OD"
                chtData.Series("Series2").YValueMembers = "QuPres_OD_UL"
                chtData.Series("Series3").YValueMembers = "QuPres_OD_LL"
                chtData.Series("Series4").YValueMembers = "ID"
                chtData.Series("Series1").XValueMember = "Start_DT"
                chtData.Series("Series2").XValueMember = "Start_DT"
                chtData.Series("Series3").XValueMember = "Start_DT"
                chtData.Series("Series4").XValueMember = "Start_DT"
            Case 6 'Temper Current
                Title = "IHT line " + RepLine + " Temper Current"
                SQLSelectCol = "[ID], [Time_Stamp],[TCurrent], [TCurrent_UL], [TCurrent_LL]"
                SQLTable = "[TempCycle" + RepLine + "T]"
                chtData.Series("Series1").YValueMembers = "TCurrent"
                chtData.Series("Series2").YValueMembers = "TCurrent_UL"
                chtData.Series("Series3").YValueMembers = "TCurrent_LL"
                chtData.Series("Series4").YValueMembers = "ID"
                chtData.Series("Series1").XValueMember = "Time_Stamp"
                chtData.Series("Series2").XValueMember = "Time_Stamp"
                chtData.Series("Series3").XValueMember = "Time_Stamp"
                chtData.Series("Series4").XValueMember = "Time_Stamp"
            Case 7 'Temper Temperature
                Title = "IHT line " + RepLine + " Temper Temperature"
                SQLSelectCol = "[ID], [Time_Stamp],[PartTemper], [PartTemper_UL], [PartTemper_LL]"
                SQLTable = "[TempCycle" + RepLine + "T]"
                chtData.Series("Series1").YValueMembers = "PartTemper"
                chtData.Series("Series2").YValueMembers = "PartTemper_UL"
                chtData.Series("Series3").YValueMembers = "PartTemper_LL"
                chtData.Series("Series4").YValueMembers = "ID"
                chtData.Series("Series1").XValueMember = "Time_Stamp"
                chtData.Series("Series2").XValueMember = "Time_Stamp"
                chtData.Series("Series3").XValueMember = "Time_Stamp"
                chtData.Series("Series4").XValueMember = "Time_Stamp"

            Case Else
                Title = "UNKNOWN"

        End Select
        Dim SQLWhere, SQLTop, SQLOrder As String
        SQLWhere = ""
        If rblHist.SelectedValue = 1 Then
            SQLWhere = ""
        Else
            Dim histDate As Date = tbxDate.Text
            Dim HistDateFrom, HistDateTo As String
            Dim HistShift As Integer = rblShift.SelectedValue
            Select Case HistShift
                Case 1
                    HistDateFrom = histDate.ToShortDateString + " 7:00:00"
                    HistDateTo = histDate.ToShortDateString + " 15:00:00"
                    SQLWhere = " WHERE  Start_DT > '" + HistDateFrom + "' AND  Start_DT < '" + HistDateTo + "'"
                Case 2
                    HistDateFrom = histDate.ToShortDateString + " 15:00:00"
                    HistDateTo = histDate.ToShortDateString + " 23:00:00"
                    SQLWhere = " WHERE  Start_DT > '" + HistDateFrom + "' AND  Start_DT < '" + HistDateTo + "'"
                Case 3
                    HistDateFrom = histDate.AddDays(-1).ToShortDateString + " 23:00:00"
                    HistDateTo = histDate.ToShortDateString + " 7:00:00"
                    SQLWhere = " WHERE  Start_DT > '" + HistDateFrom + "' AND  Start_DT < '" + HistDateTo + "'"
                Case 4
                    HistDateFrom = histDate.AddDays(-1).ToShortDateString + " 23:00:00"
                    HistDateTo = histDate.ToShortDateString + " 23:00:00"
                    SQLWhere = " WHERE  Start_DT > '" + HistDateFrom + "' AND  Start_DT < '" + HistDateTo + "'"
                Case Else
                    SQLWhere = ""
            End Select

        End If
        SQLTop = " TOP " + tbxGnum.Text
        SQLOrder = " Order by ID DESC "
        SQLSelectCmd = "SELECT " + SQLTop + " " + SQLSelectCol + " FROM " + SQLTable + " " + SQLWhere + " " + SQLOrder
        SqlIHT45.SelectCommand = SQLSelectCmd
        SqlIHT45.DataBind()
        Dim chtdt As DataTable = GetSQLdata(SQLSelectCmd)
        ViewState("chtdt") = chtdt

        If cbxHideLim.Checked = True Then
            chtData.Series("Series2").Enabled = False
            chtData.Series("Series3").Enabled = False
        Else
            chtData.Series("Series2").Enabled = True
            chtData.Series("Series3").Enabled = True
        End If

        chtData.DataSource = chtdt
        chtData.DataBind()

        If tbxChtSL.Text <> "" Then
            chtData.ChartAreas("ChartArea1").AxisY.Minimum = tbxChtSL.Text
        End If
        If tbxChtSU.Text <> "" Then
            chtData.ChartAreas("ChartArea1").AxisY.Maximum = tbxChtSU.Text
        End If

        Dim chtDataCount As Integer = chtData.Series(0).Points.Count
        ViewState("MaxIdx") = chtDataCount
        chtData.Titles("Title1").Text = Title + " " + chtDataCount.ToString + " - points."

        If chtDataCount < 2 Then
            chtData.Visible = False
            lblErrMsg.Text = "No data available"
        Else
            chtData.Visible = True

        End If

    End Sub

    Private Sub myScale()
        tbxChtSU.Text = ""
        tbxChtSL.Text = ""
        chtData.ChartAreas("ChartArea1").AxisY.Maximum = [Double].NaN
        chtData.ChartAreas("ChartArea1").AxisY.Minimum = [Double].NaN
        ChartDisp()
        'chtData.ChartAreas("ChartArea1").RecalculateAxesScale()
        plPartInfo.Visible = False

    End Sub

    Protected Sub btnHE_Click(sender As Object, e As EventArgs) Handles btnHE.Click
        ViewState("Function") = 1
        myScale()
        btnHE.BorderColor = Drawing.Color.Red
        btnHIDF.BorderColor = Drawing.Color.Green
        btnHODF.BorderColor = Drawing.Color.Green
        btnHIDP.BorderColor = Drawing.Color.Green
        btnHODP.BorderColor = Drawing.Color.Green
        btnTC.BorderColor = Drawing.Color.Green
        btnTT.BorderColor = Drawing.Color.Green
    End Sub

    Protected Sub btnHIDF_Click(sender As Object, e As EventArgs) Handles btnHIDF.Click
        ViewState("Function") = 2
        myScale()
        btnHE.BorderColor = Drawing.Color.Green
        btnHIDF.BorderColor = Drawing.Color.Red
        btnHODF.BorderColor = Drawing.Color.Green
        btnHIDP.BorderColor = Drawing.Color.Green
        btnHODP.BorderColor = Drawing.Color.Green
        btnTC.BorderColor = Drawing.Color.Green
        btnTT.BorderColor = Drawing.Color.Green
    End Sub

    Protected Sub btnHODF_Click(sender As Object, e As EventArgs) Handles btnHODF.Click
        ViewState("Function") = 3
        myScale()
        btnHE.BorderColor = Drawing.Color.Green
        btnHIDF.BorderColor = Drawing.Color.Green
        btnHODF.BorderColor = Drawing.Color.Red
        btnHIDP.BorderColor = Drawing.Color.Green
        btnHODP.BorderColor = Drawing.Color.Green
        btnTC.BorderColor = Drawing.Color.Green
        btnTT.BorderColor = Drawing.Color.Green
    End Sub

    Protected Sub btnHIDP_Click(sender As Object, e As EventArgs) Handles btnHIDP.Click
        ViewState("Function") = 4
        myScale()
        btnHE.BorderColor = Drawing.Color.Green
        btnHIDF.BorderColor = Drawing.Color.Green
        btnHODF.BorderColor = Drawing.Color.Green
        btnHIDP.BorderColor = Drawing.Color.Red
        btnHODP.BorderColor = Drawing.Color.Green
        btnTC.BorderColor = Drawing.Color.Green
        btnTT.BorderColor = Drawing.Color.Green
    End Sub

    Protected Sub btnHODP_Click(sender As Object, e As EventArgs) Handles btnHODP.Click
        ViewState("Function") = 5
        myScale()
        btnHE.BorderColor = Drawing.Color.Green
        btnHIDF.BorderColor = Drawing.Color.Green
        btnHODF.BorderColor = Drawing.Color.Green
        btnHIDP.BorderColor = Drawing.Color.Green
        btnHODP.BorderColor = Drawing.Color.Red
        btnTC.BorderColor = Drawing.Color.Green
        btnTT.BorderColor = Drawing.Color.Green
    End Sub

    Protected Sub btnTC_Click(sender As Object, e As EventArgs) Handles btnTC.Click
        ViewState("Function") = 6
        myScale()
        btnHE.BorderColor = Drawing.Color.Green
        btnHIDF.BorderColor = Drawing.Color.Green
        btnHODF.BorderColor = Drawing.Color.Green
        btnHIDP.BorderColor = Drawing.Color.Green
        btnHODP.BorderColor = Drawing.Color.Green
        btnTC.BorderColor = Drawing.Color.Red
        btnTT.BorderColor = Drawing.Color.Green
    End Sub

    Protected Sub btnTT_Click(sender As Object, e As EventArgs) Handles btnTT.Click
        ViewState("Function") = 7
        myScale()
        btnHE.BorderColor = Drawing.Color.Green
        btnHIDF.BorderColor = Drawing.Color.Green
        btnHODF.BorderColor = Drawing.Color.Green
        btnHIDP.BorderColor = Drawing.Color.Green
        btnHODP.BorderColor = Drawing.Color.Green
        btnTC.BorderColor = Drawing.Color.Green
        btnTT.BorderColor = Drawing.Color.Red
    End Sub

    Private Sub chtData_Click(sender As Object, e As ImageMapEventArgs) Handles chtData.Click
        Dim ipos As Int32 = e.PostBackValue.LastIndexOf(",")
        'lblPD.Text = e.PostBackValue.Substring(0, ipos)
        Dim indexV As Integer
        If ViewState("ChartIndex") <> "" Then
            indexV = Convert.ToInt32(ViewState("ChartIndex"))
            If indexV <= ViewState("MaxIdx") Then
                chtData.Series("Series1").Points(indexV).MarkerStyle = MarkerStyle.None

            End If
        End If
        Dim indexS As String = e.PostBackValue.Substring((ipos + 1), (e.PostBackValue.Length - (ipos + 1)))
        ViewState("ChartIndex") = indexS
        Dim chtdatadt As DataTable = ViewState("chtdt")
        indexV = Convert.ToInt32(ViewState("ChartIndex"))
        chtData.Series("Series1").Points(indexV).MarkerStyle = MarkerStyle.Diamond
        plPartInfo.Visible = True

        If ViewState("Function") < 2 Then
            btnInfo.Visible = True
        Else
            btnInfo.Visible = False
        End If

        DataPointChange(0)

    End Sub

    Protected Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click
        Response.Write("<script language='javascript'>javascript:window.print();</script>")
    End Sub

    Protected Sub btnExport_Click(sender As Object, e As EventArgs) Handles btnExport.Click
        Dim db, sel, ttl, opt As String
        db = "IHT"
        ttl = chtData.Titles("Title1").Text
        sel = SQLSelectCmd
        opt = "?db=" + db + "&sel=" + sel + "&ttl=" + ttl
        Response.Redirect("~/Apps/Diagnostic/DataExport.aspx" + opt)

    End Sub

    Protected Sub btnL_Click(sender As Object, e As EventArgs) Handles btnL.Click
        DataPointChange(-1)
    End Sub

    Protected Sub btnR_Click(sender As Object, e As EventArgs) Handles btnR.Click
        DataPointChange(1)
    End Sub

    Private Sub DataPointChange(idxChd As Integer)
        Dim newIdx As Integer
        Dim MaxIdx As Integer = ViewState("MaxIdx") - 1
        Dim indexV, indexTtl As Integer
        indexTtl = Convert.ToInt32(tbxGnum.Text)
        If ViewState("ChartIndex") <> "" Then
            indexV = Convert.ToInt32(ViewState("ChartIndex"))
            newIdx = indexV + idxChd
            If newIdx > MaxIdx Then
                newIdx = MaxIdx
            End If
            If newIdx <= 0 Then
                newIdx = 0
            End If
            ViewState("ChartIndex") = newIdx.ToString
            If indexV <= MaxIdx Then
                chtData.Series("Series1").Points(indexV).MarkerStyle = MarkerStyle.None
                chtData.Series("Series1").Points(newIdx).MarkerStyle = MarkerStyle.Diamond
            End If
            indexV = newIdx
        End If
        Dim dt As DataTable = ViewState("chtdt")
        lblPD.Text = dt(indexV)(1).ToString
        lblPV.Text = dt(indexV)(2).ToString
        lblPH.Text = dt(indexV)(3).ToString
        lblPL.Text = dt(indexV)(4).ToString
        btnInfo.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_PI.aspx?Line=" + RepLine.ToString + "&PartID=" + dt(indexV)(0).ToString

    End Sub
End Class