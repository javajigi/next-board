package org.nhnnext.web;

import java.util.Collections;
import java.util.List;

import org.nhnnext.web.Board;
import org.nhnnext.repository.BoardRepository;
import org.nhnnext.support.FileUploader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardController {
	@Autowired
	private BoardRepository boardRepository;
	
	@RequestMapping(value={"/", "/board"})
	public String list(Model model) {
		//model.addAttribute("boards", boardRepository.findAll());
    	List<Board> savedBoard = (List<Board>) boardRepository.findAll();
    	// 역순으로 보여주기 위해서. 
    	Collections.reverse(savedBoard);
    	model.addAttribute("boards", savedBoard);
		return "list";
	}
	
	@RequestMapping("/board/form")
	public String form() {
		return "form";
	}
	
	@RequestMapping(value="/board", method=RequestMethod.POST)
	public String create(Board board, MultipartFile filename) {
		String fileName = FileUploader.upload(filename);
		board.setFileName(fileName);
		Board savedBoard = boardRepository.save(board);
		//return "redirect:/board/" + savedBoard.getId();
		return "redirect:/board/";
	}
	
	@RequestMapping("/board/{id}")
	public String show(@PathVariable Long id, Model model) {
		Board board = boardRepository.findOne(id);
		model.addAttribute("board", board);
		return "show";
	}
}
