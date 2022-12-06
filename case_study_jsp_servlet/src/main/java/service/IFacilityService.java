package service;

import model.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> findAll();

    boolean create(Facility facility);

    Facility findById(int idFind);

    boolean edit(Facility facility);

    boolean delete(int idDelete);

    List<Facility> search(String nameSearch, String facilityTypeSearch);
}
