-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `firsName` VARCHAR(191) NOT NULL,
    `lastName` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `mobile` VARCHAR(191) NOT NULL,
    `pasword` VARCHAR(191) NOT NULL,
    `otp` VARCHAR(191) NOT NULL,
    `create_at` DATE NOT NULL,
    `updated_at` DATE NOT NULL,

    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `categories` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `create_at` DATE NOT NULL,
    `updated_at` DATE NOT NULL,
    `userID` INTEGER NOT NULL,

    UNIQUE INDEX `categories_userID_key`(`userID`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `mobile` VARCHAR(191) NOT NULL,
    `user_id` INTEGER NOT NULL,
    `create_at` DATE NOT NULL,
    `updated_at` DATE NOT NULL,
    `userID` INTEGER NOT NULL,

    UNIQUE INDEX `customer_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Invoices` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `total` VARCHAR(191) NOT NULL,
    `discoutn` VARCHAR(191) NOT NULL,
    `vat` VARCHAR(191) NOT NULL,
    `payable` VARCHAR(191) NOT NULL,
    `user_id` BIGINT NOT NULL,
    `customer_id` BIGINT NOT NULL,
    `create_at` DATE NOT NULL,
    `updated_at` DATE NOT NULL,
    `userID` INTEGER NOT NULL,
    `custID` INTEGER NOT NULL,

    UNIQUE INDEX `Invoices_user_id_key`(`user_id`),
    UNIQUE INDEX `Invoices_customer_id_key`(`customer_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `invoice_products` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `invoice_id` BIGINT NOT NULL,
    `product_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `qty` VARCHAR(191) NOT NULL,
    `sale_price` VARCHAR(191) NOT NULL,
    `created_at` DATE NOT NULL,
    `updated_at` DATE NOT NULL,
    `userID` INTEGER NOT NULL,
    `invoiceId` INTEGER NOT NULL,

    UNIQUE INDEX `invoice_products_invoice_id_key`(`invoice_id`),
    UNIQUE INDEX `invoice_products_product_id_key`(`product_id`),
    UNIQUE INDEX `invoice_products_user_id_key`(`user_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `products` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `category_id` BIGINT NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `price` VARCHAR(191) NOT NULL,
    `unit` VARCHAR(191) NOT NULL,
    `img_url` VARCHAR(191) NOT NULL,
    `created_at` DATE NOT NULL,
    `updated_at` DATE NOT NULL,
    `userID` INTEGER NOT NULL,
    `userconnectID` INTEGER NOT NULL,
    `productID` INTEGER NOT NULL,

    UNIQUE INDEX `products_user_id_key`(`user_id`),
    UNIQUE INDEX `products_category_id_key`(`category_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `categories` ADD CONSTRAINT `categories_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customer` ADD CONSTRAINT `customer_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Invoices` ADD CONSTRAINT `Invoices_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Invoices` ADD CONSTRAINT `Invoices_custID_fkey` FOREIGN KEY (`custID`) REFERENCES `customer`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoice_products` ADD CONSTRAINT `invoice_products_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoice_products` ADD CONSTRAINT `invoice_products_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `Invoices`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_userID_fkey` FOREIGN KEY (`userID`) REFERENCES `invoice_products`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_userconnectID_fkey` FOREIGN KEY (`userconnectID`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `products` ADD CONSTRAINT `products_productID_fkey` FOREIGN KEY (`productID`) REFERENCES `categories`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
