package repository;

import model.AttachFacility;

import java.util.List;

public interface IAttachFacilityRepository {
    List<AttachFacility> findAll();
}
