<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<c:import url="/WEB-INF/views/layouts/space/head.jsp" />

<body>
    <!-- 헤더 include -->
    <jsp:include page="../layouts/space/header.jsp"/>

    <div class="container mt-5">
        <h2 class="mb-4">게시글 작성</h2>
        
        <form>
            <div class="mb-3">
                <label for="title" class="form-label">제목</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>

            <div class="mb-3">
                <label for="post" class="form-label">내용</label>
                <textarea class="form-control" id="summernote" name="post" rows="10" required></textarea>
            </div>

            <select class="form-select" id="category" name="categoryId" required>
                <option value="">카테고리 선택</option>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.id}">${category.categoryName}</option>
                </c:forEach>
            </select>

            <div class="d-flex justify-content-between mt-4">
                <button type="button" class="btn btn-secondary" onclick="location.href='/posts/list'">목록으로</button>
                <div>
                    <button type="button" id="submitBtn" class="btn btn-primary">작성완료</button>
                </div>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- 썸머노트 JS -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>

    <script>
        $(document).ready(function() {
            $('#summernote').summernote({
                height: 300,
                lang: 'ko-KR',
                toolbar: [
                    ['style', ['bold', 'italic', 'underline', 'clear']],
                    ['font', ['strikethrough']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['table', ['table']],
                    ['insert', ['link', 'picture']],
                    ['view', ['fullscreen', 'codeview']]
                ],
                callbacks: {
                    onImageUpload: function(files) {
                        // 이미지 업로드 처리
                        for(let i = 0; i < files.length; i++) {
                            uploadImage(files[i], this);
                        }
                    }
                }
            });
        });

        function uploadImage(file, editor) {
            const formData = new FormData();
            formData.append("file", file);
            
            $.ajax({
                url: '/api/upload',
                method: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    $(editor).summernote('insertImage', response.url);
                },
                error: function(xhr, status, error) {
                    console.error('이미지 업로드 실패:', error);
                    alert('이미지 업로드에 실패했습니다.');
                }
            });
        }

        // fetch로 폼 제출
        document.getElementById('submitBtn').addEventListener('click', async function(e) {
            e.preventDefault();

            const title = document.getElementById('title').value.trim();
            const content = $('#summernote').summernote('isEmpty');
            const post = $('#summernote').summernote('code');
            const categoryId = document.getElementById('category').value;

            if (!title) {
                alert('제목을 입력해주세요.');
                document.getElementById('title').focus();
                return;
            }
            if (content) {
                alert('내용을 입력해주세요.');
                $('#summernote').summernote('focus');
                return;
            }
            if (!categoryId) {
                alert('카테고리를 선택해주세요.');
                document.getElementById('category').focus();
                return;
            }

            const formData = {
                title: title,
                post: post,
                categoryId: categoryId
            };

            try {
                const response = await fetch('/api/posts/write', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(formData)
                });

                if (response.ok) {
                    const data = await response.json();
                    window.location.href = '/posts/detail?postId=' + data.id;
                } else {
                    alert('게시글 저장에 실패했습니다.');
                }
            } catch (err) {
                alert('오류가 발생했습니다.');
            }
        });
    </script>





</body>
</html>