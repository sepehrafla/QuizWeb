using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
public partial class UserDefine : System.Web.UI.Page
{
    SqlConnection cnn = new SqlConnection(ConfigurationManager.AppSettings["dbpath"]);

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = "Insert into tblUser (UInfo,UName) Values (@P1,@P2)";
        cmd.Parameters.AddWithValue("@P1", txtInfo.Text);
        cmd.Parameters.AddWithValue("@P2", txtUserName.Text);
        cnn.Open();
        cmd.ExecuteNonQuery();
        cnn.Close();

        Response.Redirect("index.aspx");
    }
}