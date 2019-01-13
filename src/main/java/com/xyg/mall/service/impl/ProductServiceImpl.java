package com.xyg.mall.service.impl;

import com.xyg.mall.mapper.ProductMapper;
import com.xyg.mall.pojo.Category;
import com.xyg.mall.pojo.Product;
import com.xyg.mall.pojo.ProductExample;
import com.xyg.mall.pojo.ProductImage;
import com.xyg.mall.service.ProductImageService;
import com.xyg.mall.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;
    @Autowired
    ProductImageService productImageService;

    @Override
    public void add(Product product) {
        productMapper.insert(product);
    }

    @Override
    public void delete(int id) {
        productMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Product product) {
        productMapper.updateByPrimaryKeySelective(product);
    }

    @Override
    public List<Product> list(int cid) {
        ProductExample example = new ProductExample();
        example.createCriteria().andCidEqualTo(cid);
        example.setOrderByClause("id desc");
        List<Product> ps =  productMapper.selectByExample(example);
        setFirstProductImage(ps);
        return ps;
    }

    @Override
    public Product get(int id) {
        Product p =productMapper.selectByPrimaryKey(id);
        setFirstProductImage(p);
        return p;
    }

    @Override
    public void fill(Category category) {
        List<Product> ps = list(category.getId());
        category.setProducts(ps);
    }

    @Override
    public void fill(List<Category> cs) {
        for (Category category:cs
             ) {
            fill(category);
        }
    }

    @Override
    public void setFirstProductImage(Product p) {
        List<ProductImage> pis = productImageService.list(p.getId(), ProductImageService.type_single);
        if (!pis.isEmpty()) {
            ProductImage pi = pis.get(0);
            p.setFirstProductImage(pi);
        }
    }

    public void setProduct() {

    }

    public void setFirstProductImage(List<Product> ps) {
        for (Product p : ps) {
            setFirstProductImage(p);
        }
    }

}
