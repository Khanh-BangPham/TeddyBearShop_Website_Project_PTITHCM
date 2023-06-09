/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ptit.DataAccess;

import ptit.Entities.*;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author nguye
 */
public class NhomSanPhamDA {
     private Session s;
     public NhomSanPhamDA(Session ss) {
         s = ss;
     }
    public List<NhomSanPham>getAll(Integer maxResult){
              return s.createCriteria(NhomSanPham.class).setMaxResults(maxResult == null ? 1000 : maxResult).list();
    }

    public List<NhomSanPham> getProPage1(Integer offset, Integer maxResult) {
        Query q = s.createQuery("from NhomSanPham where trangThai = 1");
        return q.setFirstResult(offset == null ? 0 : offset).setMaxResults(maxResult == null ? 4 : maxResult).list();
    }

    public Long getNumberProductDetail() {
        try {

            List list = s.createQuery("from NhomSanPham  where trangThai = 1").list();
            return (long) list.size();
        } catch (Exception e) {
            s.getTransaction().rollback();
        }
        return 0L;
    }
     public void insert(NhomSanPham dm){
        s.save(dm);
       
    }
    
    public void update(NhomSanPham dm){
        s.merge(dm);
       
    }
    
    public void delete(NhomSanPham nsp) {
        s.update(nsp);
       
    }

    
    public NhomSanPham getById(int maNhomSp)
    {
        NhomSanPham dm = (NhomSanPham) s.get(NhomSanPham.class, maNhomSp);
       
        return dm;
    }
    
    public List<NhomSanPham> search(String tenNhomSp)
    {
        Query q=s.createQuery("select s from NhomSanPham s where s.tenNhomSp like :tenNhomSp");
        q.setParameter("tenNhomSp", "%"+ tenNhomSp+"%");
        return q.list();
    }
}
