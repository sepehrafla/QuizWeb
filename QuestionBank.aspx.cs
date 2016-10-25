using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class QuestionBank : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(ConfigurationManager.AppSettings["dbpath"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindExam();
    }


    void BindExam()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = "select * from tblExam where ExamActive=1 and ExamUId=@P0";
        cmd.Parameters.AddWithValue("@P0", Session["ud"]);
        cnn.Open();
        drpExam.DataSource = cmd.ExecuteReader();
        drpExam.DataTextField = "ExamName";
        drpExam.DataValueField = "ExamID";

        drpExam.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string fn = "";
        if(FileUpload1.HasFile==true)
        {
            fn = FileUpload1.FileName;
            FileUpload1.PostedFile.SaveAs(Server.MapPath("QuestionImages\\") + fn);
        }

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = "Insert into tblQuestion (QstExamID,QstInfo,QstImg,QstAnswer) Values (@P1,@P2,@P3,@P4)";
        cmd.Parameters.AddWithValue("@P1", drpExam.SelectedValue);  // کد آزمون انتخاب شده
        cmd.Parameters.AddWithValue("@P2", txtQuestion.Text);
        cmd.Parameters.AddWithValue("@P3", fn);
        cmd.Parameters.AddWithValue("@P4", txtAnswer.Text);
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
        Response.Redirect("index.aspx");

    }
}