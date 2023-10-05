package kh.project.dml.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.nimbusds.oauth2.sdk.util.StringUtils;

import io.jsonwebtoken.io.IOException;
import kh.project.dml.board.model.service.FpBoardService;
import kh.project.dml.board.model.vo.FpBoardParam;
import kh.project.dml.board.model.vo.FpBoardVo;
import kh.project.dml.common.FileUpload;

@Controller
@RequestMapping("/board")
public class FpBoardController {

	@Autowired
	private FpBoardService fpBoardServiceImpl;

	private static final String CURR_IMAGE_REPO_PATH = "C:\\workspace\\github\\DML\\src\\main\\webapp\\WEB-INF\\views\\board\\upload";

	@GetMapping("/list")
	public ModelAndView selectListboard(ModelAndView mv) {
		mv.addObject("boardList", fpBoardServiceImpl.selectList());
		mv.setViewName("board/list");
		return mv;
	}

	@GetMapping("/one")
	public ModelAndView selectOneboard(ModelAndView mv, Integer boardNo) {
		mv.addObject("boardone", fpBoardServiceImpl.selectOne(boardNo));
		mv.setViewName("board/one");
		return mv;
	}

	@GetMapping("/insert")
	public String form() {
		return "board/insert";
	}

	@PostMapping("/insert")
	public String insertDoBoard(RedirectAttributes redirectAttr, FpBoardVo vo) {
		String viewPage = "redirect:/";

		int result = fpBoardServiceImpl.insert(vo);
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 가입 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/board/insert";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 가입 됐습니다");
				viewPage = "redirect:/board/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}

	@GetMapping("/plusCount")
	@ResponseBody
	public Integer updatememberexset(FpBoardParam param) {
		return fpBoardServiceImpl.plusCount(param);
	}

	@PostMapping("/upload")
	@ResponseBody
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile) throws Exception {

		// Json 객체 생성
		JsonObject json = new JsonObject();
		// Json 객체를 출력하기 위해 PrintWriter 생성
		PrintWriter printWriter = null;
		OutputStream out = null;
		// 파일을 가져오기 위해 MultipartHttpServletRequest 의 getFile 메서드 사용
		MultipartFile file = multiFile.getFile("upload");
		// 파일이 비어있지 않고(비어 있다면 null 반환)
		if (file != null) {
			// 파일 사이즈가 0보다 크고, 파일이름이 공백이 아닐때
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {

					try {
						// 파일 이름 설정
						String fileName = file.getName();
						// 바이트 타입설정
						byte[] bytes = null;
						// 파일을 바이트 타입으로 변경
						try {
							bytes = file.getBytes();
						} catch (java.io.IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						// 파일이 실제로 저장되는 경로
						String uploadPath = request.getServletContext().getRealPath("/resources/ckimage/");
						// 저장되는 파일에 경로 설정
						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						// 파일이름을 랜덤하게 생성
						fileName = UUID.randomUUID().toString();
						// 업로드 경로 + 파일이름을 줘서 데이터를 서버에 전송
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						// 클라이언트에 이벤트 추가
						printWriter = response.getWriter();
						response.setContentType("text/html");

						// 파일이 연결되는 Url 주소 설정
						String fileUrl = request.getContextPath() + "/resources/ckimage/" + fileName;
				
						// 생성된 jason 객체를 이용해 파일 업로드 + 이름 + 주소를 CkEditor에 전송
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						printWriter.println(json);
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
		return null;
	}

	@GetMapping("/update")
	public ModelAndView updateboard(ModelAndView mv, int boardNo) {
		mv.addObject("boardone", fpBoardServiceImpl.selectOne(boardNo));
		mv.setViewName("board/update");
		return mv;
	}

	@PostMapping("/update")
	public String updateDoBoard(RedirectAttributes redirectAttr, FpBoardVo vo) {
		String viewPage = "redirect:/";
		int result = fpBoardServiceImpl.update(vo);
		// ((ModelAndView) redirectAttr).addObject("boardone",
		// fpBoardServiceImpl.selectOne(vo.getBoardNo()));
		try {
			if (result < 1) {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/board/update";
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 수정 됐습니다");
				viewPage = "redirect:/board/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}

	@PostMapping("/delete")
	public String deleteDoBoard(RedirectAttributes redirectAttr, int boardNo) {
		String viewPage = "redirect:/";
		int result = fpBoardServiceImpl.delete(boardNo);
		try {
			if (result < 1) {
				viewPage = "redirect:/board/list";// delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				viewPage = "redirect:/board/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}

}
