package com.example.demo;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Controller
public class ProfileController {
	
	@Autowired
	private UserRepository userRepo;
	
	@GetMapping(value="/")
	public ModelAndView renderpage() {
		
		ModelAndView indexPage = new ModelAndView();
		
		indexPage.setViewName("facebookindex");
		return indexPage;
	}
	
	@PostMapping(value="/user/add")
	public ModelAndView saveUser(
			@RequestParam(name="name", required=true) String name,
			@RequestParam(name="email") String email,
			@RequestParam(name="desc") String desc
			) {
		User u = new User();
		u.setName(name);
		u.setEmail(email);
		u.setDesc(desc);
		userRepo.save(u);
		return new ModelAndView("profile");
//		profilePage.setViewName("profile");
//		return profilePage;
	}
	
	
	
	@PostMapping(value="/upload")
	public ModelAndView uploadToS3(
			@RequestParam("file") MultipartFile image 
			) {
		ModelAndView profilePage = new ModelAndView();

		BasicAWSCredentials cred = new BasicAWSCredentials(
				"AKIAJMTCWS5E62BXJ5LA", "Tk/cTqXS9EVoTuOfJvwsKKRsw4jzNvjL4CcRG6lk"
				);
		
		AmazonS3 s3client = AmazonS3ClientBuilder
				.standard()
				.withCredentials(new AWSStaticCredentialsProvider(cred))
				.withRegion(Regions.US_EAST_2)
				.build();
		
		try {
			System.out.println("hi");
			PutObjectRequest putReq = new PutObjectRequest("selab",image.getOriginalFilename(),image.getInputStream(),new ObjectMetadata())
					.withCannedAcl(CannedAccessControlList.PublicRead);
			
			s3client.putObject(putReq);
			
			String profileimage = "http://"+ "selab" + ".s3.amazonaws.com/" + image.getOriginalFilename();
			
			profilePage.addObject("imgSrc", profileimage);
			
			profilePage.setViewName("profile");
			
			return profilePage;
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			profilePage.setViewName("error");
			return profilePage;
			
		}
		
		
		
	}
	
}
