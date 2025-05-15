package com.drugs.controllers;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.drugs.models.Group;
import com.drugs.service.GroupService;

@Controller
@RequestMapping(value = "/group")
public class GroupController 
{
	
	private GroupService groupService;

	@Autowired
	public void setUserService(GroupService groupService) {
		this.groupService = groupService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) 
	{
		//System.out.println("################## 1 index ################################# =====>>: " );
		//logger.debug("index()");
		return "redirect:/group/groupList";
	}

	// list page
	
	
	//@RequestMapping(value = "/users", method = RequestMethod.GET)
	@RequestMapping("/groupList")
	public String showDataTable(Model model) 
	{

		//logger.debug("showAllUsers()");	
		   
		model.addAttribute("groupBean", groupService.showDataTable());
		
		//System.out.println("################## 2 showAllUsers ################################# groupService.findAll()=====>>: " + groupService.findAll().size());
		
		return "listpage_StoreGroup_mms";

	}
	
	// save or update user
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("userForm") @Validated Group user,BindingResult result, Model model, final RedirectAttributes redirectAttributes) 
	{

		//logger.debug("saveOrUpdateUser() : {}", user);
		if(result.hasErrors()) 
		{
			//System.out.println("################## 3 saveOrUpdateUser ################################# result.hasErrors() ==>>: ");
			populateDefaultModel(model);
			return "master/add_StoreGroup_mms";
		} 
		else 
		{
			
			 int count = groupService.chkDuplicate(user);

				
				if(count>0){
					redirectAttributes.addFlashAttribute("css", "danger");
					redirectAttributes.addFlashAttribute("msg", "Data Already Exists!");
					return "redirect:/group/groupList";
				}

			redirectAttributes.addFlashAttribute("css", "success");
			groupService.save(user);
           				
			redirectAttributes.addFlashAttribute("msg", "Data Saved Successfully!");
			
			
			
			// POST/REDIRECT/GET
			return "redirect:/group/groupList";

			// POST/FORWARD/GET
			// return "user/list";
			}

	}

	@RequestMapping(value = "/groupUpdate", method = RequestMethod.POST)
	public String update(@ModelAttribute("modifyForm") @Validated Group user,BindingResult result, Model model, final RedirectAttributes redirectAttributes) 
	{

		//logger.debug("saveOrUpdateGroup() : {}", user);
		if(result.hasErrors()) 
		{
			//System.out.println("################## 3 saveOrUpdateGroup ################################# result.hasErrors() ==>>: ");
			return "master/modify_StoreGroup_mms";
		} 
		else 
		{
			System.out.println("################## 3 saveOrUpdateGroup #################################");
			
			int count = groupService.chkDuplicateUpdate(user);
			if(count>0){
				redirectAttributes.addFlashAttribute("css", "danger");
				redirectAttributes.addFlashAttribute("msg", "Data Already Exists!");
				return "redirect:/group/groupList";
			}
			
			redirectAttributes.addFlashAttribute("css", "success");
			groupService.update(user);
				
			redirectAttributes.addFlashAttribute("msg", "Data Had Been Modified Successfully!");
			
			
			
			// POST/REDIRECT/GET
			return "redirect:/group/groupList";

			// POST/FORWARD/GET
			// return "user/list";

		}

	}

	// show add user form
	@RequestMapping(value = "/groupAdd", method = RequestMethod.GET)
	public String addPage(Model model) {

		//logger.debug("showAddGroupForm()");
		
		System.out.println("################## 4 showAddGroupForm ################################# groupService.findAll()=====>>: " );
		

		Group user = new Group();

		// set default value
         
		model.addAttribute("userForm", user);

		populateDefaultModel(model);

		return "master/add_StoreGroup_mms";

	}

	// show update form
		@RequestMapping(value = "/modify/{strHiddenId}", method = RequestMethod.GET)
		public String modifyPage(@PathVariable("strHiddenId") String strHiddenId, Model model) {

			//logger.debug("showUpdateGroupForm() : {}", id);
			
			System.out.println("################## 5 showUpdateGroupForm ################################# =====>>: "+strHiddenId );
			

			Group user = groupService.modify(strHiddenId);
			model.addAttribute("modifyForm", user);
			
			populateDefaultModel(model);
			
			return "master/modify_StoreGroup_mms";

		}

	// delete user
	@RequestMapping(value = "/delete/{strHiddenId}", method = RequestMethod.GET)
	public String delete(@PathVariable("strHiddenId") String strHiddenId, final RedirectAttributes redirectAttributes) {

		//logger.debug("deleteGroup() : {}", id);
		System.out.println("################## 6  deleteGroup ################################# =====>>:strHiddenId " +strHiddenId);
       
		groupService.delete(strHiddenId);
		
		redirectAttributes.addFlashAttribute("css", "success");
		redirectAttributes.addFlashAttribute("msg", "Data Has Been Deleted Successfully!");
		
		return "redirect:/group/groupList";

	}

	// show user
	@RequestMapping(value = "/view/{strHiddenId}", method = RequestMethod.GET)
	public String viewPage(@PathVariable("strHiddenId") String strHiddenId, Model model) {

		//logger.debug("showGroup() id: {}", id);
		
		System.out.println("################## 7 showGroup ################################# =====>>: "+strHiddenId );

		Group user = groupService.modify(strHiddenId);
		if (user == null) {
			model.addAttribute("css", "danger");
			model.addAttribute("msg", "Data not found");
		}
		model.addAttribute("user", user);

		return "master/view_StoreGroup_mms";

	}
	
	@RequestMapping(value = "/cancelAdd", method = RequestMethod.GET)
	public String cancelAdd() {
		
	  return "redirect:/group/groupList";
   }
	
	@RequestMapping(value = "/cancelModify", method = RequestMethod.GET)
	public String cancelModify() {
		
	  return "redirect:/group/groupList";
   }
	
	@RequestMapping(value = "/closeView", method = RequestMethod.GET)
	public String closeView() {
		
	  return "redirect:/group/groupList";
   }
	
	private void populateDefaultModel(Model model) 
	{

		System.out.println("################## 8 populateDefaultModel ################################# =====>>: " );
		
		Map<Integer, String> strGroupType = new LinkedHashMap<Integer, String>();
		strGroupType.put(10, "ANTI-INFECTIVES");
		strGroupType.put(11, "DERMA");
		strGroupType.put(12, "ANTI-NEOPLASTICS");
		strGroupType.put(13, "BLOOD RELATED");
		strGroupType.put(14, "GYNAECOLOGICAL");
		strGroupType.put(15, "ANTI DIABETIC");
		strGroupType.put(16, "OTHERS");
		strGroupType.put(17, "NEURO / CNS");
		strGroupType.put(18, "VITAMINS / MINERALS / NUTRIENTS");
		strGroupType.put(19, "GASTRO INTESTINAL");
		strGroupType.put(20, "CARDIAC");
		strGroupType.put(21, "RESPIRATORY");
		strGroupType.put(22, "OPHTHAL");
		strGroupType.put(23, "PAIN / ANALGESICS");
		model.addAttribute("groupTypeList", strGroupType);

	}
}