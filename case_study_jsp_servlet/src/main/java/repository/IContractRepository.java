package repository;

import model.Contract;

import java.util.List;

public interface IContractRepository {
    List<Contract> findAll();

    boolean create(Contract contract);
}
