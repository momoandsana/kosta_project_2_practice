import dao.DBManager; // DBManager 클래스를 임포트하여 데이터베이스 연결 관리

import java.sql.Connection; // JDBC 연결을 위한 Connection 클래스 임포트
import java.sql.PreparedStatement; // PreparedStatement 클래스를 임포트하여 SQL 쿼리 실행
import java.sql.ResultSet; // SQL 쿼리 결과를 처리하기 위한 ResultSet 클래스 임포트
import java.sql.SQLException; // SQL 예외 처리를 위한 SQLException 클래스 임포트
import java.util.ArrayList; // 동적 배열을 위한 ArrayList 클래스 임포트
import java.util.List; // 리스트 인터페이스를 임포트

public class PriceHistoryDAO { // PriceHistoryDAO 클래스 정의

    public List<PriceHistoryDTO> getPriceHistory(int productId, String period) throws SQLException { // 가격 히스토리를 가져오는 메서드
        List<PriceHistoryDTO> history = new ArrayList<>(); // 가격 히스토리 DTO 객체를 저장할 리스트 생성

        // 가격 히스토리를 조회할 쿼리
        String query = "SELECT price_date, price FROM product_prices WHERE product_id = ? AND price_date >= TRUNC(ADD_MONTHS(SYSDATE, -?))"; // 쿼리 문자열
        int months = 1; // 기본 기간을 1개월로 설정

        // period에 따라 months 값을 설정
        if ("3months".equals(period)) { // 3개월이면
            months = 3; // months 값을 3으로 설정
        } else if ("6months".equals(period)) { // 6개월이면
            months = 6; // months 값을 6으로 설정
        }

        // 쿼리 실행 전에 로그 출력
        System.out.println("Executing query: " + query); // 실행할 쿼리 로그
        System.out.println("Parameters - productId: " + productId + ", months: " + months); // 파라미터 로그

        // 데이터베이스 연결 및 쿼리 실행
        try (Connection connection = DBManager.getConnection(); // 데이터베이스 연결
             PreparedStatement ps = connection.prepareStatement(query)) { // PreparedStatement 생성

            ps.setInt(1, productId); // 첫 번째 물음표에 productId 설정
            ps.setInt(2, months); // 두 번째 물음표에 months 설정

            ResultSet rs = ps.executeQuery(); // 쿼리 실행하고 결과를 ResultSet에 저장

            // 쿼리 실행 후 결과를 확인
            if (!rs.isBeforeFirst()) { // 결과가 없으면
                System.out.println("DAO , No records found for productId: " + productId + " and period: " + period); // 결과가 없다는 로그
            }

            // 결과를 반복 처리
            while (rs.next()) { // 결과셋에 다음 레코드가 있을 때까지 반복
                String priceDate = rs.getString("price_date"); // 가격 날짜를 가져옴
                int price = rs.getInt("price"); // 가격을 가져옴

                // 각 레코드 출력
                System.out.println("Record found - Date: " + priceDate + ", Price: " + price); // 레코드 정보 로그

                history.add(new PriceHistoryDTO(priceDate, price)); // 리스트에 DTO 객체 추가
            }
        }
        return history; // 가격 히스토리 리스트 반환
    }
}
