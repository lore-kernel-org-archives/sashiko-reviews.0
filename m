Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643A1370AFC
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 21:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784151347; cv=none; b=uR3WZRhU1wPue6p62mjscA3gYDdzsIFosktFxhzrF8KlrGP4+f9U+jR1JrvyX+kWQ7KVzKC2k29fIsHWq2ZDYOrBVKVszV13/ilOI+rll1WGU2z/MDojn4IGXvMqUy28gJvLTEryHCIbA7If5VhUKN73ngnUw5iRcBN5wNosrRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784151347; c=relaxed/simple;
	bh=s3q9wJaNCd4aqGAfSgzhEmwkY7JI4EZuWLp6kixzQpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqIbp3eL2p1u45//ya+JKqHaE5mNsM6CrwPq8riVVlS4eCnCDq4MJsqhA5YH0RbcNdheq8ezLx05dDrropEyIyQQ30hqQWaxZ0WEmMEA5YdVsM/LB6M+hnW+5iUE41YA4koYspqNFuyC0WCvBiWS6ihEWUA+vCozQBiIgFxRLIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=puhAMFSH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="puhAMFSH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47de0093c42so2160000f8f.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 14:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784151344; x=1784756144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OyPjQCXherIdXkhKswzDtmo6q9pYSImGwr9J9riqS9s=;
        b=puhAMFSH+V0zxlcYOsSFet+evYxzoaWI7U+loFc/4euEQOn4HlVb4z7VF2yvGcMdCG
         rMxABRo+tO+RBaxaJMOVkjoGcSMFQSRp9FhMIyLDUbdH04lPKCsd3SVLVmdjKCZaXM0r
         3Mrmv/pNXXCSzrVT+0tGVt3zGVWmDmG4FyhctC8j6vzmAAje/sHg70O6HJws/Vp5BwgA
         ini66A42Gff0Z1pvD57B5wtyH/rzH9uPMBGtCC49b3pPwWn8t34f0U9KIayaTM3vX4VG
         DUz71c32+U9W+GKmX1mZkiF1QFElI7sChY2vmGRYaGYUREzy/2H1HDU3dsR1ACXBQc+X
         PrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784151344; x=1784756144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OyPjQCXherIdXkhKswzDtmo6q9pYSImGwr9J9riqS9s=;
        b=jj6vgrmWXKLJHbmItXrD7ctcpleUzEjXeXAvDUrNGCKcZ6D58KPr1+g+HCSZSDf3R+
         fAOB1z5NrcYtBrMNRSVKuWRXMBjzYjJqJ+N3H3pkH2FXOD2GGzfnpIJEVbjlwT2B80/s
         9G5/kjgEdLui5skvfiImgwo+5miboxcsClNEBY1FptipiMgcuWdr5mS/tQwVNt1lpawc
         p9P+fYAVx+DuGx2JPCpjItEuSOpB9+BuC8DLUnxqqmQPT0cpH/8XnW7Ce3pw+hIwDsG9
         x49Il4aB4oKo7ed00P6MtPojJTDtfrFjCVEvMnpPh0zzBdX3fdWwn9+7c3tM7If4uhty
         SsvA==
X-Forwarded-Encrypted: i=1; AHgh+RqTk5wuqceqDd8CA93tJz506JSlWbQVJ6hQPxkx+d5uyPEzf+N/k3BA+taYTCcoq//JuHyxI9tTKGWYYWkyMrE=@lists.linux.dev
X-Gm-Message-State: AOJu0YylKc4YIa4U5eqoaQ5w9LOWPbI3h9uepNr7WORWTyaNnpVlxJAx
	IkpuDPWKWsl8PkCz5drUmDZSLKyo9fwe9maGopphxpyNykqnyWPe1z6r
X-Gm-Gg: AfdE7cnkifPkhqRzJAskV8Vc+aD/waT0KyQOEsqSQ9dKbkGM+4End8YNOsyQYYx7TnV
	IidabOhNCbO0dj2gfhPskn63DecDKDu3IGcZGpdPI5e9a3y5ZLC0LaPCQAy4RlOd4W2aW8VA9+z
	ilX20/eo6FInstuhsVB5A+XvK0u3WVvdqVTJ1F9gPurhvgcU68T4EaIOD50ADGnx6yrpx/HxbMO
	j/Mqmyl7wwHnjgUVua1QNSVlWXSzTkUVAFkSTXq2pTlwPfFTGqAYYamz7pd+NePaRzC5X0HccW9
	pJkMlkVvBFohpzrm+PwzYS9837tBgxcU6O+pBShQGrigtSqOqu68qgVMSUMhNZcEGYowacEf4/2
	8XI+sNsxwjuJ/hQk904zxh5S/vBwaw7ReqVlY1c1U2DqJ/UnEYzcbjOkHryjaROWPE01Zpg4sOT
	i+g/dzbLqnJbwXrZb7htLbtw4YjuVhwVT+JtYi0CJ3dUSkKNsyEnWjrXTCQXTkbtU3rw==
X-Received: by 2002:a05:6000:46d7:b0:47f:48f7:79d2 with SMTP id ffacd0b85a97d-47f48f780b1mr6546878f8f.51.1784151343588;
        Wed, 15 Jul 2026 14:35:43 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635c86csm19224122f8f.16.2026.07.15.14.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 14:35:43 -0700 (PDT)
From: Nnamdi Onyeyiri <nnamdio@gmail.com>
To: jiayuan.chen@linux.dev
Cc: bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	horms@kernel.org,
	jakub@cloudflare.com,
	john.fastabend@gmail.com,
	kuba@kernel.org,
	kuniyu@google.com,
	ncardwell@google.com,
	netdev@vger.kernel.org,
	nnamdio@gmail.com,
	pabeni@redhat.com,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v4 1/2] bpf, sockmap: handle spurious tcp_msg_wait_data() wakeup
Date: Wed, 15 Jul 2026 22:35:37 +0100
Message-ID: <20260715213538.37229-2-nnamdio@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260715213538.37229-1-nnamdio@gmail.com>
References: <5b07d2ab-84ee-46ae-84c9-7542499d26d7@linux.dev>
 <20260715213538.37229-1-nnamdio@gmail.com>
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
 net/ipv4/tcp_bpf.c | 69 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 60 insertions(+), 9 deletions(-)

diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
index cc0bd73f36b6..aa5c5d741599 100644
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
@@ -371,14 +375,59 @@ static int tcp_bpf_recvmsg(struct sock *sk, struct msghdr *msg, size_t len,
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
+			if (!sk_psock_queue_empty(psock))
+				goto msg_bytes_ready;
+			if (!skb_queue_empty(&sk->sk_receive_queue)) {
+				release_sock(sk);
+				sk_psock_put(sk, psock);
+				return tcp_recvmsg(sk, msg, len, flags);
+			}
+			ret = sock_error(sk);
+			goto unlock;
+		}
+
+		if (sk->sk_shutdown & RCV_SHUTDOWN) {
+			if (!sk_psock_queue_empty(psock))
+				goto msg_bytes_ready;
+			if (!skb_queue_empty(&sk->sk_receive_queue)) {
+				release_sock(sk);
+				sk_psock_put(sk, psock);
+				return tcp_recvmsg(sk, msg, len, flags);
+			}
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
@@ -390,6 +439,8 @@ static int tcp_bpf_recvmsg(struct sock *sk, struct msghdr *msg, size_t len,
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

