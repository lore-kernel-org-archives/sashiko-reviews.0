Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624641687A
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 17:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777263; cv=none; b=OPXxGBoDbcqyzyzkTH5IZUEVa6QnlLB9gBHkefU8g8LLuuKmh+vHV7MMt79IFfEydp6EYcTtCckfzxT40koQbBELwyROjPD2XBo00ztOaPF8hu84VenxmywnWgJNgsdWSHhxRXh6Hd59LWhGSdKQhqM52ZHT/yUJFiX8c/UcsjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777263; c=relaxed/simple;
	bh=3ARyZ8YwE0T8VWNx+yGfZ4urhJw8OuYUwAcNHAdIGEc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=izctF6PPMat9xQAKxSuN/QEc4q2nIe8Qj6+jWTIXodVCc6zTu0qE4+ayNgJFpwiCUCJbpns5dBtxLSF+KNjvKwmZb8hIcsTf3TE1P0zv+MkYnTT3xLZJIQGbjV2To3Im/l5myfEI3MGLqlWA/tgeXoroCG5yHWCruUcJloRyaqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVJyrRo1; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVJyrRo1"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca12086c06eso2899385a12.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 03 Aug 2026 10:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785777261; x=1786382061; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tQ+UNxE6uM8fSSYlklXepIB8FuY8kEOpEwFATNyW7No=;
        b=gVJyrRo1B8Llg1953UT+4g6bLlg9JDD8Sh6VCwEBg/C2a3CAdSC4kotlPZczR1OyAu
         SIcOnhPc0RBMlf0gyDYqHoP9L9EhEwCZYZfSqfW/4Jp+t+TogN3xaUNmzRR6USkwVgl7
         xl1xDneSozNjpo+1B4NHU1iMLDTiX0yrXG3BRk38p0czk8Sh5zg5Xc3Q+jGKEdXPMCyQ
         mJNhj6Y4QzMmtjgiQGJg1BgixYABZ2DJozadsB/T4Oc4xDJ3pCqYI81jcGP/6vF1Egq1
         ICx4EDeD7qzLVccMRkxdln6taWn3m+zbe/Qs2IIiiiwsWPih/xXvBa4QX4hfK4cSVT2y
         VjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785777261; x=1786382061;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tQ+UNxE6uM8fSSYlklXepIB8FuY8kEOpEwFATNyW7No=;
        b=HV13enY+8ATEtDSCpdMNSunVPp3WsUlW6998f5K1t1oTZrawRx4d/4NBjshsv+cpSF
         e8eThiJ520LELuEx3445XBHWID2e02ceNjbElifin2mUh7Yn8P5MWTFWPD8gFXy1wU5h
         rAIaeYz5ks88h9QFjmpIjjqVnvuU3YH5sHvxpl9Dk8OGsw6YGz9FSBWwVa6G/3OSlazo
         D+XQaWNYRTZ8pGLftdILwrRdXxRJcltJZ/Gx/X7OZ+acKaxsCtM6+IwpqrpNgTfKJtTQ
         Xryiur5+0kT3ppyoLaRHEwKCibW4CPN++4rQX0N6tj1Wu0QoO7kzW5tFau5tji8n7XMV
         NQLg==
X-Gm-Message-State: AOJu0Yz95mGGR28duUFZCzZPh5uyVClvkWmgrlccmS9PRq/9u7H2CMLb
	H0+TAegerthMluPyA/MhNdPq8vEVXj0PEdCg4tLDagUYXAQaY6qUmV2x22msjg==
X-Gm-Gg: AR+sD13DKbjQkkqRWbYg8saXbbY6rehivF9bQaMyAUmYa7rOpxCbAevtWL2tim0OMev
	WzDds8xim9yN19BxGmHRjepD65d1t6mueRi2wgmGkS8OYpNHCpSUU2MxZaFZCumzxnCeDprz9iH
	7F05WZi+aZEhl1IY0iLYPaNiGNaIM8ijYlYdn+OWnRh0fva9svhytVHvybvE6/Ar3jNIOF/RY71
	TZEKPBCed0QW7aaPvprEINafOwdWkUCzdq1QyL6xTVU9tcWYulvx1Ov+UMzrjSDg2UAEh5yb7mG
	kevoifLcR38yE2MZIpK69UOLXCok9i3Bo5NKhIqP8viwyzFXBoEzTjIv27pMN5wOnDnOTGhC61Y
	z7/TEozUdfvpaM4050IdzO121hgtarlCVtxpK/1DnlgrbG1JqBq2pfIIgv+Hi4h8cVIfCmCuqqo
	N4vDrhuRspfBW5BpJbyL6uqDeh1No3A8evBKICapkpNwN2N6EnsBU3
