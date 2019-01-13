package com.xyg.mall.util;

public class Page {
    private int start;
    private int count;
    private int total;
    private String param;
    private int PAGECOUNT = 5;//每页默认显示数

    public Page() {
        count = PAGECOUNT;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getParam() {
        return param;
    }

    public void setParam(String param) {
        this.param = param;
    }

    public int getLast() {
        int last = 0;
        if (total % count == 0) {
            last = total - count;
        } else {
            last = total - (total % count);
        }
        return last;
    }

    public int getTotalPage() {
        int totalPage=1;
        if (total % count == 0) {
            totalPage = total / count;
        } else {
            totalPage = total / count + 1;
        }
        if (totalPage == 0) {
            totalPage = 1;
        }
        return totalPage;
    }

    public boolean ishasNext() {
        int last = getLast();
        if (start == last) {
            return false;
        }
        return true;
    }

    public boolean ishasPre(){
        if (start == 0) {
            return false;
        }
        return true;
    }
}
