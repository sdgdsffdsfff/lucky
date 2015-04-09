<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Frameset//EN">
<HTML><HEAD><TITLE>后台管理 </TITLE>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<FRAMESET id=index border=0 frameSpacing=0 rows=120,* frameBorder=no>
    <FRAME id=topFrame name=topFrame src="${ctx}/jsp/index/sysTop" noResize scrolling=no>

    <FRAMESET border=0 frameSpacing=0 frameBorder=no cols=15%,*>
        <FRAME id=leftFrame name=leftFrame src="${ctx}/jsp/index/sysLeft" noResize scrolling=no>
        <FRAME id=mainFrame name=mainFrame src="${ctx}/jsp/index/sysMain" noResize scrolling=yes>
    </FRAMESET>
</FRAMESET>
</HTML>
 