Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F0A261388
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 18:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154523; cv=none; b=I/APMdhgWwPrH1RFVyn7g4MgE/eNiBxOLhAVou5L7We9fJarcHj4M5FylJa07HcOU5SQ5LCgHf0YUCzcRhM2DeX9zTdP5da4aV7Vbi0Dd43YijRMf+Kx1mcuy0SlZY+4mmkeZtD1b16VWJzz7NJp3Jj2DjnTHcrzh7nCab4Nq04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154523; c=relaxed/simple;
	bh=D8VF7z/gei5mUZsjV459hHy43PyQ0ONZ2+ixo9rDpYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roJT8CqIy/HSJIN2/eIJ2U56Vv6IdptwUPTKSHd7i7RZiR4W5a9w4RmUFnCOPGUToVVVN4dhWvBYDdztj7VnjNbL8o1vD9vSusXvwPXdzkJUNfMdTbJMlyJgpYZtTlBiJUb2RvYos8i9fi+b4KgS0kpHP7ap/T0HS4piPudBksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJRE3PBW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJRE3PBW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4923139e940so27914945e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 11:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154520; x=1782759320; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X7AozSN8XueaE4qvKd3uNMcs9uhqT7nZ8on42KrFBOM=;
        b=NJRE3PBWj8DCuiEeMhqBwTYUkMI3RHuxE0hgtDMmXfi8LCaxK0bkdT/rgw7+HsJ2H+
         rVOu9VEbzwcjdNtIfgVi7U8ni3H0u0IklPKG9w44PdofAG4xV+HqCLFY2dE8SnIDSemP
         1rJrvTB2QiLJRxssF6AN39WhBxnjmIr74P30riKyUSIcgWVHuaYb7szws9+Togt+h//E
         bkkFHYUnlrCzL+0Zk8Vr0Pq/l+Pc2LAmk31GjJanoIq+9I55iEstadlaSSiStUX3V9uV
         4xh5Z2mpCWxf4lqiSKs5K/xBV5lYo+wwiqm+3MXnZXGK/GbEpvl1nR+Y/9LIIneFfmMw
         bBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154520; x=1782759320;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7AozSN8XueaE4qvKd3uNMcs9uhqT7nZ8on42KrFBOM=;
        b=BU4jUnZxWZLt+57hKMIjHXldnedDPI9LwCejwj2e3GD0OfDLuEivLa41z5DEPXg81d
         vET4WFKKvXYt8TtBJjcZ6zYclY69mCAzlMax6nkctdGgSxo5iYoeTHALv7WyUJ8U31T8
         mTmdhqjc/yjbgZ8VhF9bOeEiufhQeawqJadD3WCqTZ4RFmEDH0EsTmbBWK026FWym1HG
         sBUy86w8NHzm1uSv50vzOztb4+biWkyPe8OxZy3gBCLxEluSWI02uEcFmh/AS9mCASI6
         XfVpMBvxh82kw0BME2KSn4qRKFghXAItaGHX6GDANonOl8nNyBZ8Am28PY/VzP5iwQrO
         PuUQ==
X-Gm-Message-State: AOJu0YzPIcwfQyUBYdWv1SpQFP2wBqysWQMRaOv1bqZz9xleShwe20lT
	ilyL5JyiECvnJVjqTD4NalVOWEYy3b093iSaWIQ3WdXJkSzn23ONgH+A4Ma7KMFdir+60g==
X-Gm-Gg: AfdE7cnGW/Gm9Ii9UnV0CqNJdJ+be+sjNVfYRtFXk2dv99x7UrpDXIDMN6yifVP+CV2
	KEbM0GoImxL4eG81dXYZ6ucmvZlSmVMVrAYvVAUuHF0u+aKjJF83WUjQAcjZokupdueH2QD4T1a
	5h9uPDOGOZioohXCIGmyC95h0yxyM/Jd22Gtp3LM9phmBBah5P3ruYmjSLxaSHD4xmkN10exArw
	LHB5STbRNKCoVSpg9Xr+UTUtmqoOD5LBl/vnZa9RDga74UVtuMMqZddNeCMP2MrNbmv3jD2QeSR
	Ei6+YSveSZ3At9/ef+3oxNfWjZwEq1vNSoAqM1xM7t9rEFrzLrtw8ee8lTYj13ixHR+QiIbNtXI
	EuX9zRC0GlHTWJFhYuOGUfc93hAETtC/nr3ZCg50AozmF5stcn6DJmXrx32+8TzYCkio3w/F0+n
	9+x8nQzXtTVEH6F1aJekXGbmmqrnnQDW/pybFNgNm0NatS3ZjSlA==
