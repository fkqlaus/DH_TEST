package db.post.service.impl;

import db.post.dto.PostDto;
import db.post.entity.Post;
import db.post.repository.PostRepository;
import db.post.service.PostService;
import db.user.entity.User;
import db.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class PostServiceImpl implements PostService {

    private final PostRepository postRepository;
    private final UserService userService;

    @Override
    public Page<Post> findPosts(String searchTitle, Pageable pageable) {

        if (searchTitle != null && !searchTitle.isEmpty()) {
            return postRepository.findByPostTitleContaining(searchTitle, pageable);
        }
        return postRepository.findAll(pageable);
    }

    @Override
    public Post getPostById(Long id) {
        return postRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("게시글이 존재하지 않습니다: " + id));
    }

    @Override
    public Post savePost(PostDto post) {
        return postRepository.save(convertToEntity(post));
    }


    @Override
    @Transactional
    public void deletePost(Long id) {
        postRepository.deleteById(id);
    }

    private PostDto convertToDto(Post post) {
        PostDto postDto = new PostDto();
        postDto.setId(post.getPostId());
        postDto.setTitle(post.getPostTitle());
        postDto.setPost(post.getPost());
        postDto.setPostDate(post.getPostDate());
        postDto.setUserId(post.getUser().getUserId());
        return postDto;
    }

    private Post convertToEntity(PostDto postDto) {
        Post post = new Post();
        post.setPostId(postDto.getId());
        post.setPostTitle(postDto.getTitle());
        post.setPost(postDto.getPost());
        post.setPostDate(postDto.getPostDate());
        // userId는 User 엔티티와 연관관계가 설정되어 있어야 함
        // 예를 들어, User user = userRepository.findById(postDto.getUserId()).orElse(null);
        // post.setUser(user);
        post.setUser(userService.findById(postDto.getUserId()));;

        return post;
    }

}
