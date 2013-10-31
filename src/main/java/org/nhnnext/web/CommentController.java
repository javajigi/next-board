package org.nhnnext.web;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommentController {
	private static final Logger log = LoggerFactory.getLogger(CommentController.class);
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@RequestMapping(value="/board/{id}/comments", method=RequestMethod.POST)
	public String create(@PathVariable Long id, String contents) {
		log.debug("board id : {}, contents : {}", id, contents);
		Board board = boardRepository.findOne(id);
		Comment comment = new Comment(contents, board);
		commentRepository.save(comment);
		return "redirect:/board";
	}
	
	@RequestMapping(value="/board/{id}/comments.json", method=RequestMethod.POST)
	public @ResponseBody Comment createAndShow(@PathVariable Long id, String contents) {
		log.debug("board id : {}, contents : {}", id, contents);
		Board board = boardRepository.findOne(id);
		Comment comment = new Comment(contents, board);
		return commentRepository.save(comment);
	}
}






