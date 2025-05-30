package db.post.service;

import db.post.dto.PostDto;
import db.post.entity.Post;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

import java.util.List;

public interface PostService {

    Page<Post> findPosts(String searchTitle, Pageable pageable,
                         String categoryName);
    PostDto getPostById(Long id);
    PostDto savePost(PostDto post);
    void deletePost(Long id);
    PostDto updatePost(PostDto postDto);
    Page<PostDto> findPostsbyCategoryId(Long Id,Pageable pageable);


}
