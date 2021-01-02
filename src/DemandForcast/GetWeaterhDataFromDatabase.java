package DemandForcast;

import java.sql.*;
import java.util.Map;

public class GetWeaterhDataFromDatabase {
    public void test(Map<String,Double> temperatureSeries) {
        GetWeaterhDataFromDatabase city = new GetWeaterhDataFromDatabase();
        try {
            city.getTemperatureSeries("hour_weather_changshu",temperatureSeries);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Database issue! Cannot get weather data this time, will try later!");
        }
    }

    public void getTemperatureSeries(String dataSheetName, Map<String,Double> sevenTemperature) throws SQLException, ClassNotFoundException {

        try (Connection conn = getconn() ) {
            String sql = "SELECT * FROM \"hour_weather_changshu\" where weathertimestamp > ? and weathertimestamp < ? ORDER BY weathertimestamp";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "2020-12-03 00:00:00");
            pstmt.setString(2, "2020-12-15 00:00:00");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                sevenTemperature.put(rs.getString("weathertimestamp"), rs.getDouble("temperature"));
            }
            System.out.println(" ");
        }
    }

    public Connection getconn() {
        String driver = "org.postgresql.Driver";
        String url = "jdbc:postgresql://localhost:5433/weatherData";
        String username = "postgres";
        String password = "123";
        Connection conn = null;
        try {
            Class.forName(driver); // classLoader,加载对应驱动
            conn = (Connection) DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
