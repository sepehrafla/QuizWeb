using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
public partial class ExamQuestion : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(ConfigurationManager.AppSettings["dbpath"]);


    void Show_User_in_Group()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        //cmd.CommandText = "select UInfo  as [کاربران]  from tblWorkGroup inner Join tblUser on uid=WgUID where WgExamID=@P0 Order by UInfo";
        //cmd.CommandText = "select UInfo    from tblWorkGroup inner Join tblUser on uid=WgUID where WgExamID=@P0 Order by UInfo";
        cmd.CommandText = "select  uid,UInfo,ExamID,count(*) AS TotQuestion,sum( iif(isnull(QstAnswer,'A')=isnull(ansText,'B'),1,0)) AS TotCorrect,count(*)-sum( iif(isnull(QstAnswer,'A')=isnull(ansText,'B'),1,0)) AS TotFalse,cast(( sum( iif(isnull(QstAnswer,'A')=isnull(ansText,'B'),1,0))*100.0/count(*)) as float) as Percentage from ( select * from tbluser Left outer Join  tblWorkGroup on wguid=UID inner Join tblExam on WgExamID=ExamID  )tbl Left outer  join tblQuestion on qstExamID=Examid Left outer  join tblanswer on ansqstID=qstid and ansuid=UID group by  uid,UInfo,ExamID having Examid=@P0";
        cmd.Parameters.AddWithValue("@P0", Session["exid"]);
        cnn.Open();
        grvUser.DataSource= cmd.ExecuteReader();
        grvUser.DataBind();
        cnn.Close();
    }

    void Show_Exam_info()
    {
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        cmd.Connection = cnn;
        cmd.CommandText = "select * from tblExam  where ExamID=@P0";
        cmd.Parameters.AddWithValue("@P0", Session["exid"]);
        cnn.Open();
        dr = cmd.ExecuteReader();
        if(dr.Read()==true)
        {
           Image1.ImageUrl= "ExamImages\\"+ dr["ExamImg"].ToString();
        }
        cnn.Close();
    }


    void Show_Question_in_Group()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        //cmd.CommandText = "select UInfo  as [کاربران]  from tblWorkGroup inner Join tblUser on uid=WgUID where WgExamID=@P0 Order by UInfo";
        cmd.CommandText = "select * from tblQuestion where QstExamID=@P0 Order by QStID";
        cmd.Parameters.AddWithValue("@P0", Session["exid"]);
        cnn.Open();
        grvQuestion.DataSource = cmd.ExecuteReader();
        grvQuestion.DataBind();
        cnn.Close();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ud"] == null || Session["exid"] == null) Response.Redirect("Login.aspx");

        if (!IsPostBack)
        {
            Show_User_in_Group();
            Show_Exam_info();

            Show_Question_in_Group();
        }
    }
}