package by.gmazurkevich.training.library.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import by.gmazurkevich.training.library.datamodel.CatalogTest;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class CatalogTestServiceTest {

	@Inject
	protected CatalogTestService catalogTestService;
	
//	@Test
//	public void test() {
//		Assert.assertNotNull(catalogTestService);
//	}
//	
//	@Test
	public void testGetChilds(){
		CatalogTest parent = catalogTestService.getCatalogTest("root1");
		List<CatalogTest> childs = catalogTestService.getCatalogs(parent);
		for(CatalogTest cat : childs){
			System.out.println(cat.getId());
		}
		Assert.assertEquals(childs.size(), 2);
	}
	@Test
	public void testGetRoots(){
		List<CatalogTest> roots = catalogTestService.getRootCatalogs();
		for(CatalogTest cat : roots){
			System.out.println(cat.getId());
		}
		Assert.assertEquals(roots.size(), 3);
	}
//	@Test
	public void testCreate(){
		CatalogTest root1 = new CatalogTest();
		root1.setId("root1");
		root1.setParent(null);
		catalogTestService.create(root1);
		
		CatalogTest root2 = new CatalogTest();
		root2.setId("root2");
		root2.setParent(root1);
		catalogTestService.create(root2);
		
		CatalogTest root3 = new CatalogTest();
		root3.setId("root3");
		root3.setParent(root2);
		catalogTestService.create(root3);
		
		CatalogTest root4 = new CatalogTest();
		root4.setId("root4");
		root4.setParent(root2);
		catalogTestService.create(root4);
		
		Assert.assertNotNull(catalogTestService.getCatalogTest(root3.getId()));
	}
	
//	@Test
	public void testSave(){
		CatalogTest root1 = new CatalogTest();
		root1.setId("root11");
		root1.setParent(null);
//		catalogTestService.create(root1);
		List<CatalogTest> list = new ArrayList<>();
		CatalogTest root2 = new CatalogTest();
		root2.setId("root112");
		list.add(root2);
		root1.setChilds(list);;
		catalogTestService.create(root1);
//		catalogTestService.create(root2);
		
		Assert.assertNotNull(catalogTestService.getCatalogTest(root2.getId()));
	}
}
