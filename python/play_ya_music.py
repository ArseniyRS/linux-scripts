from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

options = Options()
options.add_experimental_option("debuggerAddress", "127.0.0.1:9100")

service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service, options=options)
driver.get("https://music.yandex.ru/home")
time.sleep(7)
play_btn = driver.find_element(By.CSS_SELECTOR, ".player-controls__btn_play")
play_btn.click()
driver.quit()