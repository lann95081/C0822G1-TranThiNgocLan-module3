package service.impl;

import model.Facility;
import repository.IFacilityRepository;
import repository.impl.FacilityRepository;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    IFacilityRepository iFacilityRepository = new FacilityRepository();

    @Override
    public List<Facility> findAll() {
        return iFacilityRepository.findAll();
    }

    @Override
    public boolean create(Facility facility) {
        return iFacilityRepository.create(facility);
    }

    @Override
    public Facility findById(int idFind) {
        return iFacilityRepository.findById(idFind);
    }

    @Override
    public boolean edit(Facility facility) {
        return iFacilityRepository.edit(facility);
    }

    @Override
    public boolean delete(int idDelete) {
        return iFacilityRepository.delete(idDelete);
    }

    @Override
    public List<Facility> search(String nameSearch, String facilityTypeSearch) {
        return iFacilityRepository.search(nameSearch, facilityTypeSearch);
    }
}
