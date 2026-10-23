Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792765027;
	b=jTaUMuEpDAElTPreCw/O+mkIyvu8zvZaqcw5xeKFAaFIpDlUnPT/eDbBxTFEKF8JH2U4
	 ZlFth0K7bCj97vaKsZ+0p27NB7pggW1Aj45ZNq3m3maieGEV7anuqAZxdVeh7KrBW2Jex
	 0T6BIgTnBQsTII8p0p+l5p1K9XqdIjApMK+t8Zr/HixF6RtXvIswnYia31vB0jgNDI8nb
	 4aS59+5wRT9M9K8dF1jOluc5j2e8O/NKToXzVUpVpxnCBn+N6rwN4XXi9+nBJFuHG9w9F
	 nIiJ6iPRmErRQ6yWnePFpzPyysqz4U6SyHen5dyD+krjoI738+Id/u6/7wU08I7WFPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hspaebYZC3S45MqYVptIGDURC4EwLbHzPpd9+9VEq8s=;
	b=RFH+nNriMSqs8Mu2DpWLPjifPw97EPeWVRjgQos2jGCKKE7QJ8OtJgsL+dAHSkmhXCVm
	 r4mR0yNW4ls+sOtGczU3Zqsx8IPQfzGlOFvVgxD2besWoepT+dI6gHyi36sp4z7CZ7sHv
	 tyBZ8Ji/SHbZ0HgXm+l3zcNxKh3rkgnHam/9G9Dvixs0/vSZaChzZ+79oyRJZ1aBkM7YG
	 f7VQhp+K6k+XtHWPBcLSz9j9cqYhnCqPWPM5sXlJYhwcfCqj3+W+sDXYTtIkggG4rQhBb
	 ipEAWZeORCdk4vpDqNI8XDRHw7CW/XE+rsah2nM42LnSXGkisPLtjro4ifio9zUCDjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bhXEJ1Hd;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8133606A31A
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 14:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8133606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=bhXEJ1Hd
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so7438215e9.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 07:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792765025; x=1793369825; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hspaebYZC3S45MqYVptIGDURC4EwLbHzPpd9+9VEq8s=;
        b=bhXEJ1HdqY9cHhpNJ3PG6GozQIIj6F3DBI4ev3S0IxLOXB9MfoL8A8n0vXl0gjT8eP
         L+4mslkFp8lq6Mb+al2bbHB8YYZ876nlYm7SELvugzKcLP66lw5r7kQT+hf7WN8wyJCQ
         xh0zbXSikeIqKg0U1npx9tF9D3u+dzKMokpt/Y4DaobYPOVX8LQj04lMJgxWzUKcRnJo
         3Flh/nMoeGT0132puA/rYGUHACeDtUPrV9Erfjm9Mu6vQXsUvFncMr2FV5LIaKAwxSxE
         U31hUViQB5C4vl7V856bLTcJlP2Y7fLfgfQ1GhmVxXkpOEWrjVi/kSRxf5stbeKW/8C0
         931g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765025; x=1793369825;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hspaebYZC3S45MqYVptIGDURC4EwLbHzPpd9+9VEq8s=;
        b=Q29PZbbIz5VQvhTeEiaYLnLz91+UUBD7Ez7AFr26gUmufxbmfpTeR2Sy+Q+uyJJwQ9
         wx6gcSzaMbQnEnS9Ipbh6dLvZamwDhY9HJ4IOB1TAPg3ajWLuEQYHT++n3zDqV83fb0G
         gQ+cbhhnUsXo/pN6I0+BQBviiJ1JeSIedYI5eiRI17GB4ZyyeAyWxcXinUbgd1/niCnc
         P7Rrji2Xq6RB2phbBZatLeNqJCAN5YYBqvf6/O56YyUtl/Dc3qs2zhXJoNasfqLmL+tM
         PkfAVsM1zraDSge55FdNlg3IQk4pK4A2hfoaKFKCUieopQxg4KOsvbRpJkQnZh1xxKpj
         jcEg==
X-Forwarded-Encrypted: i=1; AKwUvByBmGY2DFuarvReuSoxbuIgcnlKhcOO5khuYpIv5fhOnCm24HOsmXj3M3YemjcUY7Q8cy7NQkbk5QNRkmnhL70=@lists.linux.dev
X-Gm-Message-State: AFq9FYIEWpjy6oayNq6uTR26SnVXw4uw4bcL1UTHLFnf+wKRJwp6AwWk
	JKRt/QtyVW2tqMKPkIcRH2Yex0EridG9MqoI3m/ZZit+TsBBi08xJshC4aN4DbFNWUo=
