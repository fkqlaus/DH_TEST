package db.post.service;

import db.post.dto.PostDto;
import db.post.entity.Post;
import org.springframework.data.domain.*;
import org.springframework.stereotype.Service;

@Service
public interface PostService {

    Page<Post> findPosts(String searchTitle, Pageable pageable);
    Post getPostById(Long id);
    Post savePost(PostDto post);
    void deletePost(Long id);

}
