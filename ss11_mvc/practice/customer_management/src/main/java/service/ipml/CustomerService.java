package service.ipml;

import model.Customer;
import repository.CutomerRepository;
import repository.ICustomerRepository;
import service.ICustomerService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CustomerService implements ICustomerService {
 private ICustomerRepository customerRepository= new CutomerRepository();

    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

    @Override
    public void save(Customer customer) {
//        customers.add(customer.getId(), customer);
    }

    @Override
    public Customer findById(int id) {
        return null;
    }

    @Override
    public void update(Customer customer) {
//        customers.add(customer);
    }

    @Override
    public void remove(int id) {
//        customers.remove(id);
    }
}
