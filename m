Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AEF3CE489
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 21:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784582173; cv=none; b=KlqT7cuS3SnRVbn8MLIhCGxwU1a8ZrniApFNmldn/N6317SDGea6yAzbvE6fg4gM6mj3lGrDXODXKgMGKhVDZkKV7bU2Nup7/PjVXNWObaiziNoo5S/8eOxh1cMqGg2GqogJcKaKL1O9LW3r0WYrMD8fyGBNBuYgAurwXQRY+OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784582173; c=relaxed/simple;
	bh=EkDLUhHkVdgAGlVlMw4IHFAsXUm0ZTI1gKZCuc2A1eg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=eX9W0iqxZFTHyVeffCX7KV3o291T7vXV88mWe0m7vJNJq3U+bF1KHjjrCSpWcGF/3RAYW4vrj2xetjY3yMRGJaMSQYRcpQd6AjKenxI+22RBgGV6NwIZIGb3auy72uAjEewqvpvCWfEw7UfKiJ3oy6MbaoRQIwfT5sEk7/3gfqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=HPgh5nFu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="HPgh5nFu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cea3004256so122274775ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 14:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1784582170; x=1785186970; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Lk9nZncA9Gi9IHgsqlcnOIHsiF41+5jkUNql3/JHM0=;
        b=HPgh5nFuD2H8MhmTlJVLvfRLsK3rbKJJWFkRGmGnje2iAvYXw56g1Hh5Hpu3vPAZv/
         kRYcI1mNJMTqigLz+Yhu+ew11Vmn/CzMacMOf3HEV7tVthB886cnTFtKZ0/uACuDUunS
         ipUYrTI8ozwJUZGkpciqMp9jDqSEiG126VmLa1FYcNCyQQYveoqsd0pb9q+FE3mehNDb
         HkFUPxzQ7TSAlCJZcU0w0BNhx6jO56n4/HFyfd0I79f54RSaLt5aaRIfTskzZONB38k6
         RSysbm4sEYTlyC4U6d9xV0Ag8K7+2iEVC808QadSK0Zcm2/nEWRGqUTsLeQRukhGwzi9
         hxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784582170; x=1785186970;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Lk9nZncA9Gi9IHgsqlcnOIHsiF41+5jkUNql3/JHM0=;
        b=nr6xVnxIec9LnAzBV8L28cuQSb+XLzimtfzv/TV88eDzrpqVcNwayff5pWg4XwTIm/
         ywyG4QuuDjpnXYU265q/GEAX0VaxQ+cs/GxpfIwAn7Ut5LYCiZCssYKyHeuJRmQa6CWT
         JotgeBZWsj2eU7BtztR3oDyZfQw/oElQpkHxpdNelns+xVJEEktBpZr3TlEv+2PY0Nra
         lF4dLEnVVeKcIfN4ry+FFJgKv+/43dXZb5MYBMT5LfIjDmlp0qkslqQ+lFMAzHJzkhdZ
         EYrEJ+gKwrsu2MgOxiGwBYPYDWcziCOWutWiwCXyX5qsigFZ/yi6kxYe1QwBtAp850ou
         MI4A==
X-Forwarded-Encrypted: i=1; AHgh+Rq6KxnolW/kCX0vfuRtQaSI3PW5Bl9UIOzP9hw9jwXDZ/eCHxGl3tmxEl7CmewoWeiGIpScm4qk2vAPPUsQAv8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMPOaja4O3A+aS1oggXqxsLw4vMn9TjA5VoGChvJMHwVVUI9qd
	iinTmZCcapBZncPQeqlWjyGjPY44r8FqN/OHcNUt1Av0SXiobxRoPNe9nAvbWYSpNo4=
X-Gm-Gg: AR+sD13a3HM9O5iq8OCaoHubTYyFhpAOiMRCaYySker/58fsL1IvcEOa1m7/HapwsJj
	tiPPzLuhCnQFZtkUniLulKcU7k5vwyvsL/XjtmqBrPz6QZ5XB7Nns3VdH9kQZSWqQm3/RxO+I/K
	cqatPQjaqjaVaG47RoW3kjFU1rv8DRO4R9lZN2HErsBLLuXxnOfhxqh5exr06DfPVhEAKCtIZ6J
	FTciv5wEyC3TzzNiR+d94DADDInCWGT3V9mnsYN4aYOztwJyrvtYCF2FtfBkS9KdjIYv+ideelj
	LFiYgl4VUM9pyzWoiqzt/cLIi8w5GLkb/1G4UHe7GVBHqrbyFwEA1poSe2sHRfiLKNPrXdoRgcQ
	FSFbYd7JnYBWRNVeRISlS+a//qfwzm4ftzgMf9+8AUCHPNkWHCv84xApweNkzBRbaJ5UG0GP+OD
	r1zW3+ba4J6/R6ZlTfjma5Xel1k+N2DT4=
