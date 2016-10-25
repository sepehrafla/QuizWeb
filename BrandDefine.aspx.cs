using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//1 Name Space or Main Class
using System.Configuration;
using System.Data.SqlClient;
  
public partial class BrandDefine : System.Web.UI.Page
{
    //2 Define global cnn Object
    //وظیفه : برقراری ارتباط با بانک اطلاعاتی
    public SqlConnection cnn = new SqlConnection(ConfigurationManager.AppSettings["dbpath"]);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("BrandList.aspx");

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {

        //3 define cmd Object -Local
        //وظیفه:اجرای دستور اس کیوال روی جدول
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        //cmd.CommandText = "Insert into tblBrand (BrandName,BrandLogo) Values ('Toyota','ty.jpg')";
        cmd.CommandText = "Insert into tblBrand (BrandName,BrandLogo) Values (@P1,@P2)";
        cmd.Parameters.AddWithValue("@P1", txtName.Text);
        cmd.Parameters.AddWithValue("@P2", "");  // نام فایل لوگو

        cnn.Open(); //Open DataBase
        cmd.ExecuteNonQuery(); // Run SQL Command without any returned Value
        cnn.Close();//Close DataBase
        Response.Redirect("BrandList.aspx");
    }
}