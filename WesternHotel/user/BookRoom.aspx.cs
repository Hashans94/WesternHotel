using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using Microsoft.AspNet.Identity;

namespace WesternHotel.user
{
    public partial class BookRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            submit.Visible = true;
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

        protected void submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Boolean insertValid = false;

                String roomID = "";
                String username = Context.User.Identity.GetUserName();
                DateTime checkIn = Convert.ToDateTime(TextBoxCheckInDate.Text);
                DateTime checkOut = Convert.ToDateTime(TextBoxCheckOutDate.Text);
                Double roomPrice = 0;
                DateTime btime = DateTime.Now;

                String connectionString = WebConfigurationManager.ConnectionStrings["WesternHotel"].ConnectionString;

                SqlConnection con = new SqlConnection(connectionString);

                String sql;

                sql = "select * from rooms where rid=@room and rooms.rid not in (select rooms.rid from rooms inner join bookings on rooms.rid = bookings.rid and @checkin < bookings.checkout and @checkout > bookings.checkin)";

                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@room", ListRoom.SelectedValue);
                cmd.Parameters.AddWithValue("@checkin", Convert.ToDateTime(TextBoxCheckInDate.Text));
                cmd.Parameters.AddWithValue("@checkout", Convert.ToDateTime(TextBoxCheckOutDate.Text));

                using (con)
                {
                    con.Open();

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            roomID = (String)reader["rid"];
                            roomPrice = (Double)reader["price"];
                        }
                        reader.Close();
                        insertValid = true;
                    }
                    else
                    {
                        insertValid = false;
                        progressLabel.Text = "<label class='text-danger'><h3>Sorry! Your selected room is not available during selected dates!</h3></label>";
                    }

                    if (insertValid)
                    {
                        Int32 Days = Convert.ToInt32((checkOut - checkIn).TotalDays);
                        roomPrice = roomPrice * Days;

                        String sql2 = "Insert INTO bookings (rid, username, checkin, checkout, cost, btime) VALUES (@rid, @username, @checkin, @checkout, @cost, @btime)";

                        SqlCommand cmd2 = new SqlCommand(sql2, con);

                        cmd2.Parameters.AddWithValue("@rid", roomID);
                        cmd2.Parameters.AddWithValue("@username", username);
                        cmd2.Parameters.AddWithValue("@checkin", checkIn);
                        cmd2.Parameters.AddWithValue("@checkout", checkOut);
                        cmd2.Parameters.AddWithValue("@cost", roomPrice);
                        cmd2.Parameters.AddWithValue("@btime", btime);


                        int rowCount = cmd2.ExecuteNonQuery();

                        if (rowCount > 0)
                        {
                            progressLabel.Text = "<label class='text-success'><h3>Thank You! Your booking has been confirmed!</h3></label><table class='table user-table' runat='server' id='LayoutTemplateTable'><thead><tr runat='server'><th>Room ID</th><th>Check In Date</th><th>Chack Out Date</th><th>Cost</th></thead><tbody>" + "<tr><td>" + roomID + "</td>" + "<td>" + checkIn.ToShortDateString() + "</td>" + "<td>" + checkOut.ToShortDateString() + "</td>" + "<td>" + roomPrice + "</td></tr></tbody></table>";
                            submit.Visible = false;
                        }
                        else
                        {
                            progressLabel.Text = "<label class='text-danger'><h3>Sorry! Your selected room is not available during selected dates</h3></label>";
                        }

                    }
                }


            }
        }
    }
}