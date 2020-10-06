 class HttpException implements Exception{
   final String mesage;
   HttpException(this.mesage);

   @override 
  String toString(){
     return this.mesage;
   }
 }