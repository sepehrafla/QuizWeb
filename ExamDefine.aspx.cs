using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class ExamDefine : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(ConfigurationManager.AppSettings["dbpath"]);

    string CreateMyPin()
    {
        string tmp = "";
        int n;
        Random obj = new Random();
        n = obj.Next(10000);
        char ch;
        ch = Convert.ToChar(obj.Next(26) + 65);
        string s = n.ToString().Trim() + ch.ToString();
        //char ch;
        //ch =Convert.ToChar( n);
        tmp= s.Trim();
        return tmp;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ud"] == null || Session["exid"] == null) Response.Redirect("Login.aspx");

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        
        string fn = "";
        
        if (FileUpload1.HasFile == true) 
        {
            fn = FileUpload1.FileName;//نام فایل انتخاب شده

            string des = "";
            // des = Server.MapPath(""); // مسیر اصلی روت هاست
            des = Server.MapPath("ExamImages\\");

            FileUpload1.PostedFile.SaveAs(des + fn);  //آپلود فایل انتخاب شده به مسیر مورد نظر روی هاست

        }



        string tmp = CreateMyPin();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = "Insert into tblExam (ExamName,ExamPinCode,ExamUID,ExamImg) Values (@P1,@P2,@P3,@P4)";
        cmd.Parameters.AddWithValue("@P1", txtName.Text);
        cmd.Parameters.AddWithValue("@P2", tmp);
        cmd.Parameters.AddWithValue("@P3", Session["ud"]); //کد کاربرلاگ این شده
        cmd.Parameters.AddWithValue("@P4",fn); //نام فایل انتخاب شده
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();

        lblMsg.Text = "Pin Code:" + tmp;
        btnSave.Enabled = false;

    }
}