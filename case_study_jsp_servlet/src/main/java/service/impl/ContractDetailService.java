package service.impl;

import model.ContractDetail;
import repository.IContractDetailRepository;
import repository.impl.ContractDetailRepository;
import service.IContractDetailService;

import java.util.List;

public class ContractDetailService implements IContractDetailService {
    IContractDetailRepository iContractDetailRepository = new ContractDetailRepository();

    @Override
    public List<ContractDetail> findAll() {
        return iContractDetailRepository.findAll();
    }

    @Override
    public boolean create(ContractDetail contractDetail) {
        return iContractDetailRepository.create(contractDetail);
    }

    @Override
    public List<ContractDetail> showAttachFacility(int id) {
        return iContractDetailRepository.showAttachFacility(id);
    }
}
