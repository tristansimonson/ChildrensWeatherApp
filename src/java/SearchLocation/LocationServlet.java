/**
 *
 * @author tristan
 */
package SearchLocation;

//import net.sf.json.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.*;
//import java.util.Map;
import javax.servlet.annotation.WebServlet;
  

@WebServlet(name = "LocationServlet", urlPatterns = {"/LocationServlet/*"})
public class LocationServlet extends HttpServlet {
        
        @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
                throws ServletException, IOException {
            
            // Collect parameters
            String cityState=request.getParameter("cityState");
            
            // Try to connect to DB
            try {
            Class.forName("com.mysql.jdbc.Driver");
            // loads driver
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/childrens_weatherdb", "root", "NewPassword"); // gets a new connection
            PreparedStatement ps = c.prepareStatement("Select cityState, time, temperatureF, temperatureC, highTemperatureF, highTemperatureC, lowTemperatureF, lowTemperatureC, wind, tomorrowHighF, tomorrowHighC, tomorrowLowF, tomorrowLowC from today where cityState='" + cityState + "'");
            ResultSet rs = ps.executeQuery();
            
            String time = "";
            String temperatureF = "";
            String temperatureC = "";
            String highTemperatureF = "";
            String highTemperatureC = "";
            String lowTemperatureF = "";
            String lowTemperatureC = "";
            String wind = "";
            String tomorrowHighF = "";
            String tomorrowHighC = "";
            String tomorrowLowF = "";
            String tomorrowLowC = "";

            // save results of query in variables
            if(rs.next()){
                cityState = rs.getString(1);
                time = rs.getString(2);
                temperatureF = rs.getString(3);
                temperatureC = rs.getString(4);
                highTemperatureF = rs.getString(5);
                highTemperatureC = rs.getString(6);
                lowTemperatureF = rs.getString(7);
                lowTemperatureC = rs.getString(8);
                wind = rs.getString(9);
                tomorrowHighF = rs.getString(10);
                tomorrowHighC = rs.getString(11);
                tomorrowLowF = rs.getString(12);
                tomorrowLowC = rs.getString(13);
            }
            
            if(cityState != ""){
                String jcontent = "{\"cityState\": \"" + cityState + "\", \"time\": \"" + time + "\", \"temperatureF\": \"" + temperatureF + "\", \"temperatureC\": \"" + temperatureC + "\", \"highTemperatureF\": \"" + highTemperatureF + "\", \"highTemperatureC\": \"" + highTemperatureC + "\", \"lowTemperatureF\": \"" + lowTemperatureF + "\", \"lowTemperatureC\": \"" + lowTemperatureC + "\", \"wind\": \"" + wind + "\", \"tomorrowHighF\": \"" + tomorrowHighF + "\", \"tomorrowHighC\": \"" + tomorrowHighC + "\", \"tomorrowLowF\": \"" + tomorrowLowF + "\", \"tomorrowLowC\": \"" + tomorrowLowC + "\"}";
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");
                // Get printwriter object from response to write json object to output stream      
                PrintWriter out = response.getWriter();
                // return json object  
                out.print(jcontent);
                out.flush();
            }
            else{
                response.sendRedirect("error.html");
            }
            }catch (ClassNotFoundException | SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
            }
        }
}