X-Received: by 2002:a17:902:ef49:b0:2ce:9b49:d4a0 with SMTP id d9443c01a7336-2cf34994db6mr177804055ad.35.1784582169654;
        Mon, 20 Jul 2026 14:16:09 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3473ba1dsm62513545ad.65.2026.07.20.14.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 14:16:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 17:16:08 -0400
Message-Id: <DK3PKY6RN5FI.4DKPSHWNEBHM@etsalapatis.com>
Cc: <bpf@vger.kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
 <horms@kernel.org>, <jakub@cloudflare.com>, <jiayuan.chen@linux.dev>,
 <john.fastabend@gmail.com>, <kuba@kernel.org>, <kuniyu@google.com>,
 <ncardwell@google.com>, <netdev@vger.kernel.org>, <pabeni@redhat.com>,
 <sashiko-reviews@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] bpf, sockmap: handle spurious
 tcp_msg_wait_data() wakeup
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Nnamdi Onyeyiri" <nnamdio@gmail.com>
X-Mailer: aerc 0.20.1
References: <20260720171535.67867-1-nnamdio@gmail.com>
 <20260720171535.67867-2-nnamdio@gmail.com>
In-Reply-To: <20260720171535.67867-2-nnamdio@gmail.com>

On Mon Jul 20, 2026 at 1:15 PM EDT, Nnamdi Onyeyiri wrote:
> recvfrom()/recv() are documented as only returning EAGAIN for blocking so=
ckets
> when they have a receive timeout configured.  However, adding a blocking
> ipv4 tcp socket without a receive timeout to a sockmap will cause EAGAIN =
errors
> sporadically.  A socket with a receive timeout may return EAGAIN before t=
he
> timeout expires.
>
> There are 2 code paths affected by this:
>
>   1. tcp_bpf_recvmsg() - Used when the socket has been added to a sockmap
>      that has no verdict program attached.
>
>   2. tcp_bpf_recvmsg_parser() - Used when the socket has been added to a
>      sockmap that has a verdict program.  To reproduce this issue, it is
>      enough for the verdict program to do nothing but return SK_PASS.
>
> In both cases this happens when tcp_msg_wait_data() wakes spuriously
> (returning 0).  To fix it, we now loop back to msg_bytes_ready instead
> of returning -EAGAIN on spurious wakeup.
>
> To ensure the looping does not cause sockets with a SO_RCVTIMEO set to
> wait excessively long, tcp_msg_wait_data() now takes a pointer to timeo,
> allowing sk_wait_event() to update it as appropriate.
>
> The logic in tcp_bpf_recvmsg_parser() that allow it to handle signals,
> socket errors and closuers in its loop was also added to tcp_bpf_recvmsg(=
).
>
> Signed-off-by: Nnamdi Onyeyiri <nnamdio@gmail.com>
> ---
>  net/ipv4/tcp_bpf.c | 69 ++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 60 insertions(+), 9 deletions(-)
>
> diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
> index cc0bd73f36b6..aa5c5d741599 100644
> --- a/net/ipv4/tcp_bpf.c
> +++ b/net/ipv4/tcp_bpf.c
> @@ -179,7 +179,7 @@ EXPORT_SYMBOL_GPL(tcp_bpf_sendmsg_redir);
> =20
>  #ifdef CONFIG_BPF_SYSCALL
>  static int tcp_msg_wait_data(struct sock *sk, struct sk_psock *psock,
> -			     long timeo)
> +			     long *timeo)
>  {
>  	DEFINE_WAIT_FUNC(wait, woken_wake_function);
>  	int ret =3D 0;
> @@ -187,12 +187,12 @@ static int tcp_msg_wait_data(struct sock *sk, struc=
t sk_psock *psock,
>  	if (sk->sk_shutdown & RCV_SHUTDOWN)
>  		return 1;
> =20
> -	if (!timeo)
> +	if (!*timeo)
>  		return ret;
> =20
>  	add_wait_queue(sk_sleep(sk), &wait);
>  	sk_set_bit(SOCKWQ_ASYNC_WAITDATA, sk);
> -	ret =3D sk_wait_event(sk, &timeo,
> +	ret =3D sk_wait_event(sk, timeo,
>  			    !list_empty(&psock->ingress_msg) ||
>  			    !skb_queue_empty_lockless(&sk->sk_receive_queue), &wait);
>  	sk_clear_bit(SOCKWQ_ASYNC_WAITDATA, sk);
> @@ -229,6 +229,7 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
>  	int copied_from_self =3D 0;
>  	int copied =3D 0;
>  	u32 seq;
> +	long timeo;
> =20
>  	if (unlikely(flags & MSG_ERRQUEUE))
>  		return inet_recv_error(sk, msg, len);
> @@ -262,6 +263,8 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
>  		}
>  	}
> =20
> +	timeo =3D sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
> +
>  msg_bytes_ready:
>  	copied =3D __sk_msg_recvmsg(sk, psock, msg, len, flags, &copied_from_se=
lf);
>  	/* The typical case for EFAULT is the socket was gracefully
> @@ -280,7 +283,6 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
>  	}
>  	seq +=3D copied_from_self;
>  	if (!copied) {
> -		long timeo;
>  		int data;
> =20
>  		if (sock_flag(sk, SOCK_DONE))
> @@ -299,7 +301,6 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
>  			goto out;
>  		}
> =20
> -		timeo =3D sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
>  		if (!timeo) {
>  			copied =3D -EAGAIN;
>  			goto out;
> @@ -310,13 +311,15 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
>  			goto out;
>  		}
> =20
> -		data =3D tcp_msg_wait_data(sk, psock, timeo);
> +		data =3D tcp_msg_wait_data(sk, psock, &timeo);
>  		if (data < 0) {
>  			copied =3D data;
>  			goto unlock;
>  		}
>  		if (data && !sk_psock_queue_empty(psock))
>  			goto msg_bytes_ready;
> +		if (!data && timeo > 0)
> +			goto msg_bytes_ready;
>  		copied =3D -EAGAIN;
>  	}
>  out:
> @@ -355,6 +358,7 @@ static int tcp_bpf_recvmsg(struct sock *sk, struct ms=
ghdr *msg, size_t len,
>  {
>  	struct sk_psock *psock;
>  	int copied, ret;
> +	long timeo;
> =20
>  	if (unlikely(flags & MSG_ERRQUEUE))
>  		return inet_recv_error(sk, msg, len);
> @@ -371,14 +375,59 @@ static int tcp_bpf_recvmsg(struct sock *sk, struct =
msghdr *msg, size_t len,
>  		return tcp_recvmsg(sk, msg, len, flags);
>  	}
>  	lock_sock(sk);
> +
> +	timeo =3D sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
> +
>  msg_bytes_ready:
>  	copied =3D sk_msg_recvmsg(sk, psock, msg, len, flags);
>  	if (!copied) {
> -		long timeo;
>  		int data;
> =20
> -		timeo =3D sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
> -		data =3D tcp_msg_wait_data(sk, psock, timeo);
> +		if (sock_flag(sk, SOCK_DONE)) {
> +			ret =3D 0;
> +			goto unlock;
> +		}
> +
> +		if (sk->sk_err) {
> +			if (!sk_psock_queue_empty(psock))
> +				goto msg_bytes_ready;
> +			if (!skb_queue_empty(&sk->sk_receive_queue)) {
> +				release_sock(sk);
> +				sk_psock_put(sk, psock);
> +				return tcp_recvmsg(sk, msg, len, flags);
> +			}
> +			ret =3D sock_error(sk);
> +			goto unlock;
> +		}
> +
> +		if (sk->sk_shutdown & RCV_SHUTDOWN) {
> +			if (!sk_psock_queue_empty(psock))
> +				goto msg_bytes_ready;
> +			if (!skb_queue_empty(&sk->sk_receive_queue)) {
> +				release_sock(sk);
> +				sk_psock_put(sk, psock);
> +				return tcp_recvmsg(sk, msg, len, flags);
> +			}
> +			ret =3D 0;
> +			goto unlock;

These two error handling routines above look identical. Can you refactor
them?

> +		}
> +
> +		if (sk->sk_state =3D=3D TCP_CLOSE) {
> +			ret =3D -ENOTCONN;
> +			goto unlock;
> +		}
> +
> +		if (!timeo) {
> +			ret =3D -EAGAIN;
> +			goto unlock;
> +		}
> +

Since this handling (which Sashiko flags by the way, correctly AFAICT)=20
are taken from tcp_bpf_recvmsg, there is obvious overlap between the two
functions. Please factor those out so that they share the logic between
them.

pw-bot: cr

> +		if (signal_pending(current)) {
> +			ret =3D sock_intr_errno(timeo);
> +			goto unlock;
> +		}
> +
> +		data =3D tcp_msg_wait_data(sk, psock, &timeo);
>  		if (data < 0) {
>  			ret =3D data;
>  			goto unlock;
> @@ -390,6 +439,8 @@ static int tcp_bpf_recvmsg(struct sock *sk, struct ms=
ghdr *msg, size_t len,
>  			sk_psock_put(sk, psock);
>  			return tcp_recvmsg(sk, msg, len, flags);
>  		}
> +		if (!data && timeo > 0)
> +			goto msg_bytes_ready;
>  		copied =3D -EAGAIN;
>  	}
>  	ret =3D copied;

