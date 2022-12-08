package controller;

import model.Facility;
import model.FacilityType;
import model.RentType;
import service.IFacilityService;
import service.IFacilityTypeService;
import service.IRentTypeService;
import service.impl.FacilityService;
import service.impl.FacilityTypeService;
import service.impl.RentTypeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet", value = "/facility")
public class FacilityServlet extends HttpServlet {
    private IFacilityTypeService iFacilityTypeService = new FacilityTypeService();
    private IRentTypeService iRentTypeService = new RentTypeService();
    private IFacilityService iFacilityService = new FacilityService();

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
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "search":
                searchFacility(request, response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/list.jsp");

        List<FacilityType> facilityTypeList = iFacilityTypeService.findAll();
        List<RentType> rentTypeList = iRentTypeService.findAll();
        List<Facility> facilityList = iFacilityService.findAll();

        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("facilityList", facilityList);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchFacility(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/list.jsp");

        String name = request.getParameter("nameSearch");
        String facilityType = request.getParameter("facilityTypeSearch");

        List<FacilityType> facilityTypeList = iFacilityTypeService.findAll();
        List<RentType> rentTypeList = iRentTypeService.findAll();
        List<Facility> facilityList = iFacilityService.search(name, facilityType);

        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("facilityList", facilityList);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int idDelete = Integer.parseInt(request.getParameter("idDelete"));
        boolean check = iFacilityService.delete(idDelete);
        String mess = "Delete facility successfully";
        if (!check) {
            mess = "Delete facility failed";
        }
        request.setAttribute("mess", mess);
        request.setAttribute("check", check);

        showList(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<FacilityType> facilityTypeList = iFacilityTypeService.findAll();
        List<RentType> rentTypeList = iRentTypeService.findAll();

        Facility facility = iFacilityService.findById(id);
        RequestDispatcher dispatcher;

        if (facility == null) {
            dispatcher = request.getRequestDispatcher("view/error_404.jsp");
        } else {
            request.setAttribute("facility", facility);
            dispatcher = request.getRequestDispatcher("view/facility/edit.jsp");
            request.setAttribute("facilityTypeList", facilityTypeList);
            request.setAttribute("rentTypeList", rentTypeList);
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<FacilityType> facilityTypeList = iFacilityTypeService.findAll();
        List<RentType> rentTypeList = iRentTypeService.findAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/create.jsp");
        request.setAttribute("facilityTypeList", facilityTypeList);
        request.setAttribute("rentTypeList", rentTypeList);
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
                createFacility(request, response);
                break;
            case "edit":
                updateFacility(request, response);
                break;
            default:
                break;
        }
    }

    private void updateFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String standardRoom = request.getParameter("standardRoom");
        String description = request.getParameter("description");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        String facilityFree = request.getParameter("facilityFree");
        int rentType = Integer.parseInt(request.getParameter("rentType"));
        int facilityType = Integer.parseInt(request.getParameter("type"));

        Facility facility = new Facility(id, name, area, cost, maxPeople, standardRoom, description, poolArea,
                numberOfFloors, facilityFree, rentType, facilityType);

        boolean check = iFacilityService.edit(facility);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/facility/edit.jsp");
        String mess = "Update facility successfully";
        if (!check) {
            mess = "Update facility failed";
        }
        request.setAttribute("mess", mess);
        request.setAttribute("check", check);

        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createFacility(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("facilityName");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        String standardRoom = request.getParameter("standardRoom");
        String description = request.getParameter("description");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        String facilityFree = request.getParameter("facilityFree");
        int rentType = Integer.parseInt(request.getParameter("rentType"));
        int facilityType = Integer.parseInt(request.getParameter("facilityType"));

        Facility facility = new Facility(name, area, cost, maxPeople, standardRoom, description, poolArea,
                numberOfFloors, facilityFree, rentType, facilityType);

        boolean check = iFacilityService.create(facility);
        String mess = "Add new facility successfully";
        if (!check) {
            mess = "Add new facility failed";
        }

        request.setAttribute("mess", mess);
        request.setAttribute("check", check);

        showCreateForm(request, response);
    }
}
