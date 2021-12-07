package com.book.model;

import java.util.List;

public interface BookDAO_interface {
	public void insert(BookVO bookVO);
    public void update(BookVO bookVO);
    public void delete(Integer bookId);
    public BookVO getone(Integer bookId);
    public List<BookVO> getAll();
}
