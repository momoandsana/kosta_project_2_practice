import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Logger;

@WebServlet("/priceHistory")
public class PriceHistoryController extends HttpServlet {

    private static final Logger logger = Logger.getLogger(PriceHistoryController.class.getName());
    private PriceHistoryService priceHistoryService;

    @Override
    public void init() throws ServletException {
        PriceHistoryDAO priceHistoryDAO = new PriceHistoryDAO();
        this.priceHistoryService = new PriceHistoryService(priceHistoryDAO);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String period = request.getParameter("period");
        int productId = Integer.parseInt(request.getParameter("productId"));

        logger.info("Received request: productId=" + productId + ", period=" + period);

        try {
            // 가격 히스토리 데이터를 가져오는 비즈니스 로직 호출
            List<PriceHistoryDTO> priceHistory = priceHistoryService.getPriceHistory(productId, period);

            // 응답을 JSON으로 설정
            response.setContentType("application/json; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");

            // 데이터를 JSON으로 변환
            ObjectMapper objectMapper = new ObjectMapper();
            String json = objectMapper.writeValueAsString(priceHistory);

            // 클라이언트로 JSON 응답
            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();

            // 응답 로그 추가
            logger.info("Response sent: " + json);

        } catch (SQLException e) {
            logger.severe("SQLException: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
        } catch (NumberFormatException e) {
            logger.warning("Invalid productId: " + request.getParameter("productId"));
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid productId: " + request.getParameter("productId"));
        }
    }
}