X-Received: by 2002:a05:600c:8b37:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-4924257c822mr218909665e9.28.1782154519720;
        Mon, 22 Jun 2026 11:55:19 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466667881b4sm26663646f8f.24.2026.06.22.11.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:55:19 -0700 (PDT)
Date: Mon, 22 Jun 2026 20:55:17 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v8 3/7] bpf: add bpf_icmp_send kfunc
Message-ID: <ajmFFaVQorUS3UO3@gmail.com>
References: <20260622120515.137082-1-mahe.tardy@gmail.com>
 <20260622120515.137082-4-mahe.tardy@gmail.com>
 <20260622123222.5AE7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622123222.5AE7F1F000E9@smtp.kernel.org>

On Mon, Jun 22, 2026 at 12:32:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] bpf_icmp_send() causes __icmp_send() to bypass broadcast checks and spoof the source address for TC ingress packets.
> --
> 
> commit 2acddb10f02b54c09816af3432bc928c87824069
> Author: Mahe Tardy <mahe.tardy@gmail.com>
> 
> bpf: add bpf_icmp_send kfunc
> 
> This commit adds the bpf_icmp_send kfunc to allow cgroup_skb and tc programs
> to send ICMP error messages in response to packets. It clones the original
> packet, optionally assigns a route using ip_route_reply_fill_dst for
> unrouted ingress packets, and invokes the standard icmp_send or icmpv6_send
> functions.
> 
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> 
> [ ... ]
> 
> > @@ -12546,6 +12548,101 @@ __bpf_kfunc int bpf_xdp_pull_data(struct xdp_md *x, u32 len)
> > +__bpf_kfunc int bpf_icmp_send(struct __sk_buff *skb_ctx, int type, int code)
> > +{
> > +	struct sk_buff *skb = (struct sk_buff *)skb_ctx;
> > +	struct sk_buff *nskb;
> > +	struct sock *sk;
> 
> [ ... ]
> 
> > +	switch (skb->protocol) {
> > +#if IS_ENABLED(CONFIG_INET)
> > +	case htons(ETH_P_IP):
> > +		if (type != ICMP_DEST_UNREACH)
> > +			return -EOPNOTSUPP;
> > +		if (code < 0 || code > NR_ICMP_UNREACH)
> > +			return -EINVAL;
> > +
> > +		nskb = skb_clone(skb, GFP_ATOMIC);
> > +		if (!nskb)
> > +			return -ENOMEM;
> > +
> > +		if (!pskb_network_may_pull(nskb, sizeof(struct iphdr))) {
> > +			kfree_skb(nskb);
> > +			return -EBADMSG;
> > +		}
> > +
> > +		if (!skb_dst(nskb) && ip_route_reply_fill_dst(nskb) < 0) {
>                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> [Severity: High]
> Does using ip_route_reply_fill_dst() here cause regressions with how
> __icmp_send() evaluates routing flags?
> 
> For TC ingress packets where skb_dst(nskb) is NULL, this attaches an output
> route. However, __icmp_send() expects the SKB to have an input route when
> evaluating rt_flags:
> 
> net/ipv4/icmp.c:__icmp_send() {
>         ...
>         if (rt->rt_flags & (RTCF_BROADCAST | RTCF_MULTICAST))
>                 goto out;
>         ...
>         saddr = iph->daddr;
>         if (!(rt->rt_flags & RTCF_LOCAL)) {
>                 ...
>                 saddr = 0;
>         }
>         ...
> }
> 
> Because the attached route is an output route, it lacks RTCF_BROADCAST,
> which might incorrectly allow ICMP replies to broadcast traffic.
> 
> Additionally, because RTCF_LOCAL is missing on the output route,
> __icmp_send() clears saddr. This causes icmp_route_lookup() to select the
> primary IP of the outgoing interface rather than the specific IP the packet
> was originally addressed to, violating RFC 1122 requirements for ICMP error
> source addresses.

Mmh that might be an actual issue that sashiko found here and could
simplify this patchset by getting rid of the netfilter helpers. Let me
investigate a little bit more.

> 
> > +			kfree_skb(nskb);
> > +			return -EHOSTUNREACH;
> > +		}
> > +
> > +		memset(IPCB(nskb), 0, sizeof(struct inet_skb_parm));
> > +
> > +		icmp_send(nskb, type, code, 0);
> > +		consume_skb(nskb);
> > +		break;
> > +#endif
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260622120515.137082-1-mahe.tardy@gmail.com?part=3
