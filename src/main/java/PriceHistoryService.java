import java.sql.SQLException;
import java.util.List;

public class PriceHistoryService {
    private PriceHistoryDAO priceHistoryDAO;

    public PriceHistoryService(PriceHistoryDAO priceHistoryDAO) {
        this.priceHistoryDAO = priceHistoryDAO;
    }

    public List<PriceHistoryDTO> getPriceHistory(int productId, String period) throws SQLException {
        List<PriceHistoryDTO> priceHistoryList = priceHistoryDAO.getPriceHistory(productId, period);

        // 데이터를 출력하여 확인
        if (priceHistoryList.isEmpty()) {
            System.out.println("No price history found for productId: " + productId + " and period: " + period);
        } else {
            for (PriceHistoryDTO dto : priceHistoryList) {
                System.out.println("Date: " + dto.getDate() + ", Price: " + dto.getPrice());
            }
        }

        return priceHistoryList;
    }
}
