Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100519;
	b=ny2kHS2CO4VV2kfyEEwdlDGoILX/e2BjTQWEnbn40PGq/3r0KSLi91rXZzzmqTyAgh3C
	 mI1si+lWi1VHG4sP0nz3jhaUtZ7AO+RXKFhgKKBty4iJSZvuCosQsbNAtx66vO08uHITs
	 uRl0tw58IMi46tPGXpHI5P9VPAO7nFH6/Lr/r3t3wkNKQjB0WJ6WOgVixWjh5ylIOW1DN
	 6/ECP0tF2FdXf/4JubZQiaM9YGydBWzAZ66KKj7/6OR4SB1GNYAxf0As/zyVR5oWReBTl
	 +xRwqfOFuBAA0hO2KvfUlHAJ8tsI0r9F+QPRO9rc9CXNAr2Ho0cvU6euImOS59FGuTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ladJyEziELjuw48nt/OuAy/002cNOvh4ySWmI+DtB2E=;
	b=y+UTebIdWH8/Waok3JKC+ANEsyupug1/JsmWf2dljU6VQTYNz4BPfD0RezXlqKRt/3BS
	 IARxz4qyLGo1S3LIJpUO0+O/RHkHvuXOtgLlFCYb/nWFCDxR/5kfINOpJe6VrXuzInup0
	 hRI8GlWND6i/rU176MlF1LU05eWQ/qW0n3vTIiqlOhx6Yy+h7mQsJ3iofmtymd3gKat5P
	 y+Y6g6TjFI473uqQH0w9dH1TbPj8GsoCemzPZ63S3kTHqBTFYQiUHFY+O4xpeAef8yUkS
	 nXyj+eATCsXvTr6etsI5wmzt67j/ilD1F9GlM6Uxo/+tueL0a2ANIU7McSeIhpBRL0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=OrIEXtWM;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B653606A320
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 15:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B653606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=OrIEXtWM
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso254270866b.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 07:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795100517; x=1795705317; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ladJyEziELjuw48nt/OuAy/002cNOvh4ySWmI+DtB2E=;
        b=OrIEXtWM9itbrY2+v8dBoKnoTqWwtysNFn4dptNtDA+fyRB7M87NfUuZ22NTsM70Zf
         c+5K3C6ntZub4giv5jrejsZu4rNEWjdsTJK/+BfIReezxQSO1QUTjZyl1/lj+A2hMJsq
         83EupK37zzIXw10r+okvtwsXb62sJc7vDrOf6Yy9YimOO6kENzYt2J/mAHcMT5jRJlIb
         YZUDYiFpvWvnGsdA4voxmtRQopG0eSAgtsDsEhLdwC2vHyVIvlqxZyudWdoYDthhBhSL
         +wQMmipHfLZ2jOfHh5tm/a5ZoToHQ0JcLYh7Ii8JcGAKCk2Q0xnXADwNEqfzrupiuYu/
         G6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100517; x=1795705317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ladJyEziELjuw48nt/OuAy/002cNOvh4ySWmI+DtB2E=;
        b=pQJefqBGisOlp8+rpP5nERtbdtizowko5HZ593x4FBPSWp9Jvl4UgI9yntNpK4li3o
         StAqLwQ4hrZRO7cdokRNA/94gmzDJJNGoFlzjDwKrf0XQRK8kKdImTNb2pl3+aoW/1hZ
         eHma/VhDWFJMMfD/XNK/iS09/gu/q1sHA7AveuSg5QeOiIf5A+fghCLBR9iVZIFYlAMy
         oXIshYdZUlvWJVVbzNl54bV5NtYmSaAFpYlbece/lkAjS/nvdiGj9UKfuYG48qoAA/FL
         94JDQuoi6Wcq/uG6Wxv+aWfdjpJxfUDMa3rVuJl2RHXd+r2h8aDikwtCXZ20ScOsxpbD
         GReA==
X-Gm-Message-State: APuU4Z/IozNS70KeWiFjj7mZJYhhC6N/WA4NeUCcQsLTXDTO9BwSwovg
	/XDyNP6a+TkEtvPbkg2Z/qrou4NMW6uYqgGVVTr4BGHGenaI3a0iZqNJq2nbu4emE3EUCxd2XBA
	sCrFFdDHSlQ==
X-Gm-Gg: AYBFou0V65GQvh7jr60GFecKEmgF2Cw38HRYIbuMplw6KpOF+8bWhbRisx1R+DwdNdo
	5B3KCXSt3lc+nchchgrnpwjnnPG1Oa3oSX2GEliZ0NCm1SEfEZ2R1wBfAB7Ux14ZKPz9nWqZFFn
	Cvo1z7d02h6KLnwXsRlleu6INwC7GfuZyVkBz34l3XYkRi+wjQZPRjthh1e+/VrwytvIi356WK3
	DOCR47rNMmwrm4YQc9vKXXGdCRnyd0+TqLA9OypGstStUcnnTUdLfv/m5cH2Cf3L5dmOchkDekX
	5RiWciK/NJwWhF1bm2wfIN0j+nb7m12raJwwTpMbzBFxTaxfw63SRO+5Ac1nu4wOLNLuds+s2nd
	X4UbDMoWMIjUB/p04ERo7MAhi2eqGw6eHtjbQ5kmZY2X2wPlXyUStwsA6La7jZIGlT3iIKX40D5
	CIKzMqOFst1i4/B4QsupbVQDuuX2Wzm5iLYuPqI5s+HCAs9ayK/sFWJJ3yP5b7U4BClL1js601m
	bFNhe4PFjqsOGQ8Gf5N3jA3+XrVx/C2SS8D4w595nE1GKdXist9cX7QQreY0FUAuPzPS7s7pYM8
	5WtG/q4H77zZVmQcMMwVlMS2wXpUZly5gUW/bCH+SSZivt1kno/di4yU2Xk=
