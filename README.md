# Notice Board

- 공통 주제 : 게시판
- * 글 CRUD
- * 파일
- v 댓글
- v 관리자/사용자

- 진행 기간 : 1/22 ~ 1/25(목)
- 조별 브리핑 : 1/26(금) - 오전 11시
- DB 설계 - 화면구성 ===> application dev ===> ppt


기능 : 
- 로그인 (메인) / 회원가입
- 자유게시판 (모든회원 조회, 글작성 가능) : 글 id, 글 제목, 내용, 작성일시, 작성자, 파일, 댓글, 조회수
- 공지게시판(관리자만 작성가능, 일반 회원 조회 가능)
- 정보게시판
- 게시판 글 페이징 기능
- 회원 비밀번호 (글자수제한/특수문자 포함)
- 파일 삭제시 스케줄러로 관리

DB 구성
board - board_id, board_title, board_content, created_date, modified_date, user_id, board_file
user - user_id, password, name, grade
comment - comment_id, comment_content, user_id, date, board_id
file - file_id, file_name, file_original_name, file_path, registered_date, file_size, board_id


=================================================================================
[com.board.dto]
- Board
private long BoardId;
private String BoardTilte;
private String BoardContent;
private timestamp createdDate;
private timestamp modifiedDate;
private long BoadFile;
private String BoardName;
private long count;
private String userId;

-User
private String userId;
private String password;
private String name;
private String grade;

- File
private Long fileId;
private String fileName;
private String OriginalfileName;
private String filePath;
private Timestamp registered_date
private Timestamp deleted_date
private long fileSize;
private int boardId;

- Comment
private int commentId;
private String commentContent;
private String userId;
private int boardId;

[com.board.intercepter]
SessionInterceptor

[com.board.controller]
- BoardController
- UserController
- MainController
- FileController
- CommentController

[com.board.service]
- BoardService
- FileService
- CommentService
- UserService

[com.board.mapper]
- FileMapper
- UserMapper
- BoardMapper
- CommentMapper

[view]
- Main.jsp			//통합목록
- User.jsp			// 로그인
- BoardDetail.jsp		// 게시판 상세페이지
- UpdateBoard.jsp	// 글 수정
- UpdateUser.jsp		// 회원정보 수정
- UserDetail.jsp		// 회원 목록
- UpdateUserDetail.jsp	// 관리자용 회원 수정 페이지
- RegisterBoard.jsp	// 글 등록
- header.jsp
- footer.jsp

[css]
layout.css

[error]
- error.jsp
