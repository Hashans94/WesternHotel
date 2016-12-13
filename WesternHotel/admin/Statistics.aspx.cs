using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;

namespace WesternHotel.admin
{
    public partial class Statistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void ListChartType_SelectedIndexChanged(object sender, EventArgs e)
        {
            String chartType = ListChartType.SelectedValue;
            Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), chartType);
            Chart2.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), chartType);

            ListChartDimension.SelectedValue = "2D";
        }

        protected void ListChartDimension_SelectedIndexChanged(object sender, EventArgs e)
        {
            String chartType = ListChartType.SelectedValue;
            String dimentionType = ListChartDimension.SelectedValue;

            Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), chartType);
            Chart2.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), chartType);

            if(dimentionType == "3D")
            {
                Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
                Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            }
            else
            {
                Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
                Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
            }
        }
    }
}