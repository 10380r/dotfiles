from smtplib import SMTP
from email.mime.text import MIMEText


def create_message_plaintext(text):
    """
    プレーンテキストメールのオブジェクトを生成する
        text      : メールの本文
    """
    msg = MIMEText(text)
    return msg


def create_message_html(html):
    """
    htmlメールのオブジェクトを生成する
        html      : メールの本文(html)
    """
    msg = MIMEText(html, 'html')
    return msg


def send_message(from_addr, to_addrs, password, msg):
    """
    メールを送信する
        from_addr : 送信者のメールアドレス
        to_addrs  : 受信者のメールアドレスのリスト
                    (ただの文字列の場合は長さ１のリストとして扱う)
        password  : googleアカウントのアプリパスワード
        msg       : メールオブジェクト
    """
    with SMTP(host="smtp.gmail.com", port=587) as smtp:
        smtp.starttls() # tls通信を開始させる
        smtp.login(
                user = from_addr,
                password = password,
                )
        smtp.send_message(
                from_addr = from_addr,
                to_addrs = to_addrs,
                msg = msg,
                )

def main():
    """
    from_addr  : 送信者のメールアドレス
    to_addrs   : 受信者のメールアドレス 複数の送信先に送信したい場合はリストで指定する。
    password   : googleアカウントのアプリパスワード
    subject    : 件名
    textv      : 本文 htmlと同時に指定することはできない。
    html       : htmlでメールを送る際のhtml plainと同時に指定することはできない。
    """

    from_addr = 'from@example.com'
    to_addrs  = 'to@example.com'
    password  = '' 
    subject   = 'subject'
    text      = 'this is sent from python script'
    html = 'html書いてね'

    msg = create_message_plaintext(text)
    # msg = create_message_html(html)
    # to_addrsはリストであることを想定しているが、リストでなかった場合にリストに変換
    if type(to_addrs) is not list:
        to_addrs = [to_addrs]
    # RFCに則り、カンマ区切りで複数人へのメール送信が可能
    msg['To'] = ','.join(to_addrs) 
    msg['Subject'] = subject
    send_message(from_addr, to_addrs, password, msg)


if __name__ == '__main__':
    main()
