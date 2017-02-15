Imports System.Data
Imports System.Data.SqlClient

Public Class IHT45_RE
    Inherits System.Web.UI.Page

    Private RepLine, ErrMsg As String
    'Private myTbxH() As TextBox = {tbxH1, tbxH2, tbxH3, tbxH4, tbxH5, tbxH6, tbxH7, tbxH8, tbxH9}

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        RepLine = Request.QueryString("Line")
        If RepLine = "" Or RepLine = Nothing Then
            RepLine = "4"
        End If

        Dim CurrentData, OldData As DataTable
        Dim CurrentSelect As String = "SELECT TOP (1) * FROM [Recipe" + RepLine + "T] ORDER BY [ID] DESC"
        CurrentData = GetSQLdata(CurrentSelect)
        LineNoSet(RepLine)
        lblLine.Text = "IHT line " + RepLine + " recipe"

        DataDisp(CurrentData)
        If Not IsPostBack Then
            Dim myDate As Date = txtRecipeDate.Text
            tbxRecipeDate.Text = myDate.Date
        End If
        Calendar1.EndDate = txtRecipeDate.Text
        Dim BegDate, EndDate As Date
        EndDate = tbxRecipeDate.Text
        EndDate = EndDate.AddDays(1)
        BegDate = EndDate.AddDays(-11)
        Dim ddlRSI As Integer = ddlRecipeDates.SelectedIndex
        SqlIHTRecipe.SelectCommand = "SELECT [ID], [Start_DT] FROM [Recipe" + RepLine + "T] WHERE [Start_DT] > '" + BegDate.ToString + "' AND  [Start_DT] < '" + EndDate.ToString + "'  ORDER BY [ID] DESC"
        SqlIHTRecipe.DataBind()
        ddlRecipeDates.DataBind()
        If ddlRSI >= 0 Then
            ddlRecipeDates.SelectedIndex = ddlRSI
        End If
        lblMessage.Text = ""
        ddlRecipeDates.ToolTip = "Recipes changed between " + BegDate.ToString + " and " + tbxRecipeDate.Text
        If chbHist.Checked = True Then
            If ddlRecipeDates.SelectedIndex >= 0 Then
                Dim SelDateIdx As Integer = ddlRecipeDates.SelectedIndex
                Dim SelDateVal As Integer = ddlRecipeDates.SelectedValue
                Dim SelDateD As Date = ddlRecipeDates.SelectedItem.Text
                Dim OldRecipeSelect As String = "SELECT TOP (1) * FROM [Recipe" + RepLine + "T] Where [ID] = " + SelDateVal.ToString
                OldData = GetSQLdata(OldRecipeSelect)
                OldDataDisp(OldData)
            End If
        End If
    End Sub

    Private Sub LineNoSet(ln As String)
        btnAL.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_AL.aspx?Line=" + ln
        btnOV.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_OV.aspx?Line=" + ln
        btnPI.PostBackUrl = "~/Apps/Departments/IndHeatTreat/IHT45/IHT45_PI.aspx?Line=" + ln
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
            lblMessage.Text = "SQL server error - contact electrical department." '+ ex.ToString

        End Try
        Return mydt 'returnValue
    End Function

    Private Sub DataDisp(dt As DataTable)
        Dim myTbxH() As TextBox = {tbxH1, tbxH2, tbxH3, tbxH4, tbxH5, tbxH6, tbxH7, tbxH8, tbxH9, tbxH10, tbxH11, tbxH12, tbxH13, tbxH14, tbxH15, tbxH16, tbxH17, tbxH18, tbxH19, tbxH20, tbxH21, tbxH22}
        Dim myTbxOH() As TextBox = {tbxOH1, tbxOH2, tbxOH3, tbxOH4, tbxOH5, tbxOH6, tbxOH7, tbxOH8, tbxOH9, tbxOH10, tbxOH11, tbxOH12, tbxOH13, tbxOH14, tbxOH15, tbxOH16, tbxOH17, tbxOH18, tbxOH19, tbxOH20, tbxOH21, tbxOH22}
        Dim myTbxT() As TextBox = {tbxT1, tbxT2, tbxT3, tbxT4, tbxT5, tbxT6, tbxT7}
        Dim myTbxOT() As TextBox = {tbxOT1, tbxOT2, tbxOT3, tbxOT4, tbxOT5, tbxOT6, tbxOT7}

        txtPart_Nr.Text = dt(0)(2)
        txtPart_Type.Text = dt(0)(3)
        txtRecipeDate.Text = dt(0)(1)
        lblDateS.Visible = False
        lblDateST.Visible = False

        For i = 0 To 21
            myTbxH(i).BackColor = Drawing.Color.White
            myTbxOH(i).BackColor = Drawing.Color.White
            myTbxOH(i).Visible = False
        Next
        For i = 0 To 6
            myTbxT(i).BackColor = Drawing.Color.White
            myTbxOT(i).BackColor = Drawing.Color.White
            myTbxOT(i).Visible = False
        Next

        For i = 0 To 21
            myTbxH(i).Text = dt(0)(4 + i)
        Next

        For i = 0 To 6
            myTbxT(i).Text = dt(0)(26 + i)
        Next


        If chbHist.Checked = True Then
            tbxRecipeDate.Visible = True
            Image1.Visible = True
            ddlRecipeDates.Visible = True
        Else
            tbxRecipeDate.Visible = False
            Image1.Visible = False
            ddlRecipeDates.Visible = False
        End If

    End Sub

    Private Sub OldDataDisp(dt As DataTable)
        Dim myTbxH() As TextBox = {tbxH1, tbxH2, tbxH3, tbxH4, tbxH5, tbxH6, tbxH7, tbxH8, tbxH9, tbxH10, tbxH11, tbxH12, tbxH13, tbxH14, tbxH15, tbxH16, tbxH17, tbxH18, tbxH19, tbxH20, tbxH21, tbxH22}
        Dim myTbxOH() As TextBox = {tbxOH1, tbxOH2, tbxOH3, tbxOH4, tbxOH5, tbxOH6, tbxOH7, tbxOH8, tbxOH9, tbxOH10, tbxOH11, tbxOH12, tbxOH13, tbxOH14, tbxOH15, tbxOH16, tbxOH17, tbxOH18, tbxOH19, tbxOH20, tbxOH21, tbxOH22}
        Dim myTbxT() As TextBox = {tbxT1, tbxT2, tbxT3, tbxT4, tbxT5, tbxT6, tbxT7}
        Dim myTbxOT() As TextBox = {tbxOT1, tbxOT2, tbxOT3, tbxOT4, tbxOT5, tbxOT6, tbxOT7}

        'For i = 0 To 21
        '    myTbxH(i).BackColor = Drawing.Color.White
        'Next
        'For i = 0 To 6
        '    myTbxT(i).BackColor = Drawing.Color.White
        'Next
        lblDateS.Visible = True
        lblDateST.Visible = True
        For i = 0 To 21
            myTbxOH(i).Visible = True
            myTbxOH(i).Text = dt(0)(4 + i).ToString
            If myTbxH(i).Text <> dt(0)(4 + i) Then
                myTbxH(i).BackColor = Drawing.Color.Yellow
                myTbxOH(i).BackColor = Drawing.Color.Yellow
            Else
                myTbxH(i).BackColor = Drawing.Color.White
                myTbxOH(i).BackColor = Drawing.Color.White
            End If
        Next

        For i = 0 To 6
            myTbxOT(i).Visible = True
            myTbxOT(i).Text = dt(0)(26 + i).ToString
            If myTbxT(i).Text <> dt(0)(26 + i) Then
                myTbxT(i).BackColor = Drawing.Color.Yellow
                myTbxOT(i).BackColor = Drawing.Color.Yellow
            Else
                myTbxT(i).BackColor = Drawing.Color.White
                myTbxOT(i).BackColor = Drawing.Color.White
            End If
        Next


    End Sub

    Protected Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click
        Response.Write("<script language='javascript'>javascript:window.print();</script>")
    End Sub
End Class