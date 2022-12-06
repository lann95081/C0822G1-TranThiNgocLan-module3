package repository;

import model.FacilityType;

import java.util.List;

public interface IFacilityTypeRepository {
    List<FacilityType> findAll();
}
