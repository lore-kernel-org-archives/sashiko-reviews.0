Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794933680;
	b=TM7G4bU/z1m2MjQnIdASXAQCNaURP/JmzGp6p5zUU3FiNkVpva1vgMsfOhSGl6QW7kTH
	 ifsMccnPQg8vtezsBMCdHDE6ENAm+Ogbr5zXC/yRyZb1FDqqEYUdRKgdlts6xl0/OENla
	 N0CScYNqtvjS8tzwybixtjqWelu6cjBZEFxIqaye9w1/A9mOwQiiYBNXx8rF6jAt2+QEh
	 ZzliSHBM+qij4Lv7J3yOlOOLK4GhHbvDoifL9y8l6JYuTIUevf+8NtV0DzBVbrmcp8iND
	 YTMh2vdWqVMuqwMWDvdHflMHKquRbKex9MtnIKVFLkclE61f+RqWlJyzeSJVf0kx7Cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933680;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eXly3RxhOaX5IeA+EfMEfxr1r3zJvRZe/GNBlfNismU=;
	b=GTCE1U1qA4eiHg3Iu6N5URTlfuAv3UicyVWlk2BmmzFUfhdLNVcsgk3SV0IyQstInBzP
	 /nzp8QtsrsHBw9euy2PH+BqE+pu7qQ83riwMp+S2GT5up6GkxScIp9q/r9pM36k8PfOPM
	 3auIIa9jDrVM9XcClaiUHdUQJDRP2rGwQ+j/u/3+He+USCTxelHL6NkwZFuK1hUcQ66KD
	 EFfHKkUHucVXIKHATObT24EVfOTYDy62uJGkdCR+ACTJuYEZF2CMVX8gIaJfMUprrnUXB
	 Z7T6EK5ws4/KpOGpPWM/+7jVwFap9tdZ7HJrqDn1zIX6dXfBwkzwliPjbF+jAtt5DrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hartkopp.net;
	spf=fail smtp.mailfrom=hartkopp.net;
	dkim=pass header.d=hartkopp.net header.i=@hartkopp.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WWaDER4J;
	dkim=pass header.d=hartkopp.net header.i=@hartkopp.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=o7xUMSY4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.81
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC38606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 16:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC38606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hartkopp.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hartkopp.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hartkopp.net header.i=@hartkopp.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=WWaDER4J;
	dkim=pass header.d=hartkopp.net header.i=@hartkopp.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=o7xUMSY4
ARC-Seal: i=1; a=rsa-sha256; t=1794933666; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=X3ekJEhF7ozkOzwAw+2yfrN+aGnDeqNM5s5h7S84Aj6bHey4ouh2ARc1fPH6fhkHYR
    EQY6MVlsDG65z6ZeawLGR/Vd/5yV3xJKRUnpyD2N09ch8qE1sDni6zvdQadi2K5e1AA1
    79rPUNJmHYPxBPSxE8rnk/qjxnfNA2SkRuzyqy0yrvs5uE6msv4Xw9Znn4sQkgipREeT
    uZw4dkwnlCy60hplulKzH8xJKDE/G8j5QrJtqKslZTgk+0lcHlm/8nkmwRSr19Zi+GRH
    gPh76Mo2dMT4rhH66tNtY9z9FnfUiWSE/2MO77PV/KlqbEJqJislLZ49gBJBwgs6m8rJ
    RMsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794933666;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=eXly3RxhOaX5IeA+EfMEfxr1r3zJvRZe/GNBlfNismU=;
    b=FHKzkU6TK5aX/sZkSwkvoq8hm/eOw+f25uXewZJeFsmMiFfx5LBrEJPBt3DkhAwUBe
    3DmCUVHImgTr55tXsl8BHlPPQ0tjgNZlcPBawsgLSKsNp/Qz83/TEaXB6kZa9wpFo/u1
    xyfpJpRVXgm0Mgh5Ydh8404mbBcN4cge8TnoPnhP39x3GSH+DHQUh0FCwtsMCyUwTTmR
    nySo+vYECxggFwnXlaKYbFBKaj7AieI5sSBzc7frFtIYHK33HgxsbCGFPrvSMRShH+ch
    P9QZ2tn+7QU9JFiHDuW74RsjPAtXdP48nz5oyG5IvTIBt5uqgOP8o1JIUrAq8CCh0t5g
    2cMQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794933666;
    s=strato-dkim-0002; d=hartkopp.net;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=eXly3RxhOaX5IeA+EfMEfxr1r3zJvRZe/GNBlfNismU=;
    b=WWaDER4JCqeqeaseOMLj7i78xg1szoLtpYfXZ8U256hpVShkJgPrgubtuuj3QOEWvn
    RWIaQRHXwPlLkg2qQbC/G3UX/Et6IPEyuFl2JEAdtIAtdGSaAcr/dv60nFJJLbZOwmoG
    R8V8OEBJ7sDPJP3Q8UT1eG3OULZzNJCBLNTEyOv+aTdik5bdV5ucvY1MYuqNGlE6X3Z9
    j0MxiAzZGtce7fo7R3fWWX0Pdl+/Z0JKDUrTS06opXgJpjVt8VxUJtD0xeXLT9i63wn/
    wxOlhFBOccakSxgTLdMBWoMd+Xa4cMaKy2IEnp0gndEWyFgRZffkAOwrD/3IwXthbtiU
    jBYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794933666;
    s=strato-dkim-0003; d=hartkopp.net;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=eXly3RxhOaX5IeA+EfMEfxr1r3zJvRZe/GNBlfNismU=;
    b=o7xUMSY47PPqiDQhDs2d3LaScN3U5M6fLO47Z5oY5XvDIAdZ9+q+J7+OVdG6GRk9J6
    ZXt/4iNfv/aDrZILovCg==
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjH4JKvMdQv2tTUsMrZpkO3Mw3lZ/t54cFxeEQ7s8bDup0Q=="
Received: from [IPV6:2a00:6020:4a38:6810::989]
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Kfdf2a2AHGf5dBy
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 17 Nov 2026 17:41:05 +0100 (CET)
Message-ID: <a92c9125-baf4-4b3c-aefc-e07f76a5da77@hartkopp.net>
Date: Tue, 17 Nov 2026 17:41:00 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 6/9] can: isotp: use a private mutex instead of
 lock_sock()
