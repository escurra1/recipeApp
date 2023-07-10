# recipeApp
"DEVELOP" -> branch o rama que está el demo (pueden probar, clonar o descargar desde "develop")

Este es una app-demo en repositorio para que puedan ver un listado de recetas de comidas, puedan hacer el filtro de buscar por nombre de la receta, ver su descripción, país de origen, ver el lugar del restaurante donde lo preparan muy rico, se puede visualizar en un mapa.


Tecnologías usadas:

Swift 5.8, xCode 14.3

Se hace uso de una api "mockable.io" (la ruta y el path está en el código en la clase Constants).

Arquitectura: MVP (Model-View-Presenter)

Este proyecto está separada por capas y cada capa tiene responsabilidades única, por ejemplo hay una capa de interactor para llamar al servicio, otra capa para la vista (view), otra capa para la navegación (router), otra capa para los datos (data) y otra capa para la lógica del negocio (presenter).

Apartir de iOS 13.

Todo el código esta entendible.

El proyecto esta estructurado por carpetas.

Se usa patrón de diseño builder.

El diseño interface builder está en Storyboards y Xib.

Se adapta a todas las medidas de los iPhones desde un iPhone 8 hasta una 14 Pro Max.

Se usan UIViewController, UITableView, UISearchBar, UITextField, UIImage, UIView, UILabel, UINavigationController.

Para ver la ubicación de la receta se usa MapKit y MKPointAnnotation (la longitud y latitud lo trae desde el servicio y por front mobile se muestra).

Se valida la llamada a internet con Reachibility.

Para la carga del servicio de usa MBProgressHUD.

Para los strings se usa un archivo Localizable para que no haya hardcore de cadenas strings.

Se maneja una pantalla de error genérico (esta diseñado en el storyboard).

Se desarrolla con Unit test implementando XCTest por cada módulo.

Se usa las librerías Alamofire, AlamofireImage y SwiftMessages.

Alamofire.- para la llamada al servicio.

AlamofireImage.- para convertir la foto que viene del servicio a image y setear en el UIImage.

SwiftMessages.- para mostrar solo mensajes cuando no hay conexión a internet.

Se usa como gestor de dependencia Cocoapods. (por favor este proyecto abrir con el archivo de extensión .xcworkspace).
