Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590A135E1BC
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610169; cv=none; b=L5AYyWBN4t8IPBwGJCQ7fj9Bw1IUvX9FiR1vwDbNmhXHdVRK6gx6V8yfKmoJgYNzpN3fnKRxsOZJlQdO5Sp0B50MJhTlDmiETmMtzCsTXF3b8dMLA2y9C2Hu4qN19UC9kRq+iJ7icCxmyl6ogKsJv69u4OA/hyr9NRtf4tspGcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610169; c=relaxed/simple;
	bh=XlDVHbbqaybpQbgdbUDPIbkf0uGmKfP/dfOP7mDZykg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVmlCu9OWX6Ijn43JjsFWJhj6XrPff4nTISIVxB8aIaYQEA9B1S92FA5n/QVymA6a/AOkrDp72sJdlba+4R+laFtIDECKZ7EZWfnk+dLH3stzg+937rbZTSJFjznlMx5+uTnJebUJf0CvSF1EvghdWk/A+PrG+zpRYfDV3IDQ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlILVJrW; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlILVJrW"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f25d47dcso323945e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 08:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783610167; x=1784214967; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NFYmaVP7IkRtJHTG1nFkCzplQnsxbW+oLvmDOphxNFk=;
        b=PlILVJrWnek2g5RSYUD3Guh7kcKxIv4BUVBfgHUfXSOOZKtMjDu/2CGsoSUyxB6ZcB
         yC4f3KjIRlK9ORXXJIJhn8tPd4nxctEZtx53LtOKEGIe8iTJV0yuNE9jCXzYfNKTlbHw
         McxfAXdfbLnWSaaOY7d3xwEbnFpHuH912lSMjW0uG57JVdlAu7kOL5xYjmf5xvp7j2Fy
         YI8frxoDLQU1FGzRqZSFBAnepPwnK11Wq7nsq6K6ETlX1wV2UfVbSNKzEYk7hBXR7H14
         ScDWgNACAT8hKov4R/XisSmhd4xxUV3N5e3XNy6ebaDNowJ6OoGcZ/WNE8DzW/deUuh9
         mz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610167; x=1784214967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NFYmaVP7IkRtJHTG1nFkCzplQnsxbW+oLvmDOphxNFk=;
        b=lCxlZzUox5ozbpCFs2BME82/Tbc8GvLRnD4w6o83qfz0oG11M3Sgg5Jz9HRDPhBazZ
         ltg7bgJt3JYaPLAcUjfujHnVHzI3k9VN0mvP021fZkrj2gupM6Bk7XNJauPVmTAlhQF5
         DhQETA0E43/oYpuRbDimzxTOjgNAI/RK4pm9jKBMm/IsARsVgeYVe5QZPhe8ysfCXAQZ
         g9ReAqqlepdrAwTCxNUUtnUbIsEerEUvnknQMRoYEeqlGfuNigwMWyWgSIXDYaEsm/sC
         tIM/ReCkzo/t6avmN0Wib5C6DGu/CtqadB/BxyKWIbC49ZTUla6Ld0RocHwuSM0N7R84
         JT/A==
X-Gm-Message-State: AOJu0YygpWxZ7kBVpIcpQtMRJZhfw0kIsGknn2pHlk/uWdb9vGYbnGMv
	9+RHTDY3Tdkx8UGM5NPY2kIZAeVSYKcGq20fYnyNZhyxCDmjrMZl0VfI2gwaoJX5I64=
X-Gm-Gg: AfdE7cktotCbX5+xmjfgIuTTzNjY46huoSjF7OV8+7SzLdH13sVZO9egrAlnEavR6yh
	bN7/Q2RJUBE5UCC8lSH+C7ai2bIwuDmCOvpKOR3qg8mblcFguUj6nyDLWkQs7h7wwSFnHiIVLUK
	jeBt1A11BU4kwBbcBGg81+oQt1piBs4O+L+/zTy1vZeEvD5JKAEMXkzmR4wHO5Oe/RroSWvpwgr
	fOld5kYU8YxI094umS1IL9XCqX9mulB1RZjE9Pa8TpZ2CLnI2s0D4OqzpFr3c4pKVvTclqa+8zN
	yAmL0DkCCx09C/Eo6fQ0g9IlInUCtuDxYmM4DaqT6VYNoKkm6r5BqP0f+3DPfXLnMg08RTqJ/rK
	YYPUl2SDHEdC8mgzHnf+wUsAAYM2oNtustt6nzYGHj0Gv3onwlMz6CLzMhE/s7LK1ECwDV6eCVM
	1UL1JS2AksPalgvOxv/xl+CpcBm+f+2qvpDOPxOCNfZJzB
