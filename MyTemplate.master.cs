using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
public partial class MyTemplate : System.Web.UI.MasterPage
{

    SqlConnection cnn = new SqlConnection(ConfigurationManager.AppSettings["dbpath"]);



    void Show_User_Info()
    {
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = "select * from tblUser cross Join tblExam where UId=@P1 and ExamID=@P2";
        cmd.Parameters.AddWithValue("@P1", Session["ud"]);
        cmd.Parameters.AddWithValue("@P2", Session["exid"]);
        cnn.Open();
       dr = cmd.ExecuteReader();
       if (dr.Read() == true)
       {
           lblUserInfo.Text = dr["UInfo"].ToString();
           lblExamName.Text = dr["ExamName"].ToString();
       }
     
        cnn.Close();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if(! IsPostBack)
        {
           lblUserInfo.Text = "میهمان";
           lblExamName.Text = "نامشخص";
            if(Session["ud"]!=null && Session["exid"]!=null)           Show_User_Info();
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["ud"] = null;   //ابطال کارت تردد
        Session["exid"] = null;

        Response.Redirect("index.aspx");
    }
}
