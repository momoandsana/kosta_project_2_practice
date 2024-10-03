import com.fasterxml.jackson.databind.ObjectMapper; // JSON 변환을 위한 ObjectMapper 클래스 임포트
import jakarta.servlet.ServletException; // 서블릿 예외 처리 클래스 임포트
import jakarta.servlet.annotation.WebServlet; // 서블릿 어노테이션 클래스 임포트
import jakarta.servlet.http.HttpServlet; // HttpServlet 클래스를 임포트
import jakarta.servlet.http.HttpServletRequest; // HTTP 요청 객체 임포트
import jakarta.servlet.http.HttpServletResponse; // HTTP 응답 객체 임포트

import java.io.IOException; // IO 예외 처리 클래스 임포트
import java.io.PrintWriter; // 응답 출력 스트림 클래스 임포트
import java.sql.SQLException; // SQL 예외 처리 클래스 임포트
import java.util.List; // 리스트 클래스를 임포트
import java.util.logging.Logger; // 로깅 클래스 임포트

@WebServlet("/priceHistory") // "/priceHistory" URL 패턴에 대해 이 서블릿을 매핑
public class PriceHistoryController extends HttpServlet {

    private static final Logger logger = Logger.getLogger(PriceHistoryController.class.getName()); // 로거 인스턴스 생성
    private PriceHistoryService priceHistoryService; // 가격 히스토리 서비스를 저장할 변수

    @Override
    public void init() throws ServletException { // 서블릿 초기화 메서드
        PriceHistoryDAO priceHistoryDAO = new PriceHistoryDAO(); // 가격 히스토리 DAO 인스턴스 생성
        this.priceHistoryService = new PriceHistoryService(priceHistoryDAO); // 서비스 인스턴스 초기화
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // GET 요청 처리
        String period = request.getParameter("period"); // 요청 파라미터에서 기간을 가져옴
        int productId = Integer.parseInt(request.getParameter("productId")); // 요청 파라미터에서 productId를 정수로 변환

        logger.info("Received request: productId=" + productId + ", period=" + period); // 요청 정보 로그

        try {
            // 가격 히스토리 데이터를 가져오는 비즈니스 로직 호출
            List<PriceHistoryDTO> priceHistory = priceHistoryService.getPriceHistory(productId, period); // 가격 히스토리 가져오기

            // 응답을 JSON으로 설정
            response.setContentType("application/json; charset=UTF-8"); // 응답 콘텐츠 유형 설정
            response.setCharacterEncoding("UTF-8"); // 응답 문자 인코딩 설정

            // 데이터를 JSON으로 변환
            ObjectMapper objectMapper = new ObjectMapper(); // ObjectMapper 인스턴스 생성
            String json = objectMapper.writeValueAsString(priceHistory); // 가격 히스토리를 JSON 문자열로 변환

            // 클라이언트로 JSON 응답
            PrintWriter out = response.getWriter(); // 응답 출력 스트림 생성
            out.print(json); // JSON 데이터를 출력
            out.flush(); // 출력 버퍼 비우기

            // 응답 로그 추가
            logger.info("Response sent: " + json); // 응답 데이터 로그

        } catch (SQLException e) { // SQL 예외 처리
            logger.severe("SQLException: " + e.getMessage()); // 에러 메시지 로그
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage()); // 500 내부 서버 오류 응답
        } catch (NumberFormatException e) { // 숫자 형식 예외 처리
            logger.warning("Invalid productId: " + request.getParameter("productId")); // 잘못된 productId 경고 로그
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid productId: " + request.getParameter("productId")); // 400 잘못된 요청 응답
        }
    }
}
