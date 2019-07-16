import '../utils/request.dart';
announce() async{
  /**
 * @announce 的返回值
 * id
 * time
 * title
 * content
 */
  return await  getMethod("/api/announce");
}

sendAnnounce(){

}