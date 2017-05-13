package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import hibernate.HibernateUtils;
import model.Book;
import model.User;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Map;


/**
 * Created by Zxc-Hugo on 2017/5/10.
 */
public class MyBookOperation extends ActionSupport {
    int bookID;
    Book book;
    File imageCover;
    File imageContent01;
    File imageContent02;
    File imageContent03;

    public File getImageContent01() {
        return imageContent01;
    }

    public void setImageContent01(File imageContent01) {
        this.imageContent01 = imageContent01;
    }

    public File getImageContent02() {
        return imageContent02;
    }

    public void setImageContent02(File imageContent02) {
        this.imageContent02 = imageContent02;
    }

    public File getImageContent03() {
        return imageContent03;
    }

    public void setImageContent03(File imageContent03) {
        this.imageContent03 = imageContent03;
    }

    public File getImageContent04() {
        return imageContent04;
    }

    public void setImageContent04(File imageContent04) {
        this.imageContent04 = imageContent04;
    }

    File imageContent04;

    public File getImageCover() {
        return imageCover;
    }

    public void setImageCover(File imageCover) {
        this.imageCover = imageCover;
    }


    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    /**
     * 修改已发布的书的内容
     * @return
     * @throws Exception
     */
    public String reviseBook() throws Exception {
        // 更新书的基本信息
        Map httpSession = ActionContext.getContext().getSession();
        Session session =  HibernateUtils.getSession();
        Transaction tx = session.beginTransaction();
        book.setIschecked((byte)0);
        book.setIsfinished((byte)0);
        book.setUser((User) httpSession.get("user"));
        session.update(book);
        tx.commit();

        //更新图片
        if(imageCover != null)
            saveImage(imageCover, 0);
        if(imageContent01 != null)
            saveImage(imageContent01, 1);
        if(imageContent02 != null)
            saveImage(imageContent02, 2);
        if(imageContent03 != null)
            saveImage(imageContent03, 3);

        return SUCCESS;
    }

    /**
     * 保存图片
     * @param image
     * @param index   第几张图
     */
    protected void saveImage(File image, int index) throws Exception {
        String targetDirectory = ServletActionContext.getServletContext().getRealPath("/image")+"/";
        targetDirectory = targetDirectory + book.getUser().getIduser() + book.getIsbn() + index + ".jpg";
        FileOutputStream fos = new FileOutputStream(targetDirectory);
        FileInputStream fis = new FileInputStream(image);
        byte[] buffer = new byte[1024];
        int len;
        while((len = fis.read(buffer)) > 0) {
            fos.write(buffer, 0, len);
        }
        fos.close();
        fis.close();
    }

    /**
     * 删除已发布的书
     * @return
     * @throws Exception
     */
    public String deleteBook() throws Exception {
        //System.out.print(bookID);
        // 从数据库中删除
        Session session = HibernateUtils.getSession();
        Transaction tx = session.beginTransaction();
        Book book = session.load(Book.class, bookID);
        session.delete(book);
        //Query query = session.createQuery("delete from Book where idbooks = ?");
        //query.setParameter(0,bookID);
        //query.executeUpdate();
        tx.commit();
        HibernateUtils.destorySession();

        // 删除相应图片,共4张
        String targetDirectory = ServletActionContext.getServletContext().getRealPath("/image")+"/";
        for(int i = 0; i < 4; i++){
            File file = new File(targetDirectory+book.getUser().getIduser()+book.getIsbn()+i+".jpg");
            if (file.exists()&&file.isFile())
                file.delete();
        }

        return SUCCESS;
    }


}