X-Received: by 2002:a17:907:9816:b0:c25:4d9e:bb28 with SMTP id a640c23a62f3a-c5131586adbmr174375166b.3.1795100517293;
        Thu, 19 Nov 2026 07:01:57 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68802sm5488666b.28.2026.11.19.07.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 07:01:56 -0800 (PST)
Message-ID: <7a94c586-b4e5-4b9f-9b6b-bce5345229b9@blackwall.org>
Date: Thu, 19 Nov 2026 17:01:55 +0200
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
Subject: Re: [PATCH bpf-next 1/8] bpf: Orphan prefetched sk on
 skb_do_redirect()
To: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
References: <20261119142231.2612515-1-razor@blackwall.org>
 <20261119142231.2612515-2-razor@blackwall.org>
 <sashiko-outbox-223322@kernel.org>
Content-Language: en-US, bg
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <sashiko-outbox-223322@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 16:52, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] bpf: unorphaned prefetched sk on peer-ingress redirect in
>    skb_do_redirect()
> --
> 
> commit 49a586a8c784f9d116bbf62d9fbeea56cd7faa45
> Author: Daniel Borkmann <daniel@iogearbox.net>
> 
> bpf: Orphan prefetched sk on skb_do_redirect()
> 
> This commit orphans prefetched sockets in skb_do_redirect() before
> redirects other than peer-ingress redirects, preventing RCU-borrowed
> listener sockets from outliving their RCU read-side critical section.
> 
>> diff --git a/net/core/filter.c b/net/core/filter.c
>> index 946b07a17fcec..1ad57a3715343 100644
>> --- a/net/core/filter.c
>> +++ b/net/core/filter.c
>> @@ -2558,6 +2558,15 @@ int skb_do_redirect(struct sk_buff *skb)
>>   	ri->flags = 0;
>>   	if (unlikely(!dev))
>>   		goto out_drop;
>> +
>> +	/*
>> +	 * Prefetched sockets may borrow a listener under RCU. Orphan them
>> +	 * before redirects that can outlive this section. Peer ingress
>> +	 * stays in the same RCU section.
>> +	 */
>> +	if (skb_sk_is_prefetched(skb) &&
>> +	    (!(flags & BPF_F_PEER) || (flags & BPF_F_EGRESS)))
>> +		skb_orphan(skb);
>>   	if (flags & BPF_F_PEER) {
>>   		dev = skb_get_peer_dev(dev);
>>   		if (unlikely(!dev ||
> 
> [Severity: High]
> Should skb_orphan(skb) run unconditionally whenever
> skb_sk_is_prefetched(skb) is true, including for peer-ingress redirects
> (flags == BPF_F_PEER)?
> 
> The BPF_F_PEER path below requires the target peer device to be in a
> different network namespace (!net_eq(net, dev_net(dev))), whereas
> bpf_sk_assign() and bpf_sk_assign_tcp_reqsk() require sock_net(sk) to
> match the pre-redirect device's namespace.  Skipping skb_orphan(skb) on
> peer ingress leaves the source namespace's prefetched socket attached to
> skb when skb_do_redirect() returns -EAGAIN to re-enter
> __netif_receive_skb_core() on the peer device:
> 
> - During another_round on the peer device, a TC ingress act_mirred
>    redirect (which sets dont_clone = true at TC ingress) or an rx_handler
>    such as a bridge port or macvlan/ipvlan can queue skb to an egress
>    qdisc, backlog, or workqueue without orphaning skb->sk.  An
>    unreferenced RCU-borrowed listener then outlives the RCU section,
>    leading to a use-after-free in sock_pfree() or skb_steal_sock().
> 
> - If the packet proceeds up the peer namespace's IP stack, ip_rcv_core()
>    and ip6_rcv_core() preserve prefetched skb->sk.  Packets routed for
>    forwarding in the peer namespace are then dropped by ip_forward() and
>    ip6_forward() at if (unlikely(skb->sk)) goto drop, while local
>    delivery via inet_steal_sock() steals skb->sk without checking
>    net_eq(sock_net(sk), net), delivering the packet to the socket in the
>    source namespace and caching a peer-namespace dst_entry in
>    sk->sk_rx_dst.
> 

Interesting, the find is correct and my local Sashiko run did not catch it, obvious as it is.
The fix is simple and as suggested by Sashiko:
   -     if (skb_sk_is_prefetched(skb) &&
   -         (!(flags & BPF_F_PEER) || (flags & BPF_F_EGRESS)))
   +     if (skb_sk_is_prefetched(skb))
                 skb_orphan(skb);

Will fix it up in v2 after I gather more feedback on the patchset.

Cheers,
  Nik