X-Gm-Gg: AYBFou2CV3Dm4HnYrA4bTE/i+6uJzdzcK8FCTJE/Qvd1jRNcJBPGo8Clsx//BbYMJZM
	kOOVPGTH4MPF7JnAmHIsJ+tnbiQepPlr7Jodz4VmBu6mhCtJsrJ86L5QVkTDUyHg9mW8i6C5B1h
	WHqYH2+NKf3Y0ieFptoxvKvR5EL72yJu6kRMAavN6JhnDUJsoaeAcuTjxes41Fna4VmCBeeV48x
	lVFDbUI3voJmQrlW4DZiciwzMvQP2dPeJ5YImykoYlgLBYd6qViSojrSsTwZxhiCQ1Bz57Ilk+I
	CZPGidHqoVEl/6Q2pyfdBoX0MOXbGkl+SMxqkJy8xxpAD8QsiDjkZJJFkL1OSSCkQexi/6JNLnp
	jcmuX//shIJrNvoR/afstYxMZPo8KhhmoDrjN/GcZRgpbLAF9Y8SUI3rg/tKa9zOA/JAfeDDj2U
	5DvjVgF9pRQbgKt6oAmcizcDsPNby5YVE+FvPZym9gTvEbFD2uqqntMoSsh6H+rC5pbbaCrLAeC
	RPVBfXzglmLSlbtoBPykvZ7q8ktgvBPue9cHR+/MtHNJY0EK9UNFC7gmw==
X-Received: by 2002:a05:600c:1d0a:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a211c7fbcamr41795835e9.1.1792765024225;
        Fri, 23 Oct 2026 07:17:04 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cda986dsm7997135e9.7.2026.10.23.07.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:17:03 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:17:01 +0200
From: Petr Mladek <pmladek@suse.com>
To: Harry Hsu <x90613@gmail.com>
Cc: mbenes@suse.cz, jikos@kernel.org, joe.lawrence@redhat.com,
	jpoimboe@kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org, sashiko-reviews@lists.linux.dev,
	shuah@kernel.org, song@kernel.org
Subject: Re: [PATCH v4 1/5] livepatch: Fail object initialization on
 duplicate patched function
Message-ID: <attsXfOPYrprACJw@pathway.suse.cz>
References: <alpine.LSU.2.21.2609181452160.21788@pobox.suse.cz>
 <20261001043228.74946-1-x90613@gmail.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001043228.74946-1-x90613@gmail.com>

On Thu 2026-10-01 12:32:28, Harry Hsu wrote:
> On Fri, 18 Sep 2026, Miroslav Benes wrote:
> 
> > Could we also check prev_func/func->nop in the check in
> > klp_init_object_loaded() and have a pass if true?
> 
> Thanks for the suggestion.
> 
> Yes, I've updated the check to skip the pair when both klp_funcs are
> nops. Two nops added by klp_add_nops() for replaced aliases are
> interchangeable, so an atomic replace patch that inherits nops for
> __do_sys_fork and __x64_sys_fork from two previous patches now loads
> fine. A non-nop func colliding with a nop (or another non-nop func)
> is still rejected, since the nop would land on top of the real
> replacement on ops->func_stack and silently disable it.
> 
> The incremental change on top of v4 1/5 is:
> 
> --- a/kernel/livepatch/core.c
> +++ b/kernel/livepatch/core.c
> @@ -894,6 +894,8 @@ static int klp_init_object_loaded(struct klp_patch *patch,
>  			if (prev_func == func)
>  				break;
>  			if (prev_func->old_func == func->old_func) {
> +				if (prev_func->nop && func->nop)
> +					continue;
>  				pr_err("'%s' and '%s' resolve to the same address, aliased symbols are not supported\n",
>  				       prev_func->old_name, func->old_name);
>  				return -EINVAL;
> 
> If this direction looks good, I'll resend the series. Petr, should I
> just bundle everything into a v5, or do you have changes on your side
> that I should wait for?

I am afraid that this is still not enough.

Problem:

It would work when the livepatch gets applied the nops are removed.

But it might cause problems when the transition gets reverted
in the middle. All processes should go back to use the previous
implementations (original code or previous livepatch).
But the ftrace handler would just go back from one nop to the other.


Solutions:

1. A solution would be to create only one not in the first place.

2. It seems that we are close to the scoped atomic replace feature.
   It will prevent loading conflicting livepatches in parallel.
   Well, it currently checks only the function names. We should
   add another another check which would detect the conflict
   also by the alias.


Best Regards,
Petr

PS: I am sorry for the late reply. This patchset is far from trivial
    because it handles several levels of "what will happen if"
    and makes my head spin. And it has lower priority because
    it handles corner cases.

    Also I always forget all the details before I get an answer.
    It seems that we are all in the same trap. ;-)
