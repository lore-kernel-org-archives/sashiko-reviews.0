Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8299B3C6A27
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559978; cv=none; b=dKCvWYYLO/CrYunFdeWBs7IHAcRXMasgd+fPIp9kWVXirWykR/EkAxPk2LOyCe5YXT3Zo8dUBnRxLpTWW42YW0KBhi+/qwc7P4QfaNo2Ou9A8QbWPm04gxzRVOODmD7+26qwIiTWY5OO4oTCjtgPEFipEKSPpQtTIQgg3GTPbAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559978; c=relaxed/simple;
	bh=N7XFvxq6uMxAVWjKUzpyldIRjh1dfUspj22geuigDWo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mo7gRYVOK2J1ILU0Ekw0q8l4ZJnC+beq5DMWmCGm7PCgKyvWwDZFaZ+1+dAqYm6aS0hUGMIuBP7x33v1EBGh5hybEpGyF93gqXKEmVP/u+xUuY4AtPaEjZ94QLHKHNoVnq3GytRpkchCl3jcd3hvBWtMFNgvrFyt17QglJn7+aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4GgjGyr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4GgjGyr"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so4825325e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 00:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780559974; x=1781164774; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xr+ux2g6fgVsR71sMDGTVxIHHMX3sO8aKW8cZWnSGvE=;
        b=Z4GgjGyrb1n6huLogjVbcO8wWzXM00WIOgK2niWabyYUylc1N9T+DQL0Ohr6lB93o0
         Cgu8m9kISFtv0QiThGRUbVUum99fKWuCHGOqc+9hDvA6kBF9uCwLvs+wTSRgPmTTDWLc
         a7Ydz1qWNwwvB6/5eZ78+dtqq4yBg6Gc0EuBeMk4hSon/7HrJb3SyYhEh3DBjJdr3L0X
         sYX+S0LptwbhzHBP6hxWMxHD2bFX8TIA1CT+9+kbR4gxwopfIF4soWdy7qzrr/YTBG9l
         gadnAx3/ygolxBS3+zosklZYAQks2xVw/RzzRlMagfX8Mj0NJCe4UBj32vX6K3exiDJa
         YW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559974; x=1781164774;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xr+ux2g6fgVsR71sMDGTVxIHHMX3sO8aKW8cZWnSGvE=;
        b=daO3330dCaqIz7YY94h/jMCwAcWSqkDrYAg2j+er4z5gYVAT4OP3rcGpW3QIqLHTFI
         B5oPNObCYJ/S/nlwjWr9WRv+NcVXsj9sJVXiugWfhaqmEHqBQbi9zDq4DgSSb5oWKn/q
         G8Gfmuac3hFaSgLQgnhIU6cM1M50c5skhLOzu0qeu1ZU6pB3Q6QfceKGWOJQSWGLR7jP
         WyFzqqpxkH01CLYYynRVfeZRx9b+pIBt07acqpvPaEmRFUtCMdnZheWoOts0+uVs5DST
         3LwgOlUdR/HOK+KZdzfl4XPgiVWwvb/2qz1/y6UXqCM7MtAAjERD1oD2bo3hBFKOrUlG
         5Wcg==
X-Gm-Message-State: AOJu0YxgCeRM+ioqrR7Ng0x9CWM6QEJO1ze60RjsKMzcWWcvRkuyD42g
	hTr2IrV9f9+S9+1VOO/GOxwPzucPklRnTVPKDTbTzzKtLe2+OWo9Ai94D1EGrA==
