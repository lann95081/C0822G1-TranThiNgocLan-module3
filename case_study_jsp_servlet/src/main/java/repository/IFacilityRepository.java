package repository;

import model.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> findAll();

    boolean create(Facility facility);

    Facility findById(int idFind);

    boolean edit(Facility facility);

    boolean delete(int idDelete);

    List<Facility> search(String nameSearch, String facilityTypeSearch);
}
