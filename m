Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8876D480331
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 11:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782905485; cv=none; b=ll8MJCNxyv526IbBv6aXefEIcjALF7w0eF3S2cUURqrtQEsGXTIecKMpIwEVMbDVE50fZu/8o7GfGwkqhJizr9AIhya2m0IpOGtxLiF4ydbQyF0hM6m6HAd/xafseNTrDxIpC+r4gWh1DvC/uBUWav2ITWvMzLk/klG2VDYyeDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782905485; c=relaxed/simple;
	bh=Dve0VmCjU9mPpD1Ya9SMCVr9374pIBOKQAR5OsMMYds=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mr29n+5HC1O51ps0Hl6ucncyvjq89HffyYYl3UJvBt9YVcQzRF9gwnt4KnJkFZqGYzvrDCWwkb6LBEsVC1BKtP1yD70mwdS4LB7FFrSN6EgwhISg/b0LEaYlE3QZQjlGVP6KbxCIXcX86ijGaC1vsRyzh+3O/P1/xRbMuEFYWMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhdSvoRf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhdSvoRf"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so3962065e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 04:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782905483; x=1783510283; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fj8eAuKcVgK2A4fvhFbSFS2GpOpIsHgk7CadgUGfyUI=;
        b=WhdSvoRfhC6VIAD/b3QQpVd/xZVSyGvmefDpbqwI1hhb+chtQDlKV/3UxjE+gobx4G
         w5Djx+++wMhNvQaP3kW9odH10DW48hfYOFQ8bX0yVoyPJW4GHWY/wWL66kD5sau4HyIs
         L/s4ux5/4ZhGWspfmQDIdXkVuJKF8lWfgdAMxu3toix/lGgmGBIFDRAtBwcAhH40Y9D9
         nsxd4IyLWdKT5fD2Om4FCw1EoFi+/Pqn8H85kJSfdvWQ/Pdlf61mWZKJLKGfhxwkrnYm
         Q9gv4u/DizbRPC548nsPuJ4sLtM/s9kyDHGg1xtRQPJHFxNoj9vJb5oIPnHNkKdNsHRu
         lK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782905483; x=1783510283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fj8eAuKcVgK2A4fvhFbSFS2GpOpIsHgk7CadgUGfyUI=;
        b=jlRHfLz2IPUEhzpDzm7gGAt1TPLEdEge2CV/ZqLvXqsQNygg9vFdeah0vc7+iJZPVB
         eHyGUO0NKRPaY3MyPAUOg8y/zrAdJpbIcbxwrk843tBjzFlfxOV7PRiWsaBjIE5b4hnk
         HSw/Kkz64hK2ZxWwvojt2GmyhiSKcBDmEGbqisbFQD6ObuxdGWAqimef0MJSiOSnK93f
         BK99VKJ1wUrJmGdg7xxH83Y5cOnQ/yGb7WYWg9QPwd+5Kr438yVqaVchnM99OOjbqYR0
         foyFRiUtyVEdk1V9evGI1veKhiEkom668OBnDGC5Q9yw/tXE9MyvDf1Esbf/7ew1SDpZ
         /X5Q==
X-Gm-Message-State: AOJu0YyR9DFMZxP+IRDdRAZsFBDl1q0jEUYLPHXZMQDr/Hhttuqyb3xf
	6wRiz3qUPbkluLT0pXY1jWql1TIhpN1x97uRKzelxav5Ov9OMlY0Ktwc/XUU2w==
X-Gm-Gg: AfdE7ckzFe8UzF9ebu4SH4U5khjCWky8DdhzxMPVygZ+Hr9m95GkEpxh9UmGNcVRwZE
	rvfSe3SU73fcB0K4ixbuM1oiouVdMviB2i9JDeiNRclmvpPP2mtRNyrQXUSDNhmzIKiDn/0shU9
	RbNnYNSJ45eImNjIvjWPpvOdxFgH3b5U2jja3sALcaEs88R1BWjCMmAP1dC3Sxw8ax8zBmAiTG7
	8TvC9G9i5Xn0KdOw0DuJJk61ylYMyzHzBtc/wVh/6f9tgG9yXsDW92f7djSsVii365RqWKkK6cV
	kRpU7sGGm2cHwP2X1ffezv+o2h+jp5y09cb8a1cBFapsZq7T4irLnKSvEnczQoUQFxT5ExsAe+a
	VWg9+hnrBBCdkSYOQ8wg8AViuEcVs6k1WU88vFO5ji04DZjkmIre+Yt1gcC4edAaU8TLMSZfmcY
	MhxMwSlXu5NQDDFzb0Jyrf+gUp
X-Received: by 2002:a05:600d:6447:20b0:493:c194:4e7a with SMTP id 5b1f17b1804b1-493c2b382e8mr16151225e9.3.1782905482666;
        Wed, 01 Jul 2026 04:31:22 -0700 (PDT)
Received: from krava (37-188-177-177.red.o2.cz. [37.188.177.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475671d0403sm17059649f8f.29.2026.07.01.04.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 04:31:22 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 1 Jul 2026 13:31:18 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv4 bpf-next 2/3] selftests/bpf: Add tracing_multi link
 info tests
Message-ID: <akT6hnLyJpFd-QLV@krava>
References: <20260629212208.895962-1-jolsa@kernel.org>
 <20260629212208.895962-3-jolsa@kernel.org>
 <20260629213407.11FB61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629213407.11FB61F000E9@smtp.kernel.org>

On Mon, Jun 29, 2026 at 09:34:06PM +0000, sashiko-bot@kernel.org wrote:

SNIP

> > +static void verify_tracing_multi_invalid_user_buffer(int fd, const struct tmulti_target *targets)
> > +{
> > +	__u32 ids[TRACING_MULTI_CNT] = {};
> > +	struct bpf_link_info info;
> > +	__u32 len = sizeof(info);
> > +	int err, i;
> [ ... ]
> > +	/* Invalid addrs pointer -> EFAULT */
> > +	memset(&info, 0, sizeof(info));
> > +	info.tracing_multi.addrs = 0x1;
> > +	info.tracing_multi.count = TRACING_MULTI_CNT;
> > +	err = bpf_link_get_info_by_fd(fd, &info, &len);
> > +	ASSERT_EQ(err, -EFAULT, "tracing_multi.bad_addrs");
> 
> [Severity: Medium]
> Will this test actually return -EFAULT?
> 
> By zeroing out the info struct before these checks, the mandatory ids
> pointer is left as NULL while count is non-zero. If the kernel validation
> logic eagerly rejects the missing ids array with -EINVAL before reaching
> the -EFAULT paths, won't this assertion fail?

there's no such eager reject in bpf_tracing_multi_link_fill_link_info,
the test passes

jirka
