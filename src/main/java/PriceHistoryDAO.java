import dao.DBManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PriceHistoryDAO {

    public List<PriceHistoryDTO> getPriceHistory(int productId, String period) throws SQLException {
        List<PriceHistoryDTO> history = new ArrayList<>();

        // TRUNC(SYSDATE)를 사용하여 SYSDATE의 시간 부분을 제거하고 비교
        String query = "SELECT price_date, price FROM product_prices WHERE product_id = ? AND TRUNC(price_date) >= TRUNC(ADD_MONTHS(TRUNC(SYSDATE), -?))";
        int months = 1; // 기본 1개월

        if ("3months".equals(period)) {
            months = 3;
        } else if ("6months".equals(period)) {
            months = 6;
        }

        // 쿼리 실행 전에 로그 출력
        System.out.println("Executing query: " + query);
        System.out.println("Parameters - productId: " + productId + ", months: " + months);

        try (Connection connection = DBManager.getConnection();
             PreparedStatement ps = connection.prepareStatement(query))
        {
            ps.setInt(1, productId);
            ps.setInt(2, months);

            ResultSet rs = ps.executeQuery();

            // 쿼리 실행 후 결과를 확인
            if (!rs.isBeforeFirst())
            {
                System.out.println("DAO , No records found for productId: " + productId + " and period: " + period);
            }

            while (rs.next())
            {
                String priceDate = rs.getString("price_date");
                int price = rs.getInt("price");

                // 각 레코드 출력
                System.out.println("Record found - Date: " + priceDate + ", Price: " + price);

                history.add(new PriceHistoryDTO(priceDate, price));
            }
        }
        return history;
    }
}
