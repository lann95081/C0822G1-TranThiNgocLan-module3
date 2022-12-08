package repository;

import model.ContractDetail;

import java.util.List;

public interface IContractDetailRepository {
    List<ContractDetail> findAll();

    boolean create(ContractDetail contractDetail);

    List<ContractDetail> showAttachFacility(int id);
}
