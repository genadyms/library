package by.gmazurkevich.training.library.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import by.gmazurkevich.training.library.datamodel.Catalog;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:service-context-test.xml" })
public class CatalogServiceTest {

	@Inject
	protected CatalogService catalogService;
	
//	@Test
//	public void test() {
//		Assert.assertNotNull(catalogTestService);
//	}
//	
//	@Test
	public void testGetChilds(){
		Catalog parent = catalogService.getCatalogTest("root1");
		List<Catalog> childs = catalogService.getCatalogs(parent);
		for(Catalog cat : childs){
			System.out.println(cat.getId());
		}
		Assert.assertEquals(childs.size(), 2);
	}
	@Test
	public void testGetRoots(){
		List<Catalog> roots = catalogService.getRootCatalogs();
		for(Catalog cat : roots){
			System.out.println(cat.getId());
		}
		Assert.assertEquals(roots.size(), 3);
	}
//	@Test
	public void testCreate(){
		Catalog root1 = new Catalog();
		root1.setId("root1");
		root1.setParent(null);
		catalogService.create(root1);
		
		Catalog root2 = new Catalog();
		root2.setId("root2");
		root2.setParent(root1);
		catalogService.create(root2);
		
		Catalog root3 = new Catalog();
		root3.setId("root3");
		root3.setParent(root2);
		catalogService.create(root3);
		
		Catalog root4 = new Catalog();
		root4.setId("root4");
		root4.setParent(root2);
		catalogService.create(root4);
		
		Assert.assertNotNull(catalogService.getCatalogTest(root3.getId()));
	}
	
//	@Test
	public void testSave(){
		Catalog root1 = new Catalog();
		root1.setId("root11");
		root1.setParent(null);
//		catalogTestService.create(root1);
		List<Catalog> list = new ArrayList<>();
		Catalog root2 = new Catalog();
		root2.setId("root112");
		list.add(root2);
		root1.setChilds(list);;
		catalogService.create(root1);
//		catalogTestService.create(root2);
		
		Assert.assertNotNull(catalogService.getCatalogTest(root2.getId()));
	}
}
