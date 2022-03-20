package model;

import java.util.ArrayList;

public interface iUseCaseHandler<T> {

	public boolean create(T t);
	public T read(int id);
	public ArrayList<T> readAll();
	public boolean update(T t, int id);
	public boolean delete(int id);
	
}
