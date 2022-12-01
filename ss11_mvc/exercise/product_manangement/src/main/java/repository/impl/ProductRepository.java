package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> products = new ArrayList<>();

    static {
        products.add(new Product(1, "Bơ", 12000, "Ngon bổ rẻ", "Nhà"));
        products.add(new Product(2, "Hồng", 30000, "Ngon hơm", "Nhà Nận"));
        products.add(new Product(3, "Dâu", 40000, "Hơi đát nha", "Không phải nhà Nận"));
        products.add(new Product(4, "Táo", 50000, "Giòn ngọt", "Nhà Diễm"));
    }

    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public void save(Product product) {
        products.add(product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.add(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> searchList = new ArrayList<>();
        for (Product item : findAll()) {
            if (item.getName().contains(name)) {
                searchList.add(item);
            }
        }
        return searchList;
    }
}
