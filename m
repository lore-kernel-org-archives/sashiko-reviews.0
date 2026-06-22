Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B82332E6BD
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782140888; cv=none; b=ZlTuUcpu0j9h16kVKYUEARQaC07Wc8BvL50CpX1Jd0ZsO6nD4rygj8OGPzktOK4N/haXGhhjaX7o+z3ZsTlEjW9TXuPmUj1vQ7bN7cRQbBXrz1Ut+sNsgOTxcjvDhAP9CfNmuM9wWQv4ZTCodj4FCTCsv6ZRHzHxEk/8fEhnWW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782140888; c=relaxed/simple;
	bh=ctkXUqINeog3YaaxNzkhEPEYeUycKQ6ka1jBb3wlaTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fG3/eTqr/Tp3J5u8L7XeKkqBAOEBnN+IGhtpPmBg3Uk/jYDTV5k5xbeawpYMNMAkcMFeu1Jy/MPrUfoYthlG6UDoZOBOqrfaDS3mwbb9Zw+yh14ptGvgYO4HzjqwirDKHYyX5gTBuj/Ub9YLPtJG2sRluU0s7uthJN04gOAXIfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=CPOlTFv5; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="CPOlTFv5"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so6262189a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 08:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1782140884; x=1782745684; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X1beVt+7IOcgdQFGOGbC4Ll2RMfXWA8DiQT54PR4ATY=;
        b=CPOlTFv51SWqsRYamhycnfoe8eNdc3Xmh+Y/bC2RR3utkQDk3DvIBsD2YrMElZTvRn
         lSQEmK6A1j9jTvS1XPdA4pKYTEkdxfKS0JOoIG7szGEvFpyBdpNbb1xh3prCnJwEbU2n
         VNeb9r6KsPsvK0Lrd8445PT7GrQ8Y+1/qxPHo+TGHyL9U+OcZQSo6zw1HLMWAemta8vb
         I656dLcrYwqINgyCrNdqG1uQdb7U343Spt3kNzlU++rWRi3FcZJlXBSPVjthx5xghtFa
         5nrY4D6xLxnKawQpITMoB+n3oDPK8AP6CsGFjEdqOlMZsS0rhKq0psdZN6u3IrZdFoEh
         bIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782140884; x=1782745684;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X1beVt+7IOcgdQFGOGbC4Ll2RMfXWA8DiQT54PR4ATY=;
        b=U27WWf7Ieo7L0QXrA+isQZUdqsQc0iknmgn8J7BhjTqN+S3w4txivIX8xlh5rHSBpH
         19EGkKVbJOxDZlJ3ioKW6O4696sIsnqABlD2hWik7GmtKN6RIMMHTkB8NCvOvZMDd4AE
         1XgzFYX1PgeUdVictVmfmEdHnu7TXcmhreMLphTLZwc6petk1N6ZMPx7gkTzCCyYnq1i
         XGLpGB7hQALyoZI+CIYByyXa5BF4I9w99HNSsw0zFFII8ZSAcTTW9m+yigIGES5PWgyS
         3FcGdollyRDbMnBBGxPTv2RlN44usHA83SA21q9Owt00qkbuzHEQ7EedIqobLTgrI6GV
         7AeA==
X-Gm-Message-State: AOJu0YxbwlZsdK12VBNfxLnYrHdqPtvnkTs0CmijvObeX2rudvDPGv7U
	og16gL3rhFdEqQlk46N8f6QKMgxl0yOR/LCRG4hYUXQG9T/yAhGIvHwuZbtcdkHlbSE=
X-Gm-Gg: AfdE7clRnOh8CYpkD45T+3HRs2HqaGtiUTjqg2Fs2oBcqciPDX3X/hxiGKngG/JFme/
	jweaQMspoG1xkOMI2uWJMbn3J1Q167+hvqvp07+cquvM2kXpyUPspJS6Z2GWJ0DMig7LjKZWufI
	Qgw+44I1U/K7Qw01pF9RfUtK17ag4F1eX71gUX8ze2VdxvzVyoKVdWBO51mvOTHHCsKL1BPgxKc
	oG2UI0ZCRPQJ1kMS7yGzX5MGLRfkERImICafFw22nvtllLnEHDEVaZE2rFba+yUHYyqvxzqCB3J
	tM8T/zAfzjQ0QSV9UGIMffFWADX9vPaQqdQFiLbkqS/0hhmnZtDHCB69rFgIvNV+KT3Wfqv+ovn
	JtT8QmYM6ozq6tQgyfsIXrqd1qPEZQjYs/AKeirUBLhhT2bQnFyQ4FDaJUBFOgDCtvMpO4zoEnW
	+nqWFD+ZiocWY3Zpc=
