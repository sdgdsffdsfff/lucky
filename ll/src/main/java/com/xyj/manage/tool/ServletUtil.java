package com.xyj.manage.tool;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.Map;
import java.util.TreeMap;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:13-10-22 下午8:26
 */
public class ServletUtil {
    /**
     * 获取前缀的所有参数
     * @param request
     * @param prefix
     * @return
     */
    public static Map getParametersStartingWith(HttpServletRequest request,
                                                String prefix) {
        Enumeration paramNames = request.getParameterNames();
        Map params = new TreeMap();
        if (prefix == null) {
            prefix = "";
        }
        while (paramNames != null && paramNames.hasMoreElements()) {
            String paramName = (String) paramNames.nextElement();
            if ("".equals(prefix) || paramName.startsWith(prefix)) {
                String[] values = request.getParameterValues(paramName);
                if (values == null || values.length == 0) {
                    // Do nothing, no values found at all.
                } else if (values.length > 1) {
                    params.put(paramName, values);
                } else {
                    params.put(paramName, values[0]);
                }
            }
        }
        return params;
    }
}
