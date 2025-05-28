package db.category.service;

import db.category.dto.CategoryDto;
import db.category.entity.Category;
import org.springframework.stereotype.Service;

import java.util.List;

public interface CategoryService {


    public List<CategoryDto> findAllCategories();

    public Category findById(Long id);


}
