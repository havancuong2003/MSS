
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Main {
    private static ChromeDriver driver;

    @BeforeEach
    public void openBrowser() throws InterruptedException {
        System.setProperty("webdriver.chrome.driver", "C:\\Users\\Admin\\Desktop\\chromedriver-win64\\chromedriver.exe");
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        driver.get("http://localhost:9999/MyStudySpace_war_exploded/add-New-Account");
    }

    @Test
    public void testCreate() throws InterruptedException {
        WebElement fullname = driver.findElement(By.id("fullname"));
        fullname.sendKeys("Nguyen Linh");
        Thread.sleep(500);

        WebElement add = driver.findElement(By.id("address"));
        add.sendKeys("Hai Duong");
        Thread.sleep(500);

        WebElement username = driver.findElement(By.id("username"));
        username.sendKeys("abcddd");
        Thread.sleep(500);

        WebElement password = driver.findElement(By.id("password"));
        password.sendKeys("123");
        Thread.sleep(500);

        WebElement cfpassword = driver.findElement(By.id("confirmpass"));
        cfpassword.sendKeys("123");
        Thread.sleep(500);

        WebElement status = driver.findElement(By.xpath("//input[@name='gender' and @value='female']"));
        status.click();
        Thread.sleep(500);

        WebElement email = driver.findElement(By.id("email"));
        email.sendKeys("abcdabacd1@gmail.com");
        Thread.sleep(500);

        WebElement phone = driver.findElement(By.id("phone"));
        phone.sendKeys("0978266366");
        Thread.sleep(500);

        WebElement btn_submit = driver.findElement(By.id("btnRegister"));
        btn_submit.click();
        Thread.sleep(5000);
    }

    @Test
    public void testCreate1() throws InterruptedException {
        WebElement fullname = driver.findElement(By.id("fullname"));
        fullname.sendKeys("");
        Thread.sleep(500);

        WebElement add = driver.findElement(By.id("address"));
        add.sendKeys("Hai Duong");
        Thread.sleep(500);

        WebElement username = driver.findElement(By.id("username"));
        username.sendKeys("abcd1");
        Thread.sleep(500);

        WebElement password = driver.findElement(By.id("password"));
        password.sendKeys("abcdabcd");
        Thread.sleep(500);

        WebElement cfpassword = driver.findElement(By.id("confirmpass"));
        cfpassword.sendKeys("abcdabcd");
        Thread.sleep(500);

        WebElement status = driver.findElement(By.xpath("//input[@name='gender' and @value='male']"));
        status.click();
        Thread.sleep(500);

        WebElement email = driver.findElement(By.id("email"));
        email.sendKeys("abcdabacd2@gmail.com");
        Thread.sleep(500);

        WebElement phone = driver.findElement(By.id("phone"));
        phone.sendKeys("0978266366");
        Thread.sleep(500);

        WebElement btn_submit = driver.findElement(By.id("btnRegister"));
        btn_submit.click();
        Thread.sleep(5000);
    }

    @Test
    public void testCreate2() throws InterruptedException {
        WebElement fullname = driver.findElement(By.id("fullname"));
        fullname.sendKeys("linhntd");
        Thread.sleep(500);

        WebElement add = driver.findElement(By.id("address"));
        add.sendKeys("Hai Duong");
        Thread.sleep(500);

        WebElement username = driver.findElement(By.id("username"));
        username.sendKeys("abcdabcdabcd");
        Thread.sleep(500);

        WebElement password = driver.findElement(By.id("password"));
        password.sendKeys("abcdabcd");
        Thread.sleep(500);

        WebElement cfpassword = driver.findElement(By.id("confirmpass"));
        cfpassword.sendKeys("123asda");
        Thread.sleep(500);

        WebElement status = driver.findElement(By.xpath("//input[@name='gender' and @value='male']"));
        status.click();
        Thread.sleep(500);

        WebElement email = driver.findElement(By.id("email"));
        email.sendKeys("abcdabacd3@gmail.com");
        Thread.sleep(500);

        WebElement phone = driver.findElement(By.id("phone"));
        phone.sendKeys("0978266366");
        Thread.sleep(500);

        WebElement btn_submit = driver.findElement(By.id("btnRegister"));
        btn_submit.click();
        Thread.sleep(5000);
    }
    @AfterEach
    public void closeBrowser() {
        driver.quit();
    }

    @AfterAll
    public static void tearDown() {
        if (driver != null) {
            driver.quit();
        }
    }
}


