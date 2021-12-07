package com.book.model;

import java.sql.Date;
import java.util.List;

public class BookService {
	private BookDAO_interface dao;
	
	public BookService() {
		dao = new BookDAO();
	}
	
	public BookVO add(String bookName,String bookContent,Integer bookQty,byte[] bookImg,Date addedTime,Date downTime) {
		BookVO bookVO = new BookVO();
		bookVO.setBookName(bookName);
		bookVO.setBookContent(bookContent);
		bookVO.setBookQty(bookQty);
		bookVO.setBookImg(bookImg);
		bookVO.setAddedTime(addedTime);
		bookVO.setDownTime(downTime);
		dao.insert(bookVO);
		return bookVO;
	}
	public List<BookVO> getAll() {
		return dao.getAll();
	}
	public BookVO update(String bookName,String bookContent,Integer bookQty,byte[] bookImg,Date addedTime,Date downTime,Integer bookId) {
		BookVO bookVO = new BookVO();
		bookVO.setBookName(bookName);
		bookVO.setBookContent(bookContent);
		bookVO.setBookQty(bookQty);
		bookVO.setBookImg(bookImg);
		bookVO.setAddedTime(addedTime);
		bookVO.setDownTime(downTime);
		bookVO.setBookId(bookId);
		dao.update(bookVO);
		return bookVO;
	}
	public BookVO getOne(Integer bookId) {
		return dao.getone(bookId);
	}

	public void delete(Integer bookId) {
		dao.delete(bookId);
	}
}
