import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Customer> customerList = new ArrayList<>();

        customerList.add(new Customer(1, "Trần Thị Thuý Diễm", "17/02/2001", "Quảng Nam",
                "https://scontent.fsgn2-2.fna.fbcdn.net/v/t39.30808-6/317424859_2333726990124963_1906024331267008338_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=98ZfY5bspTQAX83pHFF&_nc_oc=AQnqmVR9aV06yN2ZxV7k655zYVvlNKcTHoI4Dw0Ow1S_XpQE01qFhmCOuQc6GxOWahg&_nc_ht=scontent.fsgn2-2.fna&oh=00_AfCXSUKZSYLLq3AysGxY1-AbdS74MxWvCPh9VA8tKTgHhQ&oe=638CABCA"));
        customerList.add(new Customer(2, "Trần Thị Ngọc Lan", "24/05/2004", "Quảng Bình",
                "https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/233060337_308419567734648_2928648254252046105_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_ohc=RekMr5Dbc4cAX8QeGsV&_nc_ht=scontent.fsgn2-1.fna&oh=00_AfCvy1SLPKN67cRJO-1UzDSVZLjUfr_v5fzT0tqkv7IwQA&oe=638B728D"));
        customerList.add(new Customer(3, "Trần Bá Tài", "22/02/2004", "Huế",
                "https://scontent.fsgn2-6.fna.fbcdn.net/v/t39.30808-6/274545867_469410678069195_6258459013930682026_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Zlu7yN-bjm0AX_07jlN&_nc_ht=scontent.fsgn2-6.fna&oh=00_AfClpJNoj-3Dg-Bpd8tKYJzbNCaguYChOuzTEcJ7MG3Fpw&oe=638C1B27"));
        customerList.add(new Customer(4, "Lê Đức Nghĩa", "13/10/2003", "Đà Nẵng",
                "https://scontent.fsgn2-4.fna.fbcdn.net/v/t39.30808-6/313384627_3274695236181552_885527049588707446_n.jpg?stp=cp6_dst-jpg&_nc_cat=109&ccb=1-7&_nc_sid=e3f864&_nc_ohc=7Hky0KYgJgkAX9DZti_&_nc_ht=scontent.fsgn2-4.fna&oh=00_AfCUaTaCZUuwO8y9HbswjhJtON4eGjWIVorGLbSGQqHiHw&oe=638BA75F"));
        customerList.add(new Customer(5, "Nguyễn Trương Công Định", "12/12/1999", "Quảng Nam",
                "https://scontent.fsgn2-6.fna.fbcdn.net/v/t39.30808-6/283147485_709416146963816_915404794733567384_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=e3f864&_nc_ohc=-RzYmzGyd1YAX9YMDtx&tn=Q2XavYtBNzR-bZKr&_nc_ht=scontent.fsgn2-6.fna&oh=00_AfDwOekYvmfRz_XxWjM4Nzc75ErUgxf4yGf-IidmWBWxnw&oe=638B71B4"));

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("display.jsp");
        request.setAttribute("customerList", customerList);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
