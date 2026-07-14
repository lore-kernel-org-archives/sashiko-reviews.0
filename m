Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EFB3EEAF0
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 20:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784061586; cv=none; b=TAZk/KAMUqiE1VK11cHOL7mPdZwVX6OoKUsVyx0Ng/iW+1ooCtAlPBzBCJNUB+I0C9yP982ZMtCcg/rF5qrZrZKbZAea91VyP61PFhteYoMHrMp2HEMYHGN4dJPvfGnpx5exoM3COwAsos/V4V6VxJPNMzOtYgAdqPxN7KMF3gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784061586; c=relaxed/simple;
	bh=FBBa9dhL9917F3OcmR5Tscs1K6cFUVbxn1jGmTddpkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QbfxCAKQ7BH0Q6lqrt0KrWax+OiEOeURgrTCeg7Vkdco8pwAn4xpIVvwmMQu6VqHOJcqSxECEsRDVXUOLnykWExozZvCnjV9wMg+UO/7oAwmDymjUXxVJsNXzynZ8t3/v37S7eAM3oEy5P+U5DAJRbe7SaLHivh48z+gf6RmLxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bX5kmhqL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bX5kmhqL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso34176605e9.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784061583; x=1784666383; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/u8DsZ0eIRa2g/5SoCaTvebv+Ssy+0KgOmxxIfNFxNA=;
        b=bX5kmhqLzX2UngiKKoCgjIYJYzppiNKqIJ82tknmC3nGkhsQhy0BHsL/lHKiaDs5k0
         5eIoQoevjqD2P+njJm9KwFSoJzmjFPRfYoWqNq7NhblMtlgSwokKy9HVkw8B3qBRE30d
         EULzP1cBOVI91DZvqhQ/KxqJygkElUrQi6AhcfW3sOEBv/STukaJFXPhAqxQG3rvTINZ
         x7mAPrjjHsMFjpapia+AaAMJPHj2NmhmPt/A1DuOzuPw086bAzxq4+mkAeY0pSCyTYbj
         Cr3pKE0tj4JmCgll8HMBBo/zBQw1j5XQ3y++nYWlLfui006fyzer+SwDkWqBY96AyJih
         +jxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784061583; x=1784666383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/u8DsZ0eIRa2g/5SoCaTvebv+Ssy+0KgOmxxIfNFxNA=;
        b=Hyriu19orT4deOHCc2TMjicpY3FJWZTtui9i9kh6s4cyvVlkXVoelT9aiaZfCI30pL
         0wUMo1h/TyEj7y6b+hIIBRg+U45wj032PQKmfOgiFZMcuZeckd9HXFEa5HJMff7ExtOd
         rPBBhV6of1EE9SxIdVWtW8hRN+kgTFF50AEFZmJbEQVvtyjUdmD7LzHPJw349Hi5Tpjm
         7tu50SR93+U8Au7NTPZbBqPvErRPdDz+fCHL9eGdFPMGijlZ1J7oLLb0g7HqONDpaoDq
         b82y+tktZMSz/O+qVo9arRI1PSVQuoz4qS7zUk1/spS47GyMgLAZ30HiZEzWrJYjwuza
         srTQ==
X-Forwarded-Encrypted: i=1; AHgh+RpTOcapr8HSor9RyDExCqYM+q23G0vjsbpzZSB4tjKbXj0w74moqY3red7RW1xn9QpSnj+8CrRHk9ddawoGZSQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvDG2Y4QgySqL5FO1n7d84MbgUIjSt6rRQy/k0s9ibp+HJ3KVd
	cpF4qdzIeb5bCy2VFNZinPUXY8ccyMmxxd0DlBVMwWUcFf281RzPKcFm
