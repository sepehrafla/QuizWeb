using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Configuration;
using System.Data.SqlClient;
public partial class Answer : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(ConfigurationManager.AppSettings["dbpath"]);
    public Boolean answer_exist;




    Boolean Check_Duplicated_Answer()
    {
        Boolean flg;
         SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        cmd.Connection = cnn;
        cmd.CommandText = "select * from tblAnswer  where ansQstID=@P0 and ansUID=@P1";
        cmd.Parameters.AddWithValue("@P0", ViewState["id"]);
        cmd.Parameters.AddWithValue("@P1", Session["ud"]);
        cnn.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read() == true)
            flg = true;
        else
            flg = false;
        cnn.Close();
        return flg;
    }

    void ShowQuestionInfo()
    {
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        cmd.Connection = cnn;
        cmd.CommandText = "select * from tblQuestion  where QstID=@P0";
        cmd.Parameters.AddWithValue("@P0", ViewState["id"]);
        cnn.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read() == true)
        {
            txtQuestion.Text = dr["QstInfo"].ToString();
            Image1.ImageUrl = "QuestionImages\\" + dr["QstImg"].ToString();
        }
        cnn.Close();
    }

    void Fill_Old_Answer()
    {
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        cmd.Connection = cnn;
        cmd.CommandText = "select * from tblAnswer where ansQstID=@P0";
        cmd.Parameters.AddWithValue("@P0", ViewState["id"]);
        cnn.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read() == true)
            txtAnswer.Text = dr["Anstext"].ToString();
        cnn.Close();
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        { 
        //ViewState :متغیری است که در همین پیج در دسترس است
        ViewState["id"] = Request.QueryString["qs"];
        answer_exist=Check_Duplicated_Answer();
        
        ShowQuestionInfo();

        btnSave.Visible = (answer_exist == false);
        btnUpdate.Visible = !btnSave.Visible;

        if (answer_exist == true)           Fill_Old_Answer();
            
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
       
        cmd.CommandText = "Insert into tblAnswer (AnsQstID,AnsUID,AnsText) Values (@P1,@P2,@P3)";
        cmd.Parameters.AddWithValue("@P1", ViewState["id"]);
        cmd.Parameters.AddWithValue("@P2", Session["ud"]);
        cmd.Parameters.AddWithValue("@P3", txtAnswer.Text);
       

        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
        Response.Redirect("ExamQuestion.aspx");
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
      
        cmd.CommandText = "Update tblAnswer set AnsText=@P3 where AnsQstID=@P1 and AnsUID=@P2";
        cmd.Parameters.AddWithValue("@P1", ViewState["id"]);
        cmd.Parameters.AddWithValue("@P2", Session["ud"]);
        cmd.Parameters.AddWithValue("@P3", txtAnswer.Text);
      
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();
        Response.Redirect("ExamQuestion.aspx");
    }
}