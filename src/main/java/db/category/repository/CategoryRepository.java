package db.category.repository;

import db.category.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

    // 카테고리 이름으로 카테고리 조회
    Category findByCategoryName(String categoryName);

    Category findAllBy();
}
