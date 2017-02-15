Imports xmldanet
Imports xmldanet.xmlda
Imports System.Data.SqlClient

Public Class IHT45_OV
    Inherits System.Web.UI.Page

    Private RepLine As String
    Private RepIDpass, ProductivitySQLSelect, ErrMsg, LineName, LineNo, ProdTbl As String

    'Private OPCNum, OPCMachNum, MachID, LineCode, CurrProd, XMLReadOK As Integer
    'Private TtlRecCountMemo As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            RepLine = Request.QueryString("Line")
            ddlLineNo.SelectedValue = Convert.ToInt32(RepLine)
        End If

        RepLine = ddlLineNo.SelectedValue
        LineNoSet(RepLine)
        lblLine.Text = "IHT line " + RepLine + " last cycle data"
        Dim SelectPartIDH As String = "Select TOP 1 * from  [HardCycle" + RepLine + "T] Order by ID Desc"
        Dim SelectPartIDT As String = "Select TOP 1 * from  [TempCycle" + RepLine + "T] Order by ID Desc"
        If SelectPartIDH = "" Then
            lblErrMsg.Text = "No data to display for Hardening"
        Else
            lblErrMsg.Text = ""
            DispHardenData(SelectPartIDH)
        End If
        If SelectPartIDT = "" Then
            lblErrMsg.Text = "No data to display for Temper"
        Else
            lblErrMsg.Text = ""
            DispTemperData(SelectPartIDT)
        End If
    End Sub

    Protected Sub ddlLineNo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlLineNo.SelectedIndexChanged
        LineNoSet(RepLine)
        'Server.Transfer("~/Apps/Departments/IndHeatTreat/IHT45/IHT45_OV.aspx?Line=" + RepLine, True)
    End Sub

    Private Sub LineNoSet(ln As String)
        btnAL.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_AL.aspx?Line=" + ln
        btnPI.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_PI.aspx?Line=" + ln
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

    Private Sub DispHardenData(selH As String)
        Dim dtH As DataTable
        dtH = GetSQLdata(selH)
        Dim myHardLbls() As Label = {lblH4, lblH5, lblH6, lblH7, lblH8, lblH9, lblH10, lblH11, lblH12, lblH13, lblH14, lblH15, lblH16, lblH17, lblH18, lblH19, lblH20, lblH21, lblH22, lblH23, lblH24}
        For i = 0 To 20
            If dtH.Rows(0)(i + 4).ToString = "" Then
                myHardLbls(i).Text = "."
            Else
                myHardLbls(i).Text = dtH.Rows(0)(i + 4).ToString
            End If
        Next
        lblCTstart_H.Text = dtH.Rows(0)(27).ToString
        lblHPartID.Text = dtH.Rows(0)(1).ToString
        lblH26.Text = dtH.Rows(0)(26).ToString
        lblH25.Text = PStat(dtH.Rows(0)(25))
        lblH25.ForeColor = FCol(dtH.Rows(0)(25))
        lblH25.BackColor = BCol(dtH.Rows(0)(25))

    End Sub

    Private Sub DispTemperData(selT As String)
        Dim dtT As DataTable
        dtT = GetSQLdata(selT)
        Dim myTempLbls() As Label = {lblT4, lblT5, lblT6, lblT7, lblT8, lblT9}
        For i = 0 To 5
            If dtT.Rows(0)(i + 4).ToString = "" Then
                myTempLbls(i).Text = "."
            Else
                myTempLbls(i).Text = dtT.Rows(0)(i + 4).ToString
            End If
        Next
        lblCTstart_T.Text = dtT.Rows(0)(11).ToString
        lblTPartID.Text = dtT.Rows(0)(1).ToString
        lblT10.Text = PStat(dtT.Rows(0)(10))
        lblT10.ForeColor = FCol(dtT.Rows(0)(10))
        lblT10.BackColor = BCol(dtT.Rows(0)(10))

    End Sub

    Private Function PStat(Val As String) As String
        Dim Res As String
        Select Case Val
            Case "0"
                Res = "---"
            Case "1"
                Res = "OK"
            Case "2"
                Res = "NG"
            Case Else
                Res = "???"
        End Select
        Return Res
    End Function

    Private Function FCol(Val As String) As Drawing.Color
        Dim Res As Drawing.Color
        Select Case Val
            Case "0"
                Res = Drawing.Color.Black
            Case "1"
                Res = Drawing.Color.Black
            Case "2"
                Res = Drawing.Color.Red
            Case Else
                Res = Drawing.Color.Black
        End Select
        Return Res
    End Function

    Private Function BCol(Val As String) As Drawing.Color
        Dim Res As Drawing.Color
        Select Case Val
            Case "0"
                Res = Drawing.Color.Gray
            Case "1"
                Res = Drawing.Color.White
            Case "2"
                Res = Drawing.Color.Yellow
            Case Else
                Res = Drawing.Color.White
        End Select
        Return Res
    End Function

    Protected Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click
        Response.Write("<script language='javascript'>javascript:window.print();</script>")
    End Sub

End Class