X-Received: by 2002:a05:6402:2346:b0:697:d3e4:4d48 with SMTP id 4fb4d7f45d1cf-697d3e44dcdmr20124a12.22.1782140884354;
        Mon, 22 Jun 2026 08:08:04 -0700 (PDT)
Received: from cloudflare.com ([104.28.21.182])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82fa67sm3702615a12.4.2026.06.22.08.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:08:03 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  bpf@vger.kernel.org
Subject: Re: [PATCH net v3 1/2] net: lwtunnel: Drop skb metadata before LWT
 encapsulation
In-Reply-To: <20260620170951.580641F00A3A@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Sat, 20 Jun 2026 17:09:50
	+0000")
References: <20260619-bpf-lwt-drop-skb-metadata-v3-0-71d6a33ab76b@cloudflare.com>
	<20260619-bpf-lwt-drop-skb-metadata-v3-1-71d6a33ab76b@cloudflare.com>
	<20260620170951.580641F00A3A@smtp.kernel.org>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Mon, 22 Jun 2026 17:08:02 +0200
Message-ID: <87cxxi4nql.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jun 20, 2026 at 05:09 PM GMT, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Calling `skb_metadata_clear(skb)` on a potentially cloned SKB modifies
> the shared `skb_shinfo` structure without exclusive access, leading to a data
> race and silent data corruption for other clones.
> --
>
> commit a6915ae09d5ba82236d77c5574df958bccb552d5
> Author: Jakub Sitnicki <jakub@cloudflare.com>
>
> net: lwtunnel: Drop skb metadata before LWT encapsulation
>
> This commit clears skb metadata before lwt encapsulation across all dispatch
> helpers. It prevents non-bpf lwt encapsulations from overwriting metadata in
> the headroom and stops bpf lwt xmit from triggering warnings due to metadata
> position during skb_data_move().
>
>> diff --git a/net/core/lwtunnel.c b/net/core/lwtunnel.c
>> index f9d76d85d04fd..b01a395d9a966 100644
>> --- a/net/core/lwtunnel.c
>> +++ b/net/core/lwtunnel.c
>> @@ -350,6 +350,8 @@ int lwtunnel_output(struct net *net, struct sock *sk, struct sk_buff *skb)
>>  	rcu_read_lock();
>>  	ops = rcu_dereference(lwtun_encaps[lwtstate->type]);
>>  	if (likely(ops && ops->output)) {
>> +		/* Encap pushes outer headers over the metadata; drop it. */
>> +		skb_metadata_clear(skb);
>
> [Severity: High]
> Does calling skb_metadata_clear() here modify the shared skb_shinfo
> structure without ensuring exclusive access?
>
> Since skb_metadata_clear() modifies skb_shinfo(skb)->meta_len, if the
> buffer is cloned (for instance, via tc mirred or multicast forwarding),
> this might cause a data race and corrupt the metadata for other clones still
> processing the packet.
>
> Should we unshare the skb first to safely modify the shared info?

For skb to have metadata we had to go throuhg ip6?_forward to get to LWT
output, so as I mentioned earlier - we don't need to unclone here
because ip6?_forward will skb_cow, which already unclones.

>
>>  		dev_xmit_recursion_inc();
>>  		ret = ops->output(net, sk, skb);
>>  		dev_xmit_recursion_dec();
>
> [ ... ]
>
>> @@ -404,6 +406,8 @@ int lwtunnel_xmit(struct sk_buff *skb)
>>  	rcu_read_lock();
>>  	ops = rcu_dereference(lwtun_encaps[lwtstate->type]);
>>  	if (likely(ops && ops->xmit)) {
>> +		/* Encap pushes outer headers over the metadata; drop it. */
>> +		skb_metadata_clear(skb);
>
> [Severity: High]
> Could this similarly corrupt shared metadata if the buffer is cloned?

Same as above.

>
>>  		dev_xmit_recursion_inc();
>>  		ret = ops->xmit(skb);
>>  		dev_xmit_recursion_dec();
>
> [ ... ]
>
>> @@ -455,6 +459,8 @@ int lwtunnel_input(struct sk_buff *skb)
>>  	rcu_read_lock();
>>  	ops = rcu_dereference(lwtun_encaps[lwtstate->type]);
>>  	if (likely(ops && ops->input)) {
>> +		/* Encap pushes outer headers over the metadata; drop it. */
>> +		skb_metadata_clear(skb);
>
> [Severity: High]
> Could this also lead to a data race by modifying skb_shinfo on a potentially
> shared buffer before handing it to ops->input()?

This is valid. For encaps which use LWT input, we need to unclone, as
this happens before ip6?_forward.

>
>>  		dev_xmit_recursion_inc();
>>  		ret = ops->input(skb);
>>  		dev_xmit_recursion_dec();
