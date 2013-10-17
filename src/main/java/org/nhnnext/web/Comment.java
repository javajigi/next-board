package org.nhnnext.web;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Comment {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(length=1000, nullable=false)
	private String contents;
	
	@ManyToOne
	private Board board;
	
	public Comment() {
	}
	
	public Comment(String contents, Board board) {
		this.contents = contents;
		this.board = board;
	}

	public Long getId() {
		return id;
	}
	
	public String getContents() {
		return contents;
	}
	
	public Board getBoard() {
		return board;
	}
}
