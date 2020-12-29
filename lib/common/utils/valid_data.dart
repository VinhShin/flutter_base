
/**
 * Created by mobit on 08/04/2016.
 */
class ValidateData {

    static RegExp validEmail(){
        return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    }

    static RegExp valiUser() {
        return RegExp(r'^[a-zA-Z0-9._-]{0,50}$');
    }

    static RegExp validPhone() {
        return RegExp(r'(03|07|08|09|01[2|6|8|9])+([0-9]{8})\b');
    }

    static RegExp valiLength(){
        return RegExp(r'a');
    }
}
