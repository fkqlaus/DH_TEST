package db.post.repository;

import db.post.entity.Post;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {

    Page <Post> findAll(Pageable pageable);

    Page<Post> findByPostTitleContainingAndCategory_CategoryName(String searchTitle, String categoryName, Pageable pageable);

    Page<Post> findByPostTitleContaining(String searchTitle, Pageable pageable);

//    Page<Post> findByCategory_CategoryId(Long categoryId, Pageable pageable);

    Page<Post> findByCategoryId(Long categoryId, Pageable pageable);

    Page<Post> findByCategory_CategoryName(String categoryCategoryName, Pageable pageable);

}
