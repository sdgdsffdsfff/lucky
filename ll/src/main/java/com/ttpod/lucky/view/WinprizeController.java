package com.ttpod.lucky.view;


import com.ttpod.lucky.entity.Prize;
import com.ttpod.lucky.entity.Winprize;
import com.ttpod.lucky.service.PrizeService;
import com.ttpod.lucky.service.WinprizeService;
import com.xyj.manage.tool.ServletUtil;
import com.xyj.manage.tool.query.PropertyFilter;
import com.xyj.manage.tool.query.SpecificationUtil;
import com.xyj.manage.tool.redis.spring.RedisSpringUtil;
import com.xyj.manage.view.dto.QueryDTO;
import org.apache.commons.lang.StringUtils;
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
@RequestMapping(value = "/admin/winprize")
public class WinprizeController {
    private String path = "/admin/winprize";
    @Autowired
    private WinprizeService winprizeService;
    @Autowired
    private PrizeService  prizeService;

    @Autowired
    private RedisSpringUtil redisDAO;



    //查询
    @RequiresPermissions("admin:winprize:view")
    @RequestMapping(value = {"", "list"})
    public String list(HttpServletRequest request, HttpServletResponse response, QueryDTO queryDTO) {

        Map searchMap = ServletUtil.getParametersStartingWith(request, "search");
        //查询结果
        Specification specification = SpecificationUtil.bySearchFilter(searchMap, Winprize.class);
        PageRequest pageRequest = SpecificationUtil.getPageRequest(queryDTO);
        Page<Winprize> winprizePage = winprizeService.findAllWinprizes(specification, pageRequest);
        //获取查询条件
        Map conditionMap = PropertyFilter.parseCondition(searchMap, queryDTO, path);

        PropertyFilter.setAttribute(request, searchMap);
        request.setAttribute("conditionMap", conditionMap);
        request.setAttribute("winprizePage", winprizePage);
        request.getSession().setAttribute("currentPage", path + "?" + PropertyFilter.parseUrl(searchMap, queryDTO));
        return "/manage/lucky/adminWinprizeList";
    }

    //去增加
//    @RequiresPermissions("admin:winprize:edit")
    @RequestMapping(value = "toAdd")
    public String toAdd(Model model) {
        return "/manage/lucky/addWinprize";
    }

    //增加
//    @RequiresPermissions("admin:winprize:edit")
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String toAdd(Winprize winprizeInfo, HttpServletRequest request, int articleId) {
        winprizeInfo.setCreateTime(new Date());

        this.winprizeService.saveWinprize(winprizeInfo);
        //跳转
        String currentPage = (String) request.getSession().getAttribute("currentPage");
        return "redirect:" + currentPage;
    }

    //去修改
//    @RequiresPermissions("admin:winprize:edit")
    @RequestMapping(value = "toAlter/{id}")
    public String toAlter(Model model, @PathVariable("id") int id) {
        Winprize winprizeInfo = this.winprizeService.findWinprizeById(id);
        model.addAttribute("winprizeInfo", winprizeInfo);
        return "/manage/lucky/alterWinprize";
    }

    //修改
//    @RequiresPermissions("admin:winprize:edit")
    @RequestMapping(value = "alter")
    public String alter(HttpServletRequest request, Winprize winprizeInfo, int articleId) {
        Winprize winprize = this.winprizeService.findWinprizeById(winprizeInfo.getId());

        winprizeInfo.setCreateTime(winprize.getCreateTime());
        this.winprizeService.saveWinprize(winprizeInfo);
        //跳转
        String currentPage = (String) request.getSession().getAttribute("currentPage");
        return "redirect:" + currentPage;
    }

    //删除
    @RequiresPermissions("admin:winprize:edit")
    @RequestMapping(value = "delete/{id}")
    public String delete(HttpServletRequest request, @PathVariable("id") String id) {

        if(id.endsWith(",")){

            String[]ids= StringUtils.substringBeforeLast(id,",").split(",");
            for(String i:ids){
                delete(Integer.parseInt(i));
            }
        }else{
            delete(Integer.parseInt(id));
        }
        //跳转
        String currentPage = (String) request.getSession().getAttribute("currentPage");
        return "redirect:" + currentPage;
    }

    public void delete(int id){
        //修改prize信息
        Winprize winprize=winprizeService.findWinprizeById(id);
        Prize prize=winprize.getPrize();
        prize.setRemainCount(prize.getRemainCount()+1);
        this.prizeService.savePrize(prize);
        //删除winprize信息
        winprizeService.deleteWinprizeById(id);
        //更新奖品
        redisDAO.delete("lk_win_users");
        redisDAO.delete("lk_win_numbers");
    }


}
