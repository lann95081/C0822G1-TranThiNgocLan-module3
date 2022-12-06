package repository.impl;

import model.Facility;
import repository.IFacilityRepository;

import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    @Override
    public List<Facility> findAll() {
        return null;
    }

    @Override
    public boolean create(Facility facility) {
        return false;
    }

    @Override
    public Facility findById(int idFind) {
        return null;
    }

    @Override
    public boolean edit(Facility facility) {
        return false;
    }

    @Override
    public boolean delete(int idDelete) {
        return false;
    }

    @Override
    public List<Facility> search(String nameSearch, String facilityTypeSearch) {
        return null;
    }
}
