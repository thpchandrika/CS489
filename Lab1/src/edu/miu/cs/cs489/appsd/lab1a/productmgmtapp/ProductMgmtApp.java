package edu.miu.cs.cs489.appsd.lab1a.productmgmtapp;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

import edu.miu.cs.cs489.appsd.lab1a.productmgmtapp.model.Product;

public class ProductMgmtApp {
    public static void main(String[] args) {
        System.out.println("Welcome to ProductMgmtApp!");
        Product[] products = new Product[] {
                new Product(3128874119L, "Banana",
                        LocalDate.of(2024, 04, 1), 124, 0.55),
                new Product("Apple"),
                new Product("Carrot")
        };
        printProducts(products);
    }

    public static void printProducts(Product[] products) {
        Arrays.sort(products, new Comparator<Product>() {
            public int compare(Product p1, Product p2) {
                return p1.getName().compareTo(p2.getName());
            }
        });
        printProductsInJson(products);
        printProductsInXml(products);
        printProductsInCsv(products);
    }

    public static void printProductsInJson(Product[] products) {
        System.out.println("Printed in JSON format");
        System.out.println("=====================================");
        StringBuilder sb = new StringBuilder();
        sb.append("[\n");
        for (Product product : products) {
            sb.append("\t" + product + ",\n");
        }
        sb.append("\n]");
        System.out.println(sb.toString());
    }

    public static void printProductsInXml(Product[] products) {
        System.out.println("Printed in Xml format");
        System.out.println("=============================================");
        StringBuilder sb = new StringBuilder();
        sb.append("<products>\n");
        for (Product product : products) {
            sb.append("\t<product productId=" + product.getProductId() + " name=" + product.getName() + " dateSupplied="
                    + product.getDateSupplied()
                    + " quantityInStock=" + product.getQuantityInStock() + " unitPrice=" + product.getUnitPrice()
                    + " />\n");
        }
        sb.append("</products>");
        System.out.println(sb.toString());
    }

    public static void printProductsInCsv(Product[] products) {
        System.out.println("Printed in Csv format");
        System.out.println("===============================================");
        StringBuilder sb = new StringBuilder();
        for (Product product : products) {
            sb.append("\t");
            sb.append(product.getProductId() + ", "
                    + product.getName() + ", "
                    + product.getDateSupplied()
                    + ", " + product.getQuantityInStock()
                    + ", " + product.getUnitPrice()
                    + "\n");
        }
        System.out.println(sb.toString());
    }
}
