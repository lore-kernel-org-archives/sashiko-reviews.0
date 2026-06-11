Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE743AC0C0
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 09:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170653; cv=none; b=NJtXfG24Tn3HJFTGj+ok6aPcG1u3waGvQjpDonj8JknHXwYz0Jisx1i3SsX8R4YPYRaSNSBItfVJGu01ub5o/I5gisDVyAz+Q0+YkbaXIqdKoMrnD4N17nVdIsE0H8UTkLjVNB/iAK0bg7Ly21BBIE8QTaUu8hjhsKAAqZ49npM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170653; c=relaxed/simple;
	bh=wA+twUEFzsAdwFg4SjCBQ9q3jy94DJz5Ve4/QlurBos=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPNvWEskmt9fG3yoz61YEoFxeTqXjCzB0ItP6DAYB7Uz1iKXf4zBEwgpTGK7w1q13LOK2R1BmONCxJTULbwyQ2dCLfOirUbhAibP9JsEZok+si0sqLmBBXRbyDfnC44fXGOoZV3dW/0L7LlZgiz3DdVb+UUi4JovESm8mlolo9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1P5rfg7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1P5rfg7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45efa80e0afso6054258f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 02:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781170651; x=1781775451; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vEO8kje9kYrRQU/+kV8ArVqyL99RuYg/7cQwFotLr28=;
        b=Q1P5rfg7qfWaLZfv1IuEams3o0+ZGgaZKMMNKozr707G+iVnVgL9cXTGRIrfi1FG/f
         hVVqwpm31xsS/b/Jf8BwvHMEHfaFNt2e2/B92mZ1FA0Bcjo33ecMWSOVsKQnO1Sv9g6b
         qNHtcKuMrt8ZR58iKc44fN8zKZ0khdd4FhewYCmwAldXn8NoYi+VE7iDlP0NT/PVJQ0x
         XQBsSxh0pKCCzhNaBZIGGAac10IgOt17gIkCnCJA19/Ks0fF+vDdafio37+Fdg7oMQyX
         oL2QxkBJCGjFOaICpKnE9ZS3WR/JXxKIodOXU6ipA81tJzeEdQnKLBAYmiN9FEnZXhre
         PGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170651; x=1781775451;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEO8kje9kYrRQU/+kV8ArVqyL99RuYg/7cQwFotLr28=;
        b=BTffqNrqW/muzAlAdVyztFVIzZXkEQrh70TWksvQdNpco7UCYeup7a81iL8Pj+ePIx
         mNmasKCMtcUV5Hlz8JvAiPx3iWrCw6NrkUi37qFv0FrWmZavXbhq1Ru+tauGOfrUBEs+
         1G1ijkKN5SpBrntB+ybPtVShUUoahPVL2HMG9+VFTQKd15BTnWM6L2P/6ScFfOOYwM/c
         ee1iSUPfWuMJuIyMGLk/tX/czwqhJuxV/5EDKFGNLo4UeRmDRrOnkRVcxEjAjaTy+yHp
         J92UBT7Hb8YZViS2ossTxXAKq7ou/Vx+D99F/8ma8j5PxytTQFZyWPblC3GkrAlp5siS
         8JuQ==
X-Gm-Message-State: AOJu0YzmOJJ6Nd6ixkeHpX/snxHDahp/1tcs4WQ6bq8u0NA2R6+/2ajZ
	ZSiUxN6MebbPA8gXJmBhYzVxfjA9dQSWVHPjKzBrm6k98l9kdClvF7XHGEBbdg==
X-Gm-Gg: Acq92OHki1kwqm7HwT0Ejg6Js7BEYw28JZSt+UgJaEK0RWc5PNDSiz6fKduxnWI7TiC
	9gu+WluIRv9GY1Vj92V1EOmWo4REq0gpqpUEmZdYVXcwxKklzzUA2SGZI+mHllYUMPj2V0a5Diw
	WL5+H8+bhYNBLilRyZQJfzAGLMhPLAKnt9TsJCWTvaC2TpsYPl91VEy0aIri7LxSXIwEtBanZCl
	in+G+UCcm9uewg8ZFokvfu33ggtcl9wB4FZQndHra/IvvheqjQ5J3bqd25vI/0Djo9yddo4tuKj
	+TC02xdPiOo0VjWJ0HKl95aZJpDbSsC2PAARfDvm5kTbWbLB+wXmuwO4YniS2It4J6Alma5UbCH
	UHA0jZ5Y582EhOEsx/ef16IepH1gaqunMVYuuVzOXklqS+Iqx16YynuouyAev0izhtkvJPGaDDm
	8s7cE84LEQdwM55QQ+eAOMZWyvtg==
X-Received: by 2002:a05:6000:1862:b0:45e:edcc:f6dc with SMTP id ffacd0b85a97d-4606746a03fmr3334435f8f.6.1781170650676;
        Thu, 11 Jun 2026 02:37:30 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcae2sm85188717f8f.6.2026.06.11.02.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:37:30 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 11 Jun 2026 11:37:28 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv2 bpf-next 3/6] libbpf: Add path_fd to struct
 bpf_link_create_opts
Message-ID: <aiqB2PK0ZzuJNIG9@krava>
References: <20260610143627.804790-4-jolsa@kernel.org>
 <20260610145019.7F4791F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610145019.7F4791F00893@smtp.kernel.org>

On Wed, Jun 10, 2026 at 02:50:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Compilation fails due to missing `path_fd` in the `uprobe_multi` UAPI struct.
> --
> 
> commit c73ec6f8d6c5a6bb4c8a75f70c333cac0d6d30d4
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> libbpf: Add path_fd to struct bpf_link_create_opts
> 
> This commit adds the path_fd field to struct bpf_link_create_opts for
> uprobe_multi. It passes this new field through the kernel attribute interface.
> 
> > diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
> > index f37e3416f61a5..96819c082c772 100644
> > --- a/tools/lib/bpf/bpf.c
> > +++ b/tools/lib/bpf/bpf.c
> > @@ -842,6 +842,7 @@ int bpf_link_create(int prog_fd, int target_fd,
> >  		attr.link_create.uprobe_multi.ref_ctr_offsets = ptr_to_u64(OPTS_GET(opts, uprobe_multi.ref_ctr_offsets, 0));
> >  		attr.link_create.uprobe_multi.cookies = ptr_to_u64(OPTS_GET(opts, uprobe_multi.cookies, 0));
> >  		attr.link_create.uprobe_multi.pid = OPTS_GET(opts, uprobe_multi.pid, 0);
> > +		attr.link_create.uprobe_multi.path_fd = OPTS_GET(opts, uprobe_multi.path_fd, 0);
> 
> [Severity: Low]
> Will this assignment cause a build failure?
> 
> Looking at the UAPI header in tools/include/uapi/linux/bpf.h, the
> uprobe_multi struct inside union bpf_attr doesn't appear to have a path_fd
> member:

compiles fine, path_fd was added in previous patch

jirka


> 
> 	struct {
> 		__aligned_u64	path;
> 		__aligned_u64	offsets;
> 		__aligned_u64	ref_ctr_offsets;
> 		__aligned_u64	cookies;
> 		__u32		cnt;
> 		__u32		flags;
> 		__u32		pid;
> 	} uprobe_multi;
> 
> Should the path_fd member be added to the UAPI bpf_attr union as well?
> 
> >  		if (!OPTS_ZEROED(opts, uprobe_multi))
> >  			return libbpf_err(-EINVAL);
> >  		break;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260610143627.804790-4-jolsa@kernel.org?part=1
