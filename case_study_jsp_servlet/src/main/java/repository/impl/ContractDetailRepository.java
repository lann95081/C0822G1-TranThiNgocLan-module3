package repository.impl;

import model.AttachFacility;
import model.ContractDetail;
import repository.BaseRepository;
import repository.IContractDetailRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractDetailRepository implements IContractDetailRepository {
    private static final String FIND_ALL = "select * from contract_detail;";
    private static final String INSERT = "insert into contract_detail(quanity, contract_id, attach_facility_id) " +
            "values(?,?,?);";
    private static final String SHOW_ATTACH_FACILITY = "select * from contract_detail where contract_id = ?;";

    @Override
    public List<ContractDetail> findAll() {
        List<ContractDetail> contractDetailList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int contractDetailId = resultSet.getInt("contract_detail_id");
                int quanity = resultSet.getInt("quanity");
                int contractId = resultSet.getInt("contract_id");
                int attachFacilityId = resultSet.getInt("attach_facility_id");

                ContractDetail contractDetail = new ContractDetail(contractDetailId, quanity, contractId, attachFacilityId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return contractDetailList;
    }

    @Override
    public boolean create(ContractDetail contractDetail) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);

            preparedStatement.setDouble(1, contractDetail.getQuantity());
            preparedStatement.setInt(2, contractDetail.getContractId());
            preparedStatement.setInt(3, contractDetail.getAttachFacilityId());

            int num = preparedStatement.executeUpdate();
            return (num == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<ContractDetail> showAttachFacility(int id) {
        List<ContractDetail> contractDetailList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SHOW_ATTACH_FACILITY);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int contractDetailId = resultSet.getInt("contract_detail_id");
                int quanity = resultSet.getInt("quanity");
                int contractId = resultSet.getInt("contract_id");
                int contractFacilityId = resultSet.getInt("attach_facility_id");

                ContractDetail contractDetail = new ContractDetail(contractDetailId, quanity, contractId, contractFacilityId);
                contractDetailList.add(contractDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractDetailList;
    }
}
