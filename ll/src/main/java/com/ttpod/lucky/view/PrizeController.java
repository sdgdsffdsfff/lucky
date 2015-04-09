package com.ttpod.lucky.view;


import com.ttpod.lucky.entity.Prize;
import com.ttpod.lucky.service.HeadService;
import com.ttpod.lucky.service.PrizeService;
import com.ttpod.lucky.view.dto.Global;
import com.xyj.manage.tool.ServletUtil;
import com.xyj.manage.tool.query.PropertyFilter;
import com.xyj.manage.tool.query.SpecificationUtil;
import com.xyj.manage.tool.redis.spring.RedisSpringUtil;
import com.xyj.manage.view.dto.QueryDTO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.Map;

/**
 * @classDescription:
 * @author:xiayingjie
 * @createTime:13-10-15 下午3:34
 */
@Controller
@RequestMapping(value = "/admin/prize")
public class PrizeController extends  BaseController {
    private String path = "/admin/prize";
    @Autowired
    private PrizeService prizeService;
    @Autowired
    private HeadService headService;



    //查询
    @RequiresPermissions("admin:prize:view")
    @RequestMapping(value = {"", "list"})
    public String list(HttpServletRequest request, HttpServletResponse response, QueryDTO queryDTO) {

        Map searchMap = ServletUtil.getParametersStartingWith(request, "search");
        //查询结果
        Specification specification = SpecificationUtil.bySearchFilter(searchMap, Prize.class);
        PageRequest pageRequest = SpecificationUtil.getPageRequest(queryDTO);
        Page<Prize> prizePage = prizeService.findAllPrizes(specification, pageRequest);
        //获取查询条件
        Map conditionMap = PropertyFilter.parseCondition(searchMap, queryDTO, path);

        PropertyFilter.setAttribute(request, searchMap);
        request.setAttribute("conditionMap", conditionMap);
        request.setAttribute("prizePage", prizePage);
        request.getSession().setAttribute("currentPage", path + "?" + PropertyFilter.parseUrl(searchMap, queryDTO));
        return "/manage/lucky/adminPrizeList";
    }

    //去增加
    @RequiresPermissions("admin:prize:edit")
    @RequestMapping(value = "toAdd")
    public String toAdd(Model model) {
        return "/manage/lucky/addPrize";
    }

    //增加
    @RequiresPermissions("admin:prize:edit")
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String toAdd(Prize prizeInfo, HttpServletRequest request) {
        prizeInfo.setCreateTime(new Date());
        prizeInfo.setRemainCount(prizeInfo.getAllCount());
        this.prizeService.savePrize(prizeInfo);
        //跳转
        String currentPage = (String) request.getSession().getAttribute("currentPage");
        return "redirect:" + currentPage;
    }

    //去修改
    @RequiresPermissions("admin:prize:edit")
    @RequestMapping(value = "toAlter/{id}")
    public String toAlter(Model model, @PathVariable("id") int id) {
        Prize prizeInfo = this.prizeService.findPrizeById(id);
        model.addAttribute("prizeInfo", prizeInfo);
        return "/manage/lucky/alterPrize";
    }

    //修改
    @RequiresPermissions("admin:prize:edit")
    @RequestMapping(value = "alter")
    public String alter(HttpServletRequest request, Prize prizeInfo) {
        Prize prize = this.prizeService.findPrizeById(prizeInfo.getId());

        prizeInfo.setCreateTime(prize.getCreateTime());
        prizeInfo.setRemainCount(prizeInfo.getAllCount()-prize.getWinprizes().size());
        this.prizeService.savePrize(prizeInfo);


        //更新中奖号码
        if(prizeInfo.getAllCount()!=prize.getAllCount()){
            Global g=initGlobal();
            this.headService.randomWinNum(g.getDrawBase());
        }

        //跳转
        String currentPage = (String) request.getSession().getAttribute("currentPage");

        return "redirect:" + currentPage;
    }

    //删除
    @RequiresPermissions("admin:prize:edit")
    @RequestMapping(value = "delete/{id}")
    public String delete(HttpServletRequest request, @PathVariable("id") int id) {

        prizeService.deletePrizeById(id);
        //跳转
        String currentPage = (String) request.getSession().getAttribute("currentPage");
        return "redirect:" + currentPage;
    }


}
