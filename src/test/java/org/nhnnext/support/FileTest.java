package org.nhnnext.support;

import java.io.File;

import org.junit.Test;

public class FileTest {

	@Test
	public void absolutePath() {
		File file = new File(".");
		System.out.println(String.format("absolute path : %s", file.getAbsolutePath()));
	}

}
