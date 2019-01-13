<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
        isELIgnored="false" %>

<script>
    $(function () {
        $("ul.pagination li.has a").click(function () {
            $("ul.pagination li.has a").attr("href", "#nowhere");
        });
    });

</script>
<style>
    ul.pagination a.current{
        font-weight:bold;
        color:black;
        background-color: #EFEFEF;
    }
</style>

<nav>
    <ul class="pagination">
        <li
                <c:if test="${!page.hasPre}">class="has"</c:if> >
            <a href="?start=0${page.param}">&laquo;</a>
        </li>
        <!--
        <li
                <c:if test="${!page.hasPre}">class="has" </c:if> >
            <a href="?start=${page.start-page.count}">上一页</a>
        </li>-->
        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">
            <li <c:if test="${status.index*page.count==page.start}">class="has"</c:if> >
                <a href="?start=${status.index*page.count}${page.param}"
                   <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                >${status.count}</a>
            </li>
        </c:forEach>
        <!--
        <li
                <c:if test="${!page.hasNext}">class="has" </c:if> >
            <a id="next" href="?start=${page.start+page.count}">下一页</a>
        </li>-->
        <li
                <c:if test="${!page.hasNext}">class="has" </c:if> >
            <a href="?start=${page.last}${page.param}">&raquo;</a>
        </li>
    </ul>
</nav>
