package model;

public class ContractDetail {
    private int contractDetailId;
    private int contractId;
    private int attachFacilityId;
    private int quantity;

    public ContractDetail() {
    }

    public ContractDetail(int contractDetailId, int contractId, int attachFacilityId, int quantity) {
        this.contractDetailId = contractDetailId;
        this.contractId = contractId;
        this.attachFacilityId = attachFacilityId;
        this.quantity = quantity;
    }

    public ContractDetail(int contractId, int attachFacilityId, int quantity) {
        this.contractId = contractId;
        this.attachFacilityId = attachFacilityId;
        this.quantity = quantity;
    }

    public int getContractDetailId() {
        return contractDetailId;
    }

    public void setContractDetailId(int contractDetailId) {
        this.contractDetailId = contractDetailId;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public int getAttachFacilityId() {
        return attachFacilityId;
    }

    public void setAttachFacilityId(int attachFacilityId) {
        this.attachFacilityId = attachFacilityId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
