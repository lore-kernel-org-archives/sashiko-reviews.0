Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9E93F1ABE
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 13:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779973845; cv=none; b=fzDl5yCoKMUzUDwdrioutqLK8o5Bq/AHDR9c1BCBpaTacSz/4QNbIDgVA3OXLxwtGhpUyb7dyrQ+aj+FsS4/56q5L0o565PTyQo7+VfzeOJEZ4n2/JpscveqjZUKSwxvCR0zTg0rcQKJh+Q9BpgimtrMHySlzjIBOR/CjLPwiSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779973845; c=relaxed/simple;
	bh=3vm6bptRUoPJ0BqubllYsw5R6jTU9tG46Eq6kOki8BY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWkVH4aByhw4w+mLD/U+y7Qs8Xb/s+aBW4IL9Fc9sytL5B3XVSn7NPnJMLHPxA3iqdnUCxN6TDwMWE5VMQrYAfbHewmcmW9qJJShShkSfiVoheX2bybC3SMhU5rzsVMKz3hr+z/kfoq+lhrCspkMTYV9s3E/BWQ+1q1PjC3IQuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aK3XCJ6o; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aK3XCJ6o"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso109656645e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 06:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779973842; x=1780578642; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ao6t/fCIiGiF4MwvYmNnn5lfP8QPZOM2rZFPbwCZ8Q0=;
        b=aK3XCJ6opkzTYCclcnhCvvbVMlxO+nbgsKKE6p+8kxTQ9BE+5R3VFG6wZ6x+IZDjXN
         xgnXPBVqIGLHTD/6txRmcU/tr8LVcuYaJ5ULCvzstCa636LiUGFMIm1FhzR+q+wp+vTe
         zGzUkTFBd5MDiEEPIf/jwibsyLYpsJUQ/7AAg1nGcFymXDbA4Bga9qr5WkPil33QHBv5
         j9+4KxnSMga+zpj0EjRIrv+47oh52z+YT+isIosm7l472DTiWXNXyLhuns7Z2UZRnxSv
         kO+MvFvexhK0tuGUN7Fj2xMj8H1jJDm/41709T5i661pmMED1fRredo/pHh2zlIsUuZG
         Oguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779973842; x=1780578642;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ao6t/fCIiGiF4MwvYmNnn5lfP8QPZOM2rZFPbwCZ8Q0=;
        b=bZ2trh+gKIhsWYsfuU+FvnvNh2miUhGwBUcDyYIbNZTx+g7pAa5mEATidq4j0cQPWc
         UhLwqi/KK6HSjjLllLzmgz8gufHctLKio0D9B0Q15qTaYFduvX7AO4F0khe7F6zRClmg
         UCHAqiQ6UOCieUvcYu2KKQk7o83ZYAhXnwp4Z0IQw0g/uCxPb4alrXKV/bFl3WMFLAag
         +JvKPauhn4KlGHrSwkV+88I4ZohU6AfZFkb1wj/919zpAm2NMUg7e7LP3B2cTqSXPedb
         fcQTNR25tLbkE9XSvraIerRlyly034AkDED8sebmESGOW7EsR/WOIexT/P1Y9zX8cC5m
         KPDg==
X-Gm-Message-State: AOJu0Yyk3r8dYUypmHtuXtPTlvXo4mxqofEoYG0apJgSpZnsVsgp23hI
	85XvmfX3zIAGYEGOiySV2ADA7iFEErCQc6gsH41cj+wwnHgpwv+Y/HM6ET7E6w==
X-Gm-Gg: Acq92OFnxVwpKy1zCw0AHaLDBOWsxxAjsORFO0uxJN50HfhTCMKu6y/oksGu3ZV76VJ
	40bq8TSbGy1MNuOu5qgPMPZvuKEoJDmEirvZtxgv4478D42fmxEJX3g7XB21lu4r4/G3DN/fWGq
	uAoUGNRg9olT4r7c9fCHas3mkeXjlHvgRuy6+Gw6vu1/dLlnb3rOmsBT2g7MhKALtq9oDIqLrKQ
	6Q1WgYvYgIcEleJUG/JSDNqMk+qIdNGOHue1BlducKcpidFp2iEWW5/h5iINffnyHwv9Y3SBq4D
	PEc71YvWPIpfQEeo5DOakVLw956jDvTrNreB9sXiRaRE7XmFO9gx73OIYqnIbpdV2F59MIkDIDO
	u9BlDjP2Z1ihLXzpFygOYAaoj64SOBC6IYkAwPGexUwhecKcGQzHFhWrZIClI9qLoJ/c4dJhuT0
	ZEZvPxyBQolEn/Onq8cICI9ktXmQ==
X-Received: by 2002:a05:600c:4fc1:b0:490:7227:100 with SMTP id 5b1f17b1804b1-49072aa14b3mr204899885e9.18.1779973841504;
        Thu, 28 May 2026 06:10:41 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908e0cf459sm21869105e9.5.2026.05.28.06.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:10:41 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 28 May 2026 15:10:39 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv6 bpf-next 18/29] libbpf: Add bpf_link_create support for
 tracing_multi link
Message-ID: <ahg-z_VOGlpEePfu@krava>
References: <20260527113951.46265-19-jolsa@kernel.org>
 <20260527120906.1EFB61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527120906.1EFB61F000E9@smtp.kernel.org>

On Wed, May 27, 2026 at 12:09:05PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The patch references new UAPI constants and struct members that are not defined in the corresponding UAPI headers.
> --
> 
> commit 950db3ba53901f76f22567de80577ef3f82cd57b
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> libbpf: Add bpf_link_create support for tracing_multi link
> 
> This commit adds bpf_link_create support for the tracing_multi link by handling
> the new attach types and extracting the tracing_multi options from the user
> provided bpf_link_create_opts struct.
> 
> > diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
> > index 3cd7058023304..ff342972ca4a4 100644
> > --- a/tools/lib/bpf/bpf.c
> > +++ b/tools/lib/bpf/bpf.c
> > @@ -843,6 +843,15 @@ int bpf_link_create(int prog_fd, int target_fd,
> >  		if (!OPTS_ZEROED(opts, uprobe_multi))
> >  			return libbpf_err(-EINVAL);
> >  		break;
> > +	case BPF_TRACE_FENTRY_MULTI:
> > +	case BPF_TRACE_FEXIT_MULTI:
> > +	case BPF_TRACE_FSESSION_MULTI:
> > +		attr.link_create.tracing_multi.ids = ptr_to_u64(OPTS_GET(opts, tracing_multi.ids, 0));
> 
> [Severity: Low]
> Will this compile without the corresponding UAPI header updates?
> 
> It appears the constants BPF_TRACE_FENTRY_MULTI, BPF_TRACE_FEXIT_MULTI, and
> BPF_TRACE_FSESSION_MULTI, as well as the tracing_multi struct in union
> bpf_attr, are not defined in the UAPI headers included in this patch.

it compiles at this changes, uapi changes are there from earlier change:
  bpf: Add support for tracing multi link

jirka

> 
> > +		attr.link_create.tracing_multi.cookies = ptr_to_u64(OPTS_GET(opts, tracing_multi.cookies, 0));
> > +		attr.link_create.tracing_multi.cnt = OPTS_GET(opts, tracing_multi.cnt, 0);
> > +		if (!OPTS_ZEROED(opts, tracing_multi))
> > +			return libbpf_err(-EINVAL);
> > +		break;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260527113951.46265-19-jolsa@kernel.org?part=1
