import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("firstOperand"));
        double secondOperand = Double.parseDouble(request.getParameter("secondOperand"));

        double addition = firstOperand + secondOperand;
        double subtraction = firstOperand - secondOperand;
        double multiplication = firstOperand * secondOperand;
        double division = firstOperand / secondOperand;

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("addition", addition);
        request.setAttribute("subtraction", subtraction);
        request.setAttribute("multiplication", multiplication);
        request.setAttribute("division", division);
        requestDispatcher.forward(request, response);
    }
}
