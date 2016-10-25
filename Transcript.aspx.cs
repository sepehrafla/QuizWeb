using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
public partial class Transcript : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(ConfigurationManager.AppSettings["dbpath"]);


    void Show_Transcript()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = "select iif(qstanswer=anstext,1,0)as Result,* from tblAnswer inner join tblquestion on ansqstid=qstID inner join tblExam on qstexamid=examid inner join tblUser on ExAMuid=UID where QstExamID=@P0 and AnsUID=@P1";
        cmd.Parameters.AddWithValue("@P0", Session["exid"]);
        cmd.Parameters.AddWithValue("@P1", Session["ud"]);
        cnn.Open();
        grvTranscript.DataSource = cmd.ExecuteReader();
         grvTranscript.DataBind();
        cnn.Close();
    }

    
    void Show_Summary()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = "select ansuid,UInfo, count(*) as TotAns,sum(iif(qstanswer=anstext,1,0)) as CorrectAns,count(*)-sum(iif(qstanswer=anstext,1,0))as FalseAns from tblAnswer inner join tblquestion on ansqstid=qstID  inner join tbluser on ansuid=uid group by ansuid,UInfo having ansuid=@P1";
        //cmd.Parameters.AddWithValue("@P0", Session["exid"]);
        cmd.Parameters.AddWithValue("@P1", Session["ud"]);
        cnn.Open();
        grvSummary.DataSource = cmd.ExecuteReader();
        grvSummary.DataBind();
        cnn.Close();
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Show_Transcript();
            Show_Summary();
        }
    }
}