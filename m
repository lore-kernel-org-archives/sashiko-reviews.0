Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B017F442129
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 11:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719379; cv=none; b=pbW1tAjTLAgrfHZ3ws0EjvhziBnASSqS+6rx36hHU9BvbDL96mmxi4Bh7WHl6MNlPnuiTqJapswGRZZsv7TtJw1a54BJr3h11BHCsVj+zU33ajT79sy4RZVyqfq4U0KgAeiJVSY5NygmscLVHGqi3z5CXM4ZvN3jmwoyq9Q1atw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719379; c=relaxed/simple;
	bh=wraTTlefdkdHPNlnRf6WJaDafAqE/c8Ugv2o/ebCXDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJtIyncKHjP2B8X4ruEFS1RTqZoPFckkUr76ix98rMIkp+bKZmJc1ONwqI4w29By99shJ8y7uDoGMPzqzqFRpYT+doebhP0HtoMgrI0Zc3/soHQGsQ3YLtWha1azCXSnoZxA+JYTLTzclLW4MEHCHlIdDAOCwk6JEikXCrK9Tzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgTg6V6o; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgTg6V6o"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f6609c657so2065845f8f.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 04:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784719375; x=1785324175; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8RdAVocnPl+oK0nJeH+3MqB3h/AEEqzf4DD+36yYw4=;
        b=KgTg6V6o8xoM0GsZYLS9mZZ1oh7G8lo0gl0P5Ub1+4qpJZoeDQcw6GPE63FMEFhgNS
         /FUSWBEQPn2UVuC3Sa021ELPR6DUrZZ5guwOGg+AIQdi01h72RKPHjQFZpSF2r6RJ0n0
         KD/9qlsvU8Utn6U6DLROxKEw7B1l6rWGNbItjqOgFFTYv5SqSGoyPAwV+0MF6b4UXeS9
         VEuy+tyVXOgV/B9ZVwW8ZumZWcrc1FDqgjX3GZfy0tsqOEFct+3Cg4AxO6UqPrnb+8BL
         9SYCSjx6nwvqQMmabeJuKME5cC94+1V7nK2kqoFK59OByNSbr3xq3PAW5ULFuodYHnvF
         SB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719375; x=1785324175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8RdAVocnPl+oK0nJeH+3MqB3h/AEEqzf4DD+36yYw4=;
        b=MwvYUpkW+IIDRGFRrFCzrruWb2OCe/4P5xc2Gsa0C2mCDkoRznftH4UEHIKaazkH+y
         wUZnCSatYuxbXeXkGFHlioAJuy6otu7QKu7gEQy51TsCFds37kC+xZs5aAlGjnQoio3C
         cvAux5xlaAMq1IL7Zf+CGwJkGyyRPLMmrdSICe9Q0hlHvmsxKJIzin57/SsAkuW+6C2i
         e0NcCRb72bEq3Y61NwP1uW1xRH4aTLZT6LomG4bTn5u0FX1kYKbNDtwRnqKYCLLnoXdA
         kEUXJw1zJGTGlHZiv+5iLX4G/+7q0wPoNumejdlOAlpIYpnsLvc53+yPvd6eeORLQo/H
         OgUw==
X-Forwarded-Encrypted: i=1; AHgh+RoNbEGnJOhauAXHt7lVo+ydvzIssZ1q4nGTn75bFECVJvrIh4nSO/LQI2oNMpfQ/qFHEoZ9V5gOx9Mz9ttLOQg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4t+SVoYPc0UIZxTX+KORHuJsGSCZiBXOZp+/h5LCDh0yizxTi
	QlHTqZffvkV1pdqy187iHnr8lLmcSM6SxWLApwNSd2ulflXDad/p34JW
X-Gm-Gg: AR+sD10KEXmXZdp1FUQlkGhGuz9pBvtaKnXXHm5Rv30lg84g9DvZbIYmhSoWb/4IkZi
	IRRek+ISHJoMe+qpErL2XNlf7IPp6GHQ92EpaPo2bdZIqLcJSuKvZpr93FSmg9ZfT6kLR3Y+In4
	5SDPnK+SXeN+lYOe4aISDe+W+1TctmH9TDgbuhQxCYYMjKJwCmICtD3FP2AfryCAkMCAHyH7bJe
	60huL8/8IR4+7Ax+sq0lx/Sjw6KRM9hJLT+g7VmieHMZGao6qz5hflmW2EOneoGMihl3RNYJoHb
	jSmF6sPOCKWX0/b2jc5KeBL/49TgUJLNZFzQ/eGtPHBXJDpYuB72a0COOZjppPgF2GSMPFeeZGh
	OxeIWCs8OlPO9cwHJdaeOtxbw8CCRdBHCmauYCwrHzE1UtLq2QgCK1w9c1aW/uILbv5bJ5H3LU7
	2H8gSQXgYIOYmKXkChleSTX2/pyVk8DX+8yWOWC28C/MtMz5V5R01ihFLj8if4GnwP/A==
X-Received: by 2002:a05:6000:400f:b0:47f:8152:e568 with SMTP id ffacd0b85a97d-47f8152e595mr7876397f8f.60.1784719374568;
        Wed, 22 Jul 2026 04:22:54 -0700 (PDT)
