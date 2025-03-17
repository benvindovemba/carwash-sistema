import { Router } from "express";
// import uploadConfig from "./config/multer"
// import multer from "multer";
// import { CreateUserController } from "./controller/user/CreateUserController";
// import { AuthUserController } from "./controller/user/AuthUserController";
// import { DetailUserController } from "./controller/user/DetailUserController";
// import { isAuthenticated } from "./middlewares/isAuthenticated";
// import { CreateCategoryController } from "./controller/category/createCategoryController";
// import { ListCategoryController } from "./controller/category/listeCategoryController";
// import { CreateProductController } from "./controller/product/CreateProductController";
// import { ListByCategoryController } from "./controller/product/ListByCategoryController";
// import { CreateOrderController } from "./controller/order/CreateOrderController";
// import { RemoveOrderController } from "./controller/order/RemoveOrderController";
// import { AddItemController } from "./controller/order/AddItemController";
// import { RemoveItemController } from "./controller/order/RemoveItemController";
// import { SendOrderController } from "./controller/order/SendOrderController";
// import { ListOrdersController } from "./controller/order/ListOrdersController";
// import { DetailOrderController } from "./controller/order/DetailOrderController";
// import { FinishOrderController } from "./controller/order/FinishOrderController";




const router = Router();

//const upload = multer(uploadConfig.upload('./temp'));
// ------ ROTAS USER ------------

// router.post('/users', new CreateUserController().handle)

// router.post('/session', new AuthUserController().handle)

// router.get('/me', isAuthenticated, new DetailUserController().handle)

// // ------ ROTAS CATEGORY ------------

// router.post('/category', isAuthenticated, new CreateCategoryController().handle)

// router.get('/category', isAuthenticated, new ListCategoryController().handle)

// // ------ ROTAS PRODUCT ------------

// router.post('/product', isAuthenticated, upload.single('file'),  new CreateProductController().handle)
// router.get('/category/product', isAuthenticated, new ListCategoryController().handle)

// // ------ ROTAS ORDER ------------

// router.post('/order', isAuthenticated, new CreateOrderController().handle)
// router.delete('/order', isAuthenticated, new RemoveOrderController().handle)
// router.post('/order/add', isAuthenticated, new AddItemController().handle)
// router.delete('/order/remove', isAuthenticated, new RemoveItemController().handle)
// router.put('/order/send', isAuthenticated, new SendOrderController().handle)
// router.get('/orders', isAuthenticated, new ListOrdersController().handle)
// router.get('/order/detail', isAuthenticated, new DetailOrderController().handle)
// router.put('/order/finish', isAuthenticated, new FinishOrderController().handle)

export { router };