X-Received: by 2002:a05:6a20:2d09:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3c92a75ec8fmr10521733637.33.1785777261007;
        Mon, 03 Aug 2026 10:14:21 -0700 (PDT)
Received: from localhost ([2804:388:90d2:b659:18c8:3d0f:fc92:3c1b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab050d8csm54545112c88.0.2026.08.03.10.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 10:14:20 -0700 (PDT)
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Mon, 3 Aug 2026 14:14:16 -0300
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 1/2] perf c2c: Fix error masking, OOM, and unchecked
 caller errors in hpp_list__parse()
Message-ID: <anDMaPQdsyn8b4qs@localhost>
References: <20260803144119.185637-1-acme@kernel.org>
 <20260803144119.185637-2-acme@kernel.org>
 <20260803150230.0AB731F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260803150230.0AB731F000E9@smtp.kernel.org>

On Mon, Aug 03, 2026 at 03:02:29PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `%m` format specifier is used in `__hpp_list__parse` to log generic callback errors, which can result in incorrect or stale error messages.
> --
> 
> --- Patch [1]: [PATCH 1/2] perf c2c: Fix error masking, OOM, and unchecked caller errors in hpp_list__parse() ---
> commit 318c268818f1c0f5bf8bb06a4099029b27a33ee1
> Author: Arnaldo Carvalho de Melo <acme@redhat.com>
> 
> perf c2c: Fix error masking, OOM, and unchecked caller errors in hpp_list__parse()
> 
> This commit addresses multiple bugs in hpp_list__parse(). It ensures that errors
> from output and sort parsing are not silently masked, handles OOM conditions
> from strdup() correctly, and properly propagates failures out of the strtok loop
> and up the call chain.
> 
> > diff --git a/tools/perf/builtin-c2c.c b/tools/perf/builtin-c2c.c
> > index c9584dbedf77a..b0f2ba8318304 100644
> > --- a/tools/perf/builtin-c2c.c
> > +++ b/tools/perf/builtin-c2c.c
> [ ... ]
> > @@ -2063,26 +2065,34 @@ static int c2c_hists__init_sort(struct perf_hpp_list *hpp_list, char *name, stru
> [ ... ]
> > +static int __hpp_list__parse(struct perf_hpp_list *hpp_list, char *_list, struct perf_env *env,
> > +			     int (*_fn)(struct perf_hpp_list *hpp_list, char *name, struct perf_env *env))
> > +{
> > +	char *tmp, *tok;
> > +	int ret = 0;
> > +
> > +	if (!_list)
> > +		return 0;
> > +
> > +	for (tok = strtok_r(_list, ", ", &tmp); tok; tok = strtok_r(NULL, ", ", &tmp)) {
> > +		ret = _fn(hpp_list, tok, env);
> > +		switch (ret) {
> > +		case 0:
> > +			continue;
> > +		case -EINVAL:
> > +			pr_err("Invalid --fields key: `%s'", tok);
> > +			goto out;
> > +		case -ESRCH:
> > +			pr_err("Unknown --fields key: `%s'", tok);
> > +			goto out;
> > +		default:
> > +			pr_err("%m for --fields key: `%s'", tok);
> 
> [Severity: Medium]
> Will %m print the correct error message here?
> 
> The _fn callback returns a negative error code in ret (such as -ENOMEM), but it
> does not necessarily set errno.
> 
> Even if it did, if the callback or its callees log anything, functions called
> internally by pr_err() (like fprintf or localtime_r) can clobber errno even on
> success. This could cause %m to print a stale or incorrect error string (e.g.,
> "No such file or directory" instead of "Cannot allocate memory").
> 
> Could we format the string using the actual error code available in ret instead
> of relying on the implicit global errno variable?
 

Indeed, I'll use str_error_r() in v5.

- Arnaldo
> > +			goto out;
> > +		}
> > +	}
> > +out:
> > +	return ret;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260803144119.185637-1-acme@kernel.org?part=1
