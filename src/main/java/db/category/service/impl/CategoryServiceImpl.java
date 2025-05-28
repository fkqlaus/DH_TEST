package db.category.service.impl;

import db.category.dto.CategoryDto;
import db.category.entity.Category;
import db.category.repository.CategoryRepository;
import db.category.service.CategoryService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CategoryServiceImpl implements CategoryService {

    private final CategoryRepository categoryRepository;

    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public List<CategoryDto> findAllCategories() {
        List<Category> categories = categoryRepository.findAll();
        return convertToDtoList(categories);
    }

    public Category findById(Long id) {
        return categoryRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("카테고리가 존재하지 않습니다: " + id));
    }



    private List<CategoryDto> convertToDtoList(List<Category> categories) {
        return categories.stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }

    private CategoryDto convertToDto(Category category) {
        CategoryDto dto = new CategoryDto();
        dto.setId(category.getId());
        dto.setCategoryName(category.getCategoryName());
        // 필요시 추가 필드 매핑
        return dto;
    }
}
