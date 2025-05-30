package db.post.service.impl;

import db.category.service.CategoryService;
import db.post.dto.PostDto;
import db.post.entity.Post;
import db.post.repository.PostRepository;
import db.post.service.PostService;
import db.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional
public class PostServiceImpl implements PostService {

    private final PostRepository postRepository;
    private final UserService userService;
    private final CategoryService categoryService;

    @Override
    public Page<Post> findPosts(String searchTitle, Pageable pageable, String categoryName) {

        if (searchTitle != null && !searchTitle.isEmpty()) {
//            return postRepository.findByPostTitleContaining(searchTitle, pageable);
            return postRepository.findByPostTitleContainingAndCategory_CategoryName(searchTitle, categoryName, pageable);
        }
        return postRepository.findByCategory_CategoryName(categoryName, pageable);
    }

    @Override
    public PostDto getPostById(Long id) {
        return convertToDto(postRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("게시글이 존재하지 않습니다: " + id)));
    }

    @Override
    public PostDto savePost(PostDto post) {
        return convertToDto(postRepository.save(convertToEntity(post)));
    }

    @Override
    public PostDto updatePost(PostDto postDto) {
        Post post = postRepository.findById(postDto.getPostId())
                .orElseThrow(() -> new IllegalArgumentException("게시글이 존재하지 않습니다: " + postDto.getPostId()));
        post.setPostTitle(postDto.getPostTitle());
        post.setPost(postDto.getPost());
        post.setPostDate(postDto.getPostDate());
        post.setCategory(categoryService.findById(postDto.getCategoryId()));
        post.setUser(userService.findById(postDto.getUserId()));

        log.info("Post 수정 - ID: {}, Title: {}, USER-ID: {}", post.getPostId(), post.getPostTitle(), post.getUser().getUserId());

        return convertToDto(postRepository.save(post));

    }

    @Override
    public Page<PostDto> findPostsbyCategoryId(Long Id, Pageable pageable) {
        Page<Post> posts = postRepository.findByCategoryId(Id, pageable);

        return posts.map(this::convertToDto);
    }



    @Override
    @Transactional
    public void deletePost(Long id) {
        postRepository.deleteById(id);
    }

    private PostDto convertToDto(Post post) {
        PostDto postDto = new PostDto();
        postDto.setPostId(post.getPostId());
        postDto.setPostTitle(post.getPostTitle());
        postDto.setPost(post.getPost());
        postDto.setPostDate(post.getPostDate());
        postDto.setUserId(post.getUser().getUserId());
        return postDto;
    }

    private Post convertToEntity(PostDto postDto) {
        Post post = new Post();
        post.setPostId(postDto.getPostId());
        post.setPostTitle(postDto.getPostTitle());
        post.setPost(postDto.getPost());
        post.setPostDate(postDto.getPostDate());
        post.setCategory(categoryService.findById(postDto.getCategoryId()));
        // userId는 User 엔티티와 연관관계가 설정되어 있어야 함
        // 예를 들어, User user = userRepository.findById(postDto.getUserId()).orElse(null);
        // post.setUser(user);
        post.setUser(userService.findById(postDto.getUserId()));

        log.info("Post 생성 - ID: {}, Title: {}, USER-ID: {}", post.getPostId(), post.getPostTitle(),post.getUser().getUserId());

        return post;
    }

}
