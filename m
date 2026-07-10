Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D3E34A76F
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 20:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783714646; cv=none; b=POF9tiTGC9DNVFDOZlryh/uEwM4pTDtDMBabjGsX4vYDPIY22QibwewlBCtS8LJX1x/31RD3RC3d1qlRlWKN3SG4VaTkcQ14w/hnZokHsUGn/S3S6Qdeu+09s+VYHmM2VXZl1K98k9NKcuH6YgfwVmy7LjpPW4tHoL9B1Rewais=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783714646; c=relaxed/simple;
	bh=1WJtOKhF6UDkj4WFyAFClNJ8eoY0cFBd6HiAfZMZNOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E61jhhn3QfROReNnK9NJC3Q0GbFcVYPTjrpryEWlNn7ecFhwbt6sIt7QvNrHVJbn/QItvKbI0ruWHJaXBc3gB3Hln5vF5PY7lkoboK1/TxKwKShBLBBaPvzcAGxeCnGccxOJHMjpOQZEu0HM044zYjYxwMTZFIrPQEs2ugWuuQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gg3A/l+y; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gg3A/l+y"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso884200f8f.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 13:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783714643; x=1784319443; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VPZxlfa4Ktt0t/jyLkjMhd8w3yrqTEInPayeLWsP3ks=;
        b=gg3A/l+yLddTJkX1yBGMoJlSBZ4w17Nfcpd3X3Ewb+IXBrPY3ltBUxvwmRwluoMGCP
         fEht2lLDilpooBh50VFZvXJQSOfi4UHoLPFFwc+Td5BLK6fddztNjFz6HrQvEmBreTaZ
         x9Pu599MYQAw3HuFS+0uHZTZLhxWvMvNv20uuBQVikOuGfPpamR+tmAP/rxuczqm8D96
         LVdvaA8dUGJCysrtV9o8At6CaASEheQf4kRF8IMYXWYA51870TpzEbupQSNoR6VC1zED
         vKiX04XXiL/Fn45P/pUPgkF5hQPH0WukyzTSWCTLjCnhmo7iW8WpP2ajTvcKTBMdJdNk
         odcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783714643; x=1784319443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VPZxlfa4Ktt0t/jyLkjMhd8w3yrqTEInPayeLWsP3ks=;
        b=LQxVQrMbdy45+23iStTjWPP/mOa4s1FYuATc2GExTDh6M9vOZlZhZD9u7heUTShLib
         TrLpjx0/8pR3mcfJd8hl7BrfeF/Oyd99JZqrC0Y1lxXjiPgjP7IwuBkxo3pTKUJ4c9fN
         2z4WqQ6uB//2n0smbi5L7nvGcEvzXl8HV98k11IYR+3xEfoEU2BF4DjIvKiHDtQvYl7z
         HDSGocoo17+y46o/zLmlqdJm3OoCmY/6HnHqDUIPiGR6081UxkMmKoq3+xxlMf0diRRS
         fQCd0bQ7wbWuTkwt/KDkYdKC0kmeqFx+syaP0X06KnDDuXQe+Tb0Dok3N5/OY8reP06y
         RA7A==
X-Gm-Message-State: AOJu0YyQq3tlE0G5Wh3lrdJan6+oUc/EM/k2KWhtC28obmThbXNxTk4Z
	Meh8rYEdkgq4+hUokn2u8xM51z88TVWkwelVEvww+2VBqEiDdOCCI7nRsdVcYice
X-Gm-Gg: AfdE7clAGm4cGAnk5vA4Yjq05i48svOg/eZpYZ+ykDYZBes8LRxmBCLv4qFEjjwAFMk
	Cf6ei/5CJ2SPme52q/ImDt9UnB2kcz+r5IPkvB4ht4lc8e1DNvTMqX5LLn6wHX+uMEYuBQS2a17
	WEWKdh6b2PziHjtmffOLoRw/ApV0Qf+HnfYT/WH6ev25GJICTyBPunHiWAk+tNFyV6Sj9NIy9A3
	Z3BlxuNV/3T8pLj7nb93UUUwlxxLW0VMjPUrTBXwKiSj7kQmWGXOgg9gEtergbOSzXYacpSDSpt
	tv2itfxVPXJkovtbIBkSYjitfzry9IOCekZCsHibScbarbzgcc0EDoDZJtOWTkNKH98MHTbelUM
	t882rdoWBQoOKn7Z2RiJF12S6dCVIHY0ixSsYNvUe9U22T4rNQAa6rWXDQUNUDFEhXfqzC3SydO
	UyU2K5Tp7D+QEtrRFWvb8hYiaFBHAt9BFVnsoz7Wj9gcXFC81+ZsJjQYbFkoMJBsB+zUWQyR10e
	GMZ
X-Received: by 2002:a05:6000:40dd:b0:476:82f4:4dcc with SMTP id ffacd0b85a97d-47f2dcf42a1mr210963f8f.33.1783714642985;
        Fri, 10 Jul 2026 13:17:22 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm62731555f8f.11.2026.07.10.13.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 13:17:22 -0700 (PDT)
Date: Fri, 10 Jul 2026 21:17:20 +0100
From: Nnamdi Onyeyiri <nnamdio@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org, john.fastabend@gmail.com, 
	jakub@cloudflare.com, jiayuan.chen@linux.dev, edumazet@google.com, 
	ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org
Subject: Re: [BUG] bpf, sockmap: spurious wakeup by tcp_msg_wait_data()
 causing unexpected EAGAIN in recvfrom()
Message-ID: <alFRK66z45eDNZA7@localhost.localdomain>
References: <ak_rR-Skd8Mvn4mH@localhost.localdomain>
 <20260709185526.E4DAB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709185526.E4DAB1F000E9@smtp.kernel.org>

Hi,

The updated patch below addresses the issues raised by sashiko-bot.  The closed
socket and signal handling code was added to tcp_bpf_recvmsg(), and the fix was
updated to work for sockets with SO_RCVTIMEO set.

Please let me know if any more changes are required, or if the patch would need
to be submitted some other way, I'm happy to adjust as necessary.

Thanks!

----8<----
From 20a1275aa5ecb927ff049971454b62682356ef0e Mon Sep 17 00:00:00 2001
From: Nnamdi Onyeyiri <nnamdio@gmail.com>
Date: Fri, 10 Jul 2026 20:47:36 +0100
Subject: [PATCH v2 1/1] bpf, sockmap: handle spurious tcp_msg_wait_data()
 wakeup

recvfrom()/recv() are documented as only returning EAGAIN for blocking sockets
when they have a receive timeout configured.  however, adding a blocking
ipv4 tcp socket without a receive timeout to a sockmap will cause EAGAIN errors
sporadically.  a socket with a receive timeout may return EAGAIN before the
timeout expires.

this happens when tcp_msg_wait_data() wakes spuriously (returning 0) in which
case, if there is no timeout, or the timeout has not yet expired, we loop
again instead of returning.

Signed-off-by: Nnamdi Onyeyiri <nnamdio@gmail.com>
---
 net/ipv4/tcp_bpf.c | 55 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
index cc0bd73f36b6..e3109edb9621 100644
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
+	if (!(*timeo))
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

