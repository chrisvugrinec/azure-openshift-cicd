import unittest
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import pytest
import allure


class PythonOrgSearch(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Firefox()

    @allure.story('Testing webcounter application')
    @allure.feature('Does Webcounter contain expected test')
    def test_search_in_python_org(self):
        driver = self.driver
        driver.get("http://webcounter.demo.datalinks.nl/")
        self.assertIn("Counter", driver.title)
        bodyText = self.driver.find_element_by_tag_name('body').text
        self.assertTrue("YOU HAVE BEEN VIEWED" in bodyText)


    def tearDown(self):
        self.driver.close()

if __name__ == "__main__":
    unittest.main()