From: Oliver Hartkopp <socketcan@hartkopp.net>
To: sashiko-reviews@lists.linux.dev, Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-can@vger.kernel.org, Vincent Mailhol <mailhol@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>
References: <20261115095746.709371-1-mkl@pengutronix.de>
 <20261115095746.709371-7-mkl@pengutronix.de>
 <sashiko-outbox-216678@kernel.org>
 <df95ffcf-c6e6-4dbc-bbab-7749ce93ea86@hartkopp.net>
Content-Language: en-US
In-Reply-To: <df95ffcf-c6e6-4dbc-bbab-7749ce93ea86@hartkopp.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16.11.26 17:59, Oliver Hartkopp wrote:
> On 16.11.26 10:58, sashiko-bot@kernel.org wrote:
> 
>> This problem wasn't introduced by this patch, but can
>> isotp_setsockopt_locked() [1] modify socket options while an ISO-TP
>> transfer is still active after NETDEV_UNREGISTER?
> 
> (..)
>> Should isotp_setsockopt_locked() also check that so->tx.state and
>  > so->rx.state are ISOTP_IDLE?
> 
> Yes, this is a valid finding and the suggested check is the right
> approach.
> 
> isotp_setsockopt_locked() only checks so->bound, which is cleared by
> isotp_notify() while a transfer may still be draining. isotp_bind()
> already rejects a new binding in this state by checking so->tx.state
> and so->rx.state for ISOTP_IDLE, and isotp_setsockopt_locked() needs
> the same check as suggested:
> 
> diff --git a/net/can/isotp.c b/net/can/isotp.c
> index 8229b6a69e..4644a1533a 100644
> --- a/net/can/isotp.c
> +++ b/net/can/isotp.c
> @@ -1721,6 +1721,14 @@ static int isotp_setsockopt_locked(struct socket 
> *sock, int optname,
>       if (so->bound)
>           return -EISCONN;
> 
> +    /* A transmission or reception that outlived a previous binding
> +     * (unbound by NETDEV_UNREGISTER) may still be draining and uses the
> +     * socket options, see isotp_bind().
> +     */
> +    if (READ_ONCE(so->tx.state) != ISOTP_IDLE ||
> +        READ_ONCE(so->rx.state) != ISOTP_IDLE)
> +        return -EAGAIN;
> +
> 
> 
> As this is a pre-existing issue that is not related to the lock
> replacement in this patch, I will send it as a separate patch.

As there was also a problem in

[PATCH net 3/9] can: netlink: fix static FD-NON-ISO mode validation

https://lore.kernel.org/linux-can/20261115095746.709371-4-mkl@pengutronix.de/

I've sent a new v6 series of my patch set addressing this review:

[PATCH v6 7/8] can: isotp: reject socket options while a transfer is active

https://lore.kernel.org/linux-can/20261117-can-bcmlock-memcg-v6-7-6826a6227d36@hartkopp.net/

Best regards,
Oliver

