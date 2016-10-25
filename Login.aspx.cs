using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{

    SqlConnection cnn = new SqlConnection(ConfigurationManager.AppSettings["dbpath"]);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        //if (txtName.Text == "admin" && txtPassword.Text == "123")
        //{ 
        //    lblMsg.Text = "OK";
        //    lblMsg.ForeColor = System.Drawing.Color.Blue;
        //}
        //else
        //{
        //    lblMsg.Text = "نام کاربر و یا رمز اشتباه است";
        //    lblMsg.ForeColor = System.Drawing.Color.Red;
        //}


        string User_Name = txtName.Text;
        string User_PIN_Code = txtPinCode.Text;
        bool flg = false;
        
        SqlDataReader dr;

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = "Select * From tblUser Cross Join tblExam where   uname=@P1 and ExamPinCode=@P2";
        cmd.Parameters.AddWithValue("@P1", User_Name);
        cmd.Parameters.AddWithValue("@P2", User_PIN_Code);
        cnn.Open();
        dr= cmd.ExecuteReader();
        if (dr.Read() == true)
        {
            flg = true;
            Session["ud"] = dr["UID"].ToString();
            Session["exid"] = dr["ExamID"].ToString();
        }
        else
        {
            lblMsg.Text = "نام کاربر و یا PIN-Code اشتباه است";
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
        cnn.Close();

        if(flg==true)
        {
            if (Exist_in_Group()==false)
                  Join_To_WorkGroup(User_Name, User_PIN_Code);  // عضویت در گروه مورد نظر
            //Session متغیر است که در کل سولوشن در دسترس است
            Response.Redirect("ExamQuestion.aspx");
        }

    }


    Boolean Exist_in_Group()
    {

        Boolean flg = true;
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = " Select * From  tblWorkgroup where   WgUID=@P1 and WgExamID=@P2";
        cmd.Parameters.AddWithValue("@P1", Session["ud"]);
        cmd.Parameters.AddWithValue("@P2", Session["exid"]);
        cnn.Open();
        dr = cmd.ExecuteReader();
        if (dr.Read() == true)
            flg = true;
        else
            flg = false;
        cnn.Close();
        return flg;

    }

    void Join_To_WorkGroup(string nm,string pn)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = "insert into tblWorkgroup Select Uid,ExamID From tblUser Cross Join tblExam where   uname=@P1 and ExamPinCode=@P2";
        cmd.Parameters.AddWithValue("@P1", nm);
        cmd.Parameters.AddWithValue("@P2",pn);
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();

    }
}