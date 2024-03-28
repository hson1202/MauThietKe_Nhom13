using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClothingShop.Models.Facade_Pattern
{
    /// <summary>
    /// Lớp ProductFacade là một phần của mẫu thiết kế Facade.
    /// Nó cung cấp một giao diện đơn giản cho việc tạo và quản lý thông tin sản phẩm.
    /// </summary>
    public class ProductFacade
    {
        // Khai báo biến thành viên
        ProductImage productImage;
        ProductInfo productInfo;

        // Constructor của lớp ProductFacade
        public ProductFacade(string FileImage, int productID, int? categoryID, int? nsxID, string productName, string descriptionPro, decimal? PRICE, string imgPro, int? quantity)
        {
            // Khởi tạo đối tượng ProductImage với tham số truyền vào
            productImage = new ProductImage(FileImage);

            // Khởi tạo đối tượng ProductInfo với tham số truyền vào
            productInfo = new ProductInfo(productID, categoryID, nsxID, productName, descriptionPro, PRICE, imgPro, quantity);
        }

        /// <summary>
        /// Phương thức ConstructProduct nhận một đối tượng Product và sử dụng các đối tượng ProductImage và ProductInfo để xây dựng thông tin cho sản phẩm.
        /// </summary>
        /// <param name="product">Đối tượng Product cần được xây dựng thông tin</param>
        public void ConstructProduct(Product product)
        {
            // Gọi các phương thức SetImage và SetInfo của các đối tượng productImage và productInfo để đặt thông tin cho sản phẩm
            productImage.SetImage(product);
            productInfo.SetInfo(product);
        }
    }
}
