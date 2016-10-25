using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data.SqlClient;

public partial class BrandList : System.Web.UI.Page
{
    public SqlConnection cnn = new SqlConnection(ConfigurationManager.AppSettings["dbpath"]);
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Page.IsPostBack==false)  //اگربار اول است که صفحه بارگذاری میشود
            BindGrid(); //Call Function
    }

    // Define Function
    void BindGrid()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cnn;
        cmd.CommandText = "select * from tblBrand order by BrandName";
        cnn.Open();
        //cmd.ExecuteNonQuery();
        gvBrand.DataSource = cmd.ExecuteReader();//Run SQL Command & return Records
        gvBrand.DataBind();
        cnn.Close();
    }

    
}