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

import com.google.gson.JsonObject;
import com.nimbusds.oauth2.sdk.util.StringUtils;

import io.jsonwebtoken.io.IOException;
import kh.project.dml.board.model.service.FpBoardService;
import kh.project.dml.board.model.vo.FpBoardVo;
import kh.project.dml.common.FileUpload;

@Controller
@RequestMapping("/board")
public class FpBoardController {

	@Autowired
	private FpBoardService fpBoardServiceImpl;
	
	private static final String CURR_IMAGE_REPO_PATH = 
			"C:\\workspace\\github\\DML\\src\\main\\webapp\\WEB-INF\\views\\board\\upload";


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

	@PostMapping("/upload")
	public ModelAndView upload(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> map = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();

		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
		}

		List fileList = fileProcess(multipartRequest);
		map.put("fileList", fileList);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("board/result");
		return mav;
	}


	private List<String> fileProcess(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					if (file.getParentFile().mkdir()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + originalFileName));
			}
		}
		return fileList;
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
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 실패했습니다 \n 다시 입력해주세요");
				viewPage = "redirect:/board/list";// delete는 보통 처음에 있던 화면으로 돌아감 그래서 ajax를 쓰는데 그건 추후
			} else {
				redirectAttr.addFlashAttribute("msg", "회원 정보 삭제 됐습니다");
				viewPage = "redirect:/board/list";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return viewPage;
	}

	}
