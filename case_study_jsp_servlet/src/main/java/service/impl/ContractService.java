package service.impl;

import model.Contract;
import repository.IContractRepository;
import repository.impl.ContractRepository;
import service.IContractService;

import java.util.List;

public class ContractService implements IContractService {
    IContractRepository iContractRepository = new ContractRepository();

    @Override
    public List<Contract> findAll() {
        return iContractRepository.findAll();
    }

    @Override
    public boolean create(Contract contract) {
        return iContractRepository.create(contract);
    }
}
