package controller;

import model.*;
import service.*;
import service.impl.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractServlet", value = "/contract")
public class ContractServlet extends HttpServlet {
    IContractDetailService iContractDetailService = new ContractDetailService();
    IContractService iContractService = new ContractService();
    IAttachFacilityService iAttachFacilityService = new AttachFacilityService();
    IEmployeeService iEmployeeService = new EmployeeService();
    ICustomerService iCustomerService = new CustomerService();
    IFacilityService iFacilityService = new FacilityService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "show":
                break;
            case "add":
                break;
            default:
                showList(request, response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract/list.jsp");
        List<Customer> customerList = iCustomerService.findAll();
        List<Employee> employeeList = iEmployeeService.findAll();
        List<Facility> facilityList = iFacilityService.findAll();

        request.setAttribute("customerList", customerList);
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("facilityList", facilityList);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<ContractDetail> contractDetailList = iContractDetailService.findAll();
        List<AttachFacility> attachFacilityList = iAttachFacilityService.findAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/contract/create.jsp");
        request.setAttribute("contractDetailList", contractDetailList);
        request.setAttribute("attachFacilityList", attachFacilityList);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                createContract(request, response);
                break;
            case "add":
                break;
            default:
                break;
        }
    }



    private void createContract(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        double deposit = Double.parseDouble(request.getParameter("deposit"));
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        int facilityId = Integer.parseInt(request.getParameter("facilityId"));

        Contract contract = new Contract(id, startDate, endDate, deposit, employeeId, customerId, facilityId);

        boolean check = iContractService.create(contract);
        String mess = "Add new contract successfully.";
        if (!check) {
            mess = "Add new contract failed.";
        }

        request.setAttribute("mess", mess);
        request.setAttribute("check", check);

        showCreateForm(request, response);
    }
}
