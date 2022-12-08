package service.impl;

import model.AttachFacility;
import repository.IAttachFacilityRepository;
import repository.impl.AttachFacilityRepository;
import service.IAttachFacilityService;

import java.util.List;

public class AttachFacilityService implements IAttachFacilityService {
    IAttachFacilityRepository iAttachFacilityRepository = new AttachFacilityRepository();

    @Override
    public List<AttachFacility> findAll() {
        return iAttachFacilityRepository.findAll();
    }
}