Received: from localhost.localdomain (host86-153-201-25.range86-153.btcentralplus.com. [86.153.201.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531afsm4884918f8f.24.2026.07.22.04.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:22:53 -0700 (PDT)
Date: Wed, 22 Jul 2026 12:22:52 +0100
From: Nnamdi Onyeyiri <nnamdio@gmail.com>
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: bpf@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	horms@kernel.org, jiayuan.chen@linux.dev, john.fastabend@gmail.com, 
	kuba@kernel.org, kuniyu@google.com, ncardwell@google.com, netdev@vger.kernel.org, 
	pabeni@redhat.com, sashiko-reviews@lists.linux.dev, linux-kernel@vger.kernel.org, 
	emil@etsalapatis.com
Subject: Re: [PATCH v7 1/2] bpf, sockmap: handle spurious tcp_msg_wait_data()
 wakeup
Message-ID: <amCnMPJ1gVoNCbfY@localhost.localdomain>
References: <20260721223807.75101-1-nnamdio@gmail.com>
 <20260721223807.75101-2-nnamdio@gmail.com>
 <87tsprl24q.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tsprl24q.fsf@cloudflare.com>

On Wed, Jul 22, 2026 at 01:01:09PM +0200, Jakub Sitnicki wrote:
> On Tue, Jul 21, 2026 at 11:38 PM +01, Nnamdi Onyeyiri wrote:
> > recvfrom()/recv() are documented as only returning EAGAIN for blocking
> > sockets when they have a receive timeout configured.  However, adding a
> > blocking ipv4 tcp socket without a receive timeout to a sockmap will cause
> > EAGAIN errors sporadically.  A socket with a receive timeout may return
> > EAGAIN before the timeout expires.
> >
> > There are 2 code paths affected by this:
> >
> >   1. tcp_bpf_recvmsg() - Used when the socket has been added to a sockmap
> >      that has no verdict program attached.
> >
> >   2. tcp_bpf_recvmsg_parser() - Used when the socket has been added to a
> >      sockmap that has a verdict program.  To reproduce this issue, it is
> >      enough for the verdict program to do nothing but return SK_PASS.
> >
> > In both cases this happens when tcp_msg_wait_data() wakes spuriously
> > (returning 0).  To fix it, we now loop back to msg_bytes_ready instead
> > of returning -EAGAIN on spurious wakeup.
> >
> > To ensure the looping does not cause sockets with a SO_RCVTIMEO set to
> > wait excessively long, tcp_msg_wait_data() now takes a pointer to timeo,
> > allowing sk_wait_event() to update it as appropriate.
> >
> > The logic in tcp_bpf_recvmsg_parser() that allow it to handle signals,
> > socket errors and closuers in its loop was also added to tcp_bpf_recvmsg().
> >
> > Signed-off-by: Nnamdi Onyeyiri <nnamdio@gmail.com>
> > ---
> >  net/ipv4/tcp_bpf.c | 72 ++++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 63 insertions(+), 9 deletions(-)
> >
> > diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
> > index cc0bd73f36b6..1755fcf726fc 100644
> > --- a/net/ipv4/tcp_bpf.c
> > +++ b/net/ipv4/tcp_bpf.c
> > @@ -179,7 +179,7 @@ EXPORT_SYMBOL_GPL(tcp_bpf_sendmsg_redir);
> >  
> >  #ifdef CONFIG_BPF_SYSCALL
> >  static int tcp_msg_wait_data(struct sock *sk, struct sk_psock *psock,
> > -			     long timeo)
> > +			     long *timeo)
> >  {
> >  	DEFINE_WAIT_FUNC(wait, woken_wake_function);
> >  	int ret = 0;
> > @@ -187,12 +187,12 @@ static int tcp_msg_wait_data(struct sock *sk, struct sk_psock *psock,
> >  	if (sk->sk_shutdown & RCV_SHUTDOWN)
> >  		return 1;
> >  
> > -	if (!timeo)
> > +	if (!*timeo)
> >  		return ret;
> >  
> >  	add_wait_queue(sk_sleep(sk), &wait);
> >  	sk_set_bit(SOCKWQ_ASYNC_WAITDATA, sk);
> > -	ret = sk_wait_event(sk, &timeo,
> > +	ret = sk_wait_event(sk, timeo,
> >  			    !list_empty(&psock->ingress_msg) ||
> >  			    !skb_queue_empty_lockless(&sk->sk_receive_queue), &wait);
> >  	sk_clear_bit(SOCKWQ_ASYNC_WAITDATA, sk);
> > @@ -229,6 +229,7 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
> >  	int copied_from_self = 0;
> >  	int copied = 0;
> >  	u32 seq;
> > +	long timeo;
> >  
> >  	if (unlikely(flags & MSG_ERRQUEUE))
> >  		return inet_recv_error(sk, msg, len);
> > @@ -262,6 +263,8 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
> >  		}
> >  	}
> >  
> > +	timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
> > +
> >  msg_bytes_ready:
> >  	copied = __sk_msg_recvmsg(sk, psock, msg, len, flags, &copied_from_self);
> >  	/* The typical case for EFAULT is the socket was gracefully
> > @@ -280,7 +283,6 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
> >  	}
> >  	seq += copied_from_self;
> >  	if (!copied) {
> > -		long timeo;
> >  		int data;
> >  
> >  		if (sock_flag(sk, SOCK_DONE))
> > @@ -299,7 +301,6 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
> >  			goto out;
> >  		}
> >  
> > -		timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
> >  		if (!timeo) {
> >  			copied = -EAGAIN;
> >  			goto out;
> > @@ -310,13 +311,15 @@ static int tcp_bpf_recvmsg_parser(struct sock *sk,
> >  			goto out;
> >  		}
> >  
> > -		data = tcp_msg_wait_data(sk, psock, timeo);
> > +		data = tcp_msg_wait_data(sk, psock, &timeo);
> >  		if (data < 0) {
> >  			copied = data;
> >  			goto unlock;
> >  		}
> >  		if (data && !sk_psock_queue_empty(psock))
> >  			goto msg_bytes_ready;
> > +		if (!data && timeo > 0)
> > +			goto msg_bytes_ready;
> >  		copied = -EAGAIN;
> >  	}
> >  out:
> > @@ -355,6 +358,7 @@ static int tcp_bpf_recvmsg(struct sock *sk, struct msghdr *msg, size_t len,
> >  {
> >  	struct sk_psock *psock;
> >  	int copied, ret;
> > +	long timeo;
> >  
> >  	if (unlikely(flags & MSG_ERRQUEUE))
> >  		return inet_recv_error(sk, msg, len);
> > @@ -371,14 +375,52 @@ static int tcp_bpf_recvmsg(struct sock *sk, struct msghdr *msg, size_t len,
> >  		return tcp_recvmsg(sk, msg, len, flags);
> >  	}
> >  	lock_sock(sk);
> > +
> > +	timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
> > +
> >  msg_bytes_ready:
> >  	copied = sk_msg_recvmsg(sk, psock, msg, len, flags);
> >  	if (!copied) {
> > -		long timeo;
> >  		int data;
> >  
> > -		timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
> > -		data = tcp_msg_wait_data(sk, psock, timeo);
> > +		if (sock_flag(sk, SOCK_DONE)) {
> > +			ret = 0;
> > +			goto check_queues;
> > +		}
> > +
> > +		if (sk->sk_err) {
> > +			if (!sk_psock_queue_empty(psock))
> > +				goto msg_bytes_ready;
> > +			if (!skb_queue_empty(&sk->sk_receive_queue)) {
> > +				release_sock(sk);
> > +				sk_psock_put(sk, psock);
> > +				return tcp_recvmsg(sk, msg, len, flags);
> > +			}
> > +			ret = sock_error(sk);
> > +			goto unlock;
> > +		}
> 
> Isn't that branch the same as:
> 
>         if (sk->sk_err) {
>                 ret = sock_error(sk);
>                 goto check_queues;
>         }
> 
> ?
> 

sock_error clears the error in sk->sk_err.  using check_queues means
tcp_recvmsg would not see it.  is that ok?

> > +
> > +		if (sk->sk_shutdown & RCV_SHUTDOWN) {
> > +			ret = 0;
> > +			goto check_queues;
> > +		}
> > +
> > +		if (sk->sk_state == TCP_CLOSE) {
> > +			ret = -ENOTCONN;
> > +			goto check_queues;
> > +		}
> > +
> > +		if (!timeo) {
> > +			ret = -EAGAIN;
> > +			goto check_queues;
> > +		}
> > +
> > +		if (signal_pending(current)) {
> > +			ret = sock_intr_errno(timeo);
> > +			goto check_queues;
> > +		}
> > +
> > +		data = tcp_msg_wait_data(sk, psock, &timeo);
> >  		if (data < 0) {
> >  			ret = data;
> >  			goto unlock;
> > @@ -390,6 +432,8 @@ static int tcp_bpf_recvmsg(struct sock *sk, struct msghdr *msg, size_t len,
> >  			sk_psock_put(sk, psock);
> >  			return tcp_recvmsg(sk, msg, len, flags);
> >  		}
> > +		if (!data && timeo > 0)
> > +			goto msg_bytes_ready;
> >  		copied = -EAGAIN;
> >  	}
> >  	ret = copied;
> > @@ -398,6 +442,16 @@ static int tcp_bpf_recvmsg(struct sock *sk, struct msghdr *msg, size_t len,
> >  	release_sock(sk);
> >  	sk_psock_put(sk, psock);
> >  	return ret;
> > +
> > +check_queues:
> > +	if (!sk_psock_queue_empty(psock))
> > +		goto msg_bytes_ready;
> > +	if (!skb_queue_empty(&sk->sk_receive_queue)) {
> > +		release_sock(sk);
> > +		sk_psock_put(sk, psock);
> > +		return tcp_recvmsg(sk, msg, len, flags);
> > +	}
> > +	goto unlock;
> >  }
> >  
> >  static int tcp_bpf_send_verdict(struct sock *sk, struct sk_psock *psock,
