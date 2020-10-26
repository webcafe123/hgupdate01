package com.pr.project.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pr.project.dao.CateDao;
import com.pr.project.model.Board;
import com.pr.project.model.Cate;
	
	@Service
	public class CateServiceImpl implements CateService {
		@Autowired
		private CateDao cd;

		@Override
		public List<Cate> list() {
			return cd.list();		}
		@Override
		public int insert(Cate cate) {
			return cd.insert(cate);		}
		@Override
		public Cate select(int num) {
			return cd.select(num);		}
		@Override
		public int update(Cate cate) {
			return cd.update(cate);		}
		@Override
		public int delete(int c_num) {
			return cd.delete(c_num);		}
		@Override
		public int maxNum() {
			return cd.maxNum();		}
		@Override
		public void updateC_step(Cate cate) {
			cd.updateC_step(cate);
		}
		

	}