X-Received: by 2002:a05:600c:821a:b0:493:a570:df7d with SMTP id 5b1f17b1804b1-493e68bef51mr76105255e9.20.1783610166609;
        Thu, 09 Jul 2026 08:16:06 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm50983155f8f.20.2026.07.09.08.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:16:06 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:16:04 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next v11 5/5] selftests/bpf: add bpf_icmp_send no
 route test
Message-ID: <ak-7NIJ5wkBjvHTd@gmail.com>
References: <20260709144900.245904-1-mahe.tardy@gmail.com>
 <20260709144900.245904-6-mahe.tardy@gmail.com>
 <20260709150010.672651F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709150010.672651F00A3A@smtp.kernel.org>

On Thu, Jul 09, 2026 at 03:00:10PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The run_icmp_no_route_test subtest suffers from state pollution because it fails to reset skel->bss->unreach_code, passing stale or invalid ICMP codes to the BPF program.
> --
> 
> --- Patch [5]: [PATCH bpf-next v11 5/5] selftests/bpf: add bpf_icmp_send no route test ---
> commit 43111be9123ff27205045da2a59f2daf8fc9a986
> Author: Mahe Tardy <mahe.tardy@gmail.com>
> 
> selftests/bpf: add bpf_icmp_send no route test
> 
> This commit adds a test to verify that the bpf_icmp_send kfunc returns
> -ENETUNREACH when a test run is performed on an skb without a destination
> route.
> 
> > diff --git a/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c b/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c
> > index bb532aa0d1580..9318d4bc7ce8b 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/icmp_send_kfunc.c
> 
> [ ... ]
> 
> > @@ -169,6 +169,49 @@ static void run_icmp_test(struct icmp_send *skel, int af, const char *ip,
> > +static void run_icmp_no_route_test(struct icmp_send *skel, int af)
> > +{
> > +	union {
> > +		struct ipv4_packet v4;
> > +		struct ipv6_packet v6;
> > +	} pkt;
> > +	DECLARE_LIBBPF_OPTS(bpf_test_run_opts, opts,
> > +		.data_in = &pkt,
> > +	);
> > +	int err;
> > +
> > +	switch (af) {
> > +	case AF_INET:
> > +		pkt.v4 = pkt_v4;
> > +		pkt.v4.iph.version = 4;
> > +		pkt.v4.iph.daddr = htonl(INADDR_LOOPBACK);
> > +		pkt.v4.tcp.dest = htons(80);
> > +		opts.data_size_in = sizeof(pkt.v4);
> > +		skel->bss->unreach_type = ICMP_DEST_UNREACH;
> > +		break;
> > +	case AF_INET6:
> > +		pkt.v6 = pkt_v6;
> > +		pkt.v6.iph.version = 6;
> > +		pkt.v6.iph.daddr = in6addr_loopback;
> > +		pkt.v6.tcp.dest = htons(80);
> > +		opts.data_size_in = sizeof(pkt.v6);
> > +		skel->bss->unreach_type = ICMPV6_DEST_UNREACH;
> > +		break;
> > +	default:
> > +		ASSERT_FAIL("af_not_supported");
> > +		return;
> > +	}
> > +
> > +	skel->bss->server_port = 80;
> 
> [Severity: Low]
> Does this leave skel->bss->unreach_code uninitialized for this test?
> 
> Since the run_icmp_no_route_test subtests share the same BPF skeleton as the
> previous run_icmp_test subtests, if they run after the ipv6 subtest,
> unreach_code is left at 7 (max_code + 1 from testing invalid codes).
> 
> For no_route_ipv6, code 7 is passed to the kernel, which is an invalid ICMPv6
> code (max is 6). The test currently passes only because the kernel's
> bpf_icmp_send implementation checks for a missing destination route and returns
> early before validating the code parameter.
> 
> Would it be better to reset skel->bss->unreach_code to a valid value here to
> prevent test state pollution?

I'd say it's indeed not a big deal since the test triggers a check that
is before it reaches the EINVAL, but would be more theoritically correct
to reset to 0 for both v4 and v6. So mostly a nit.

> 
> > +	skel->data->kfunc_ret = KFUNC_RET_UNSET;
> > +
> > +	err = bpf_prog_test_run_opts(bpf_program__fd(skel->progs.egress), &opts);
> > +	if (!ASSERT_OK(err, "test_run"))
> > +		return;
> > +
> > +	ASSERT_EQ(skel->data->kfunc_ret, -ENETUNREACH, "kfunc_ret_no_route");
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260709144900.245904-1-mahe.tardy@gmail.com?part=5
