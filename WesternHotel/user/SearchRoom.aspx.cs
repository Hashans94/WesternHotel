using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WesternHotel.user
{
    public partial class SearchRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                String connectionString = WebConfigurationManager.ConnectionStrings["WesternHotel"].ConnectionString;

                SqlConnection con = new SqlConnection(connectionString);

                String sql;

                if (ListOrientation.SelectedValue != "")
                {
                    sql = "select * from rooms where beds=@num_bed and orientation=@ori and rooms.rid not in (select rooms.rid from rooms inner join bookings on rooms.beds = @num_bed and rooms.orientation = @ori and rooms.rid = bookings.rid and @checkin < bookings.checkout and @checkout > bookings.checkin)";
                }
                else
                {
                    sql = "select * from rooms where beds=@num_bed and rooms.rid not in (select rooms.rid from rooms inner join bookings on rooms.beds = @num_bed and rooms.rid = bookings.rid and @checkin < bookings.checkout and @checkout > bookings.checkin)";
                }

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@num_bed", ListBeds.SelectedValue);
                cmd.Parameters.AddWithValue("@ori", ListOrientation.SelectedValue);
                cmd.Parameters.AddWithValue("@checkin", Convert.ToDateTime(TextBoxCheckInDate.Text));
                cmd.Parameters.AddWithValue("@checkout", Convert.ToDateTime(TextBoxCheckOutDate.Text));

                using (con)
                {
                    con.Open();

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {

                        DynamicTable.Text = "<table class='table user-table' runat='server' id='LayoutTemplateTable'><thead><tr runat='server'><th>Room ID</th><th>Level</th><th>Beds</th><th>Orientation</th><th>Price</th></tr></thead><tbody>";


                        while (reader.Read())
                        {
                            DynamicTable.Text = DynamicTable.Text + "<tr>" + "<td>" + reader["rid"] + "</td>" + "<td>" + reader["level"] + "</td>" + "<td>" + reader["beds"] + "</td>" + "<td>" + reader["orientation"] + "</td>" + "<td>" + String.Format("{0:N}" ,reader["price"]) + "</td>" + "</tr>" ;
                        }
                        DynamicTable.Text = DynamicTable.Text + "</tbody></table>";
                    }
                    else
                    {
                        DynamicTable.Text = "<h2 class='text-danger'>NO RESULTS FOUND</h2>";
                    }
                }
            }
        }

        protected void ValidateDate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime date = new DateTime();

            if (DateTime.TryParse(TextBoxCheckInDate.Text, out date))
            {
                if (date < DateTime.Now)
                {
                    ValidateCheckInDate.Text = "Entered Date Must Be After Todays Date!";
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
        }

        protected void ValidateCheckOutDate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime date = new DateTime();

            if (DateTime.TryParse(TextBoxCheckOutDate.Text, out date))
            {
                if (date < Convert.ToDateTime(TextBoxCheckInDate.Text))
                {
                    ValidateCheckOutDate.Text = "Entered Date Must Be After Check In Date!";
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }

        }
    }
}