package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepository iCustomerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return iCustomerRepository.findAll();
    }

    @Override
    public boolean create(Customer customer) {
        return iCustomerRepository.create(customer);
    }

    @Override
    public Customer findById(int customerId) {
        return iCustomerRepository.findById(customerId);
    }

    @Override
    public boolean edit(Customer customer) {
        return iCustomerRepository.edit(customer);
    }

    @Override
    public boolean delete(int customerId) {
        return iCustomerRepository.delete(customerId);
    }

    @Override
    public List<Customer> search(String nameSearch, String addressSearch, String phoneSearch) {
        return iCustomerRepository.search(nameSearch, addressSearch, phoneSearch);
    }
}
