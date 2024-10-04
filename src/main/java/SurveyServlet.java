import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/SurveyServlet")
public class SurveyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 설문조사 데이터 가져오기
        String question1 = request.getParameter("question1");
        String question2 = request.getParameter("question2");
        String question3 = request.getParameter("question3");
        String question4 = request.getParameter("question4");
        String question5 = request.getParameter("question5");
        String question6 = request.getParameter("question6");
        String question7 = request.getParameter("question7");
        String question8 = request.getParameter("question8");
        String question9 = request.getParameter("question9");
        String question10 = request.getParameter("question10");

        // 데이터를 서버 콘솔에 출력
        System.out.println("질문 1: 발볼이 넓은 편인가요? " + question1);
        System.out.println("질문 2: 운동화의 착용감이 신발 선택에서 중요한 요소인가요? " + question2);
        System.out.println("질문 3: 주로 러닝 또는 피트니스 목적으로 신발을 사용하시나요? " + question3);
        System.out.println("질문 4: 레트로 또는 빈티지한 신발 디자인을 좋아하시나요? " + question4);
        System.out.println("질문 5: 깔끔한 미니멀 디자인의 신발을 선호하시나요? " + question5);
        System.out.println("질문 6: 방수 또는 방한 기능이 있는 신발을 자주 신으시나요? " + question6);
        System.out.println("질문 7: 평소 신발의 브랜드를 중요하게 생각하시나요? " + question7);
        System.out.println("질문 8: 화려하거나 눈에 띄는 색상의 신발을 선호하시나요? " + question8);
        System.out.println("질문 9: 일상에서 주로 신을 신발을 찾으시나요? " + question9);
        System.out.println("질문 10: 고급스럽고 럭셔리한 디자인의 신발을 좋아하시나요? " + question10);

        // 결과 페이지로 리다이렉트
        response.sendRedirect("thankyou.jsp");  // 설문조사 후 리다이렉트할 페이지
    }
}