X-Gm-Gg: AfdE7clN8HHN8TO2Sm7bsKy9c3g+jSLQ4Mdh7xLoi+APGf/3esZ/twFtcUwo0EaMxJ3
	OlSa/bhtEU3ekWLqlAjSXwk44gvIfZWTWPD8dYiCd+/rPm/8AV5RGeZtIKoEFJv6mdgVst1Qwtz
	aMqKjpBALI5aY6D0+SZnp4sOHh8ep2D4Y/tU5fpKdB02QYIED8mlvpp8XQCMlbAVUtIbwmJ4ySY
	q8pGZrsU2lYLU4gOTRjZJ4s/jmfK0tw6/LDpQkKmjqFJp8RJ7BQSE1hIzAmmj52Var7AaXRDLdg
	PavX3AiVGpj2X2TgAvsx1gCV/EE7YKBSh3khV4U0+1n9GQDsWto4oLUkOQwNiJ2LVTRPcHO43Go
	N88ntRkiPF0reV3beIbHbVLgT3zMja13UXDXP77hOlWCKZ+hstvpJQGlQ2g855u13uP7tYFADUA
	UR4sNi2i2i7Ez/HxvwZIV/9hqYULmSgFSky5IKoqaBPfQo/GX28wi+2BqZ+L8QEvgJbAmeQGEpW
	2e9
X-Received: by 2002:a05:600c:c16e:b0:493:c8cf:27bd with SMTP id 5b1f17b1804b1-49515904fa9mr60720155e9.19.1784061582835;
        Tue, 14 Jul 2026 13:39:42 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32c65asm98894115e9.14.2026.07.14.13.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:39:42 -0700 (PDT)
From: Nnamdi Onyeyiri <nnamdio@gmail.com>
To: jiayuan.chen@linux.dev
Cc: nnamdio@gmail.com,
	john.fastabend@gmail.com,
	jakub@cloudflare.com,
	edumazet@google.com,
	ncardwell@google.com,
	kuniyu@google.com,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v3 1/2] bpf, sockmap: handle spurious tcp_msg_wait_data() wakeup
Date: Tue, 14 Jul 2026 21:39:26 +0100
Message-ID: <20260714203927.32289-2-nnamdio@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260714203927.32289-1-nnamdio@gmail.com>
References: <5b07d2ab-84ee-46ae-84c9-7542499d26d7@linux.dev>
 <20260714203927.32289-1-nnamdio@gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

recvfrom()/recv() are documented as only returning EAGAIN for blocking sockets
when they have a receive timeout configured.  However, adding a blocking
ipv4 tcp socket without a receive timeout to a sockmap will cause EAGAIN errors
sporadically.  A socket with a receive timeout may return EAGAIN before the
timeout expires.

There are 2 code paths affected by this:

  1. tcp_bpf_recvmsg() - Used when the socket has been added to a sockmap
     that has no verdict program attached.

  2. tcp_bpf_recvmsg_parser() - Used when the socket has been added to a
     sockmap that has a verdict program.  To reproduce this issue, it is
     enough for the verdict program to do nothing but return SK_PASS.

In both cases this happens when tcp_msg_wait_data() wakes spuriously
(returning 0).  To fix it, we now loop back to msg_bytes_ready instead
of returning -EAGAIN on spurious wakeup.

To ensure the looping does not cause sockets with a SO_RCVTIMEO set to
wait excessively long, tcp_msg_wait_data() now takes a pointer to timeo,
allowing sk_wait_event() to update it as appropriate.

The logic in tcp_bpf_recvmsg_parser() that allow it to handle signals,
socket errors and closuers in its loop was also added to tcp_bpf_recvmsg().

Signed-off-by: Nnamdi Onyeyiri <nnamdio@gmail.com>
---
 net/ipv4/tcp_bpf.c | 55 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
