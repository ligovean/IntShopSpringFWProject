package com.geekbrains.geekspring.repositories;

import com.geekbrains.geekspring.entities.Product;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {
    Product findOneById(Long id);
    List<Product> findAll();
}