X-Gm-Gg: Acq92OG8Si2lOs5SLqYMkNafyRXtYOhQ1SQ0wAirirCcj7O2S2b5vGBhPl0ffBZpJhk
	Sm5WeSagbbAm0UJvEHFlCs3mP8bdbSULDwaN0pEi5zHm+bKZhMSuLhBM5hZuTn6d2B3+qy/koYr
	hb6WmjwRjNV2q89MM95U6aAEwpfQTQen/3D8WkCM6WrfjYK85EwLcjFuca0whxevGR5PPZnlZ1x
	1ZrX1dWjU5I5nzIfIL8vFsioPDylOXHJ1bj+TnrQZpdEtDBHbcrpAoq6LLyvvuUKb9vsir3IHQy
	QsiQ6wcqyicqJsQidj8L1vWGpdVxcuDKbl3Dy7nN60k/0NsLGF/MGD9vC4tfVzP1A3TMxIxqUUH
	eu9PvEqwj1ptDGN4U69UwSdWhDa3gfoQacugmmkx8P9QXlOtjVJsCAcQQlVE0Cv6RbYC725Hd2d
	yLVoN9cZXBPl6aed2p35uvlkFmIg==
X-Received: by 2002:a05:600c:34ca:b0:490:4ee0:82ff with SMTP id 5b1f17b1804b1-490b5fe6112mr101748985e9.27.1780559973698;
        Thu, 04 Jun 2026 00:59:33 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm15672983f8f.23.2026.06.04.00.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:59:33 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 4 Jun 2026 09:59:31 +0200
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCHv7 bpf-next 18/29] libbpf: Add bpf_link_create support for
 tracing_multi link
Message-ID: <aiEwY-dYqjQQu3n1@krava>
References: <20260603110554.29590-19-jolsa@kernel.org>
 <20260603113419.D927B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603113419.D927B1F00893@smtp.kernel.org>

On Wed, Jun 03, 2026 at 11:34:19AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The patch references undefined UAPI constants and struct fields, causing a build failure.
> --
> 
> commit dfbf332632be62321ec615d0d0c35a8d46309172
> Author: Jiri Olsa <jolsa@kernel.org>
> 
> libbpf: Add bpf_link_create support for tracing_multi link
> 
> This commit adds support for the tracing_multi link in bpf_link_create().
> It introduces the tracing_multi record to struct bpf_link_create_opts and
> maps these new options to the bpf_attr union for the sys_bpf syscall.
> 
> > diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
> > index bc513aa8f4041..f37e3416f61a5 100644
> > --- a/tools/lib/bpf/bpf.c
> > +++ b/tools/lib/bpf/bpf.c
> [ ... ]
> > @@ -845,6 +845,15 @@ int bpf_link_create(int prog_fd, int target_fd,
> >  		if (!OPTS_ZEROED(opts, uprobe_multi))
> >  			return libbpf_err(-EINVAL);
> >  		break;
> > +	case BPF_TRACE_FENTRY_MULTI:
> > +	case BPF_TRACE_FEXIT_MULTI:
> > +	case BPF_TRACE_FSESSION_MULTI:
> > +		attr.link_create.tracing_multi.ids = ptr_to_u64(OPTS_GET(opts, tracing_multi.ids, 0));
> > +		attr.link_create.tracing_multi.cookies = ptr_to_u64(OPTS_GET(opts, tracing_multi.cookies, 0));
> > +		attr.link_create.tracing_multi.cnt = OPTS_GET(opts, tracing_multi.cnt, 0);
> 
> [Severity: Low]
> Are the UAPI constants (BPF_TRACE_FENTRY_MULTI, etc.) and the tracing_multi
> struct within union bpf_attr defined at this point in the tree?
> 
> It appears this patch relies on UAPI additions to linux/bpf.h that are
> missing from this specific commit. This causes a build failure in
> tools/lib/bpf/bpf.c due to undeclared identifiers.
> 
> Should this commit include the UAPI header updates, or be reordered after
> the corresponding kernel patch to prevent breaking git bisect?

added in:
  2beba92273f5 bpf: Add support for tracing multi link

this commit compiles fine

jirka

> 
> > +		if (!OPTS_ZEROED(opts, tracing_multi))
> > +			return libbpf_err(-EINVAL);
> > +		break;
> >  	case BPF_TRACE_RAW_TP:
> >  	case BPF_TRACE_FENTRY:
> >  	case BPF_TRACE_FEXIT:
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260603110554.29590-19-jolsa@kernel.org?part=1