index cc0bd73f36b6..e58ab2d1ee94 100644
--- a/net/ipv4/tcp_bpf.c
+++ b/net/ipv4/tcp_bpf.c
@@ -179,7 +179,7 @@ EXPORT_SYMBOL_GPL(tcp_bpf_sendmsg_redir);
 
 #ifdef CONFIG_BPF_SYSCALL
 static int tcp_msg_wait_data(struct sock *sk, struct sk_psock *psock,
-			     long timeo)
+			     long *timeo)
 {
 	DEFINE_WAIT_FUNC(wait, woken_wake_function);
 	int ret = 0;
@@ -187,12 +187,12 @@ static int tcp_msg_wait_data(struct sock *sk, struct sk_psock *psock,
 	if (sk->sk_shutdown & RCV_SHUTDOWN)
 		return 1;
 
-	if (!timeo)
+	if (!*timeo)
 		return ret;
 
 	add_wait_queue(sk_sleep(sk), &wait);
 	sk_set_bit(SOCKWQ_ASYNC_WAITDATA, sk);
-	ret = sk_wait_event(sk, &timeo,
+	ret = sk_wait_event(sk, timeo,
 			    !list_empty(&psock->ingress_msg) ||
 			    !skb_queue_empty_lockless(&sk->sk_receive_queue), &wait);
 	sk_clear_bit(SOCKWQ_ASYNC_WAITDATA, sk);
@@ -229,6 +229,7 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
 	int copied_from_self = 0;
 	int copied = 0;
 	u32 seq;
+	long timeo;
 
 	if (unlikely(flags & MSG_ERRQUEUE))
 		return inet_recv_error(sk, msg, len);
@@ -262,6 +263,8 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
 		}
 	}
 
+	timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
+
 msg_bytes_ready:
 	copied = __sk_msg_recvmsg(sk, psock, msg, len, flags, &copied_from_self);
 	/* The typical case for EFAULT is the socket was gracefully
@@ -280,7 +283,6 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
 	}
 	seq += copied_from_self;
 	if (!copied) {
-		long timeo;
 		int data;
 
 		if (sock_flag(sk, SOCK_DONE))
@@ -299,7 +301,6 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
 			goto out;
 		}
 
-		timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
 		if (!timeo) {
 			copied = -EAGAIN;
 			goto out;
@@ -310,13 +311,15 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
 			goto out;
 		}
 
-		data = tcp_msg_wait_data(sk, psock, timeo);
+		data = tcp_msg_wait_data(sk, psock, &timeo);
 		if (data < 0) {
 			copied = data;
 			goto unlock;
 		}
 		if (data && !sk_psock_queue_empty(psock))
 			goto msg_bytes_ready;
+		if (!data && timeo > 0)
+			goto msg_bytes_ready;
 		copied = -EAGAIN;
 	}
 out:
@@ -355,6 +358,7 @@ static int tcp_bpf_recvmsg(struct sock *sk, struct msghdr *msg, size_t len,
 {
 	struct sk_psock *psock;
 	int copied, ret;
+	long timeo;
 
 	if (unlikely(flags & MSG_ERRQUEUE))
 		return inet_recv_error(sk, msg, len);
@@ -371,14 +375,45 @@ static int tcp_bpf_recvmsg(struct sock *sk, struct msghdr *msg, size_t len,
 		return tcp_recvmsg(sk, msg, len, flags);
 	}
 	lock_sock(sk);
+
+	timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
+
 msg_bytes_ready:
 	copied = sk_msg_recvmsg(sk, psock, msg, len, flags);
 	if (!copied) {
-		long timeo;
 		int data;
 
-		timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
-		data = tcp_msg_wait_data(sk, psock, timeo);
+		if (sock_flag(sk, SOCK_DONE)) {
+			ret = 0;
+			goto unlock;
+		}
+
+		if (sk->sk_err) {
+			ret = sock_error(sk);
+			goto unlock;
+		}
+
+		if (sk->sk_shutdown & RCV_SHUTDOWN) {
+			ret = 0;
+			goto unlock;
+		}
+
+		if (sk->sk_state == TCP_CLOSE) {
+			ret = -ENOTCONN;
+			goto unlock;
+		}
+
+		if (!timeo) {
+			ret = -EAGAIN;
+			goto unlock;
+		}
+
+		if (signal_pending(current)) {
+			ret = sock_intr_errno(timeo);
+			goto unlock;
+		}
+
+		data = tcp_msg_wait_data(sk, psock, &timeo);
 		if (data < 0) {
 			ret = data;
 			goto unlock;
@@ -390,6 +425,8 @@ static int tcp_bpf_recvmsg(struct sock *sk, struct msghdr *msg, size_t len,
 			sk_psock_put(sk, psock);
 			return tcp_recvmsg(sk, msg, len, flags);
 		}
+		if (!data && timeo > 0)
+			goto msg_bytes_ready;
 		copied = -EAGAIN;
 	}
 	ret = copied;
-- 
2.52.0

