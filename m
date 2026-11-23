Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442918;
	b=AZozz+SS3RY+zN/vnASbjxXuQkfCSbFxq8q50qqtwhxLiVhzVo7ypW8JCjYmUKFnmpY5
	 9VZTawY9OG8JZFlBR3J6us9XJ/LTgVwn223xpKtrVZsqO5N1qVybWxUfKnfQyjObpQ9Bk
	 UC6HiyCWcAYXcPVuaKKTwJG+7rQwJV9xVoCsJAwKx8vTXFqj1YJMRLq2EjN5loDwhkqoP
	 /nUbv2jJQXwhqln9Gtpz2n33vIkdbUA2U+5ZoAY+IUm390PbU5aFiZXLPIISzTtddA8YA
	 bwk+2JGtj9B1KM98axFpVoI1RPivnVVIHkBjvmwb15gch3Uh3tO04pzVw7D53E9agYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=cIjP56CWq1uSih/XHWmZxfycsoSnaUHygNNyREh/BjU=;
	b=l7VTvVS9ChLqdnstpJIlb19Ml3vVSn/UVr+SBVrHz0sjMWYEeTh8XSk/xwQaOprqZkvn
	 MaTJ7f1TbamhjVbOKsUmlOxQ0H7rwuL6n8PI9Ubdj7OqqpZcJRhks2z102bcvZREedwbj
	 lcGZ9IuRMWaNq6U6TJ+8Kk6HVNedigSSpA65w2xueqRPfl2WQzjvb+R/qnHj3ySJl8TJt
	 ZP7Lf5bY1oZR53BZm+85qKUdf3nro++3UOuzy1MFf2KMdQ8j0BRICRr4jlnif28e/aXkO
	 w32cmv0xtoVB0PgqNQQ4St4ZEfaUO87Pkkb5ggDCnZGtZlFhY0zqpYcvmR3r8kNCK1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cVYeReaJ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8E1606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 14:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E8E1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cVYeReaJ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so25712945e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 06:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795442915; x=1796047715; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cIjP56CWq1uSih/XHWmZxfycsoSnaUHygNNyREh/BjU=;
        b=cVYeReaJCOGZoJ5vIqK6SQgIWbJpU2uTjQAGPK8k1ylhXj1cnyCZCPqUU1GJpS4u8U
         b8MpHuuVKlT6thuJj9bGSwH3Zg0HcNwta5PLCtaymtopS4kJY+ExMfwGZMs59nJXVoEh
         PL0RQvdxwqmLVQmS9ge1GWstSgpYsBlRbD9KOgLcn2GsrwfTc9H3uXkK57JfovOT819S
         5CxycHRS4b/z/B1/Jfn9kVaHNW9zJgQxSri4fr86FRtFwF2Md8kc4QgGUW5w74DrUz1i
         4cbGDtfekN62DqO4yEU5bUXaRCFTz1z+ScCdVwKOr4UueBKQe4mKtlMCB1Z/GPdreEtq
         sD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442915; x=1796047715;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cIjP56CWq1uSih/XHWmZxfycsoSnaUHygNNyREh/BjU=;
        b=uvfBjZfAZK8cSQie40dUBjIkCEiB8KK13O+gL5OmG5s4DTA8leextNTo5GpDElOLXH
         jgxpq8jwdvF9VgErfUp81dwaYS/0nqld5qqmmNAWORJQNhq1Nn6uIBSpQEUyDzXWls4T
         9Y8ErHq9/ZWNEXhPmYFwR+ROy0B+wXLaG3KG0mRyoBPOKLdD7vUCfN3OY2b/m6TiTFnT
         DwA04PYZSy5H7QHWqZ32D9QNo0iQG7EMrAeDfFeBSvnUp/iiTfFcaZ+NHXvpHZOUCHZY
         r5j850gzCgKhzc57yv8Ue1sJPWoJsTGuCn2EqfVO14EZdQoi9MpLisLyLKM3So5+IjJp
         iH1w==
X-Gm-Message-State: APuU4Z9Gp20q0aMbYlXyjIkSMQTkRQIXgjY+QrjS4oX6dONEB2MTP8RI
	aTxOfu9hRj5el+U083hAe583mbM9B13xlNOurPJhSRw7UNVVxOO7shKRzgjT2UifmSdMs8Jg5L8
	UOJa8nbw=
X-Gm-Gg: AZFdTZfmj+ZtORf5OhWxS4hHEXV2P92NHn3l6YHT3+5zJQ2x/JHos69LlDuEs2C0Xd5
	zVG1E9GYu0TIVhBQmXx5q70dms9fm8xgUs3C93FUaCFQhU1srG1n/Mkp8oPXal4L3+4ZLWR969S
	qQLNIhqlPfNtEnRZNxVChIKQDd0h47BNhYBBwp8BnUZprrBldptksQW+zqeYs92KbRRjwVpbN07
	PiCNbqUMYukhpXcxAkXgRL3vbTBQg6o2hd/4aZ0tPcGiv0DgzEerGLH4mhkLBrod+qgVNr9PvG5
	MqpCw37ixdeKzd8pBGzhlnr3Rbh41ApdbN+joYtjVvC8nHxybbZ205wDYu+6pCReFNY9Iayx76u
	db4ng7fvyhr+8Yddt+fiAaU8ruVNvCoYgvdg9bFPz99M910x/kEKagQWwykYPzaCUViAmD3/k2n
	R/+3jUMpiOc2gBRK3nozoSFozZ5ioM0zXR3jtz0taVxdbt7iBsCEDhY55npXsdJKJZnRoIgMaU5
	ME+Pt9jK1cLDs4f17mVJFQ7Bl5nzJGo0S8Gl4AlJoL4gUoIr9bA5LQwuIdRzT4JznnGe1fkdCLo
	XjLegmUU4dMeHNScjsgaMkNHzsg8+wE=
X-Received: by 2002:a05:600c:1546:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb887c2cb0mr263882625e9.2.1795442915456;
        Mon, 23 Nov 2026 06:08:35 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895eec06sm136102075e9.2.2026.11.23.06.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:08:34 -0800 (PST)
Date: Mon, 23 Nov 2026 15:08:32 +0100
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: Sasha Levin <sashal@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org
Subject: Re: [PATCH v4 3/4] selftests/livepatch: build the test modules
 against the kernel in O=
Message-ID: <awRI4PbBHGtnNijI@pathway.suse.cz>
References: <20261110161050.2451750-1-sashal@kernel.org>
 <20261110161050.2451750-4-sashal@kernel.org>
 <sashiko-outbox-207425@kernel.org>
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
In-Reply-To: <sashiko-outbox-207425@kernel.org>

On Tue 2026-11-10 16:53:01, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] selftests/livepatch: KDIR fallback ignores builds without
>   Module.symvers
> --
> 
> commit 62f70537bbca33262ec62f1273becbdf534f58fc
> Author: Sasha Levin <sashal@kernel.org>
> 
> selftests/livepatch: build the test modules against the kernel in O=
> 
> This commit selects KDIR from O= or KBUILD_OUTPUT (or the kernel source
> tree) before falling back to the running kernel's build directory, and
> strips O= and KBUILD_OUTPUT when invoking the kernel Makefile for the
> livepatch test modules.
> 
> > diff --git a/tools/testing/selftests/livepatch/Makefile b/tools/testing/selftests/livepatch/Makefile
> > index a080eb54a215d..97478ef90945c 100644
> > --- a/tools/testing/selftests/livepatch/Makefile
> > +++ b/tools/testing/selftests/livepatch/Makefile
> > @@ -1,5 +1,31 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  
> > +# The test modules are built against the kernel in KDIR. When KDIR is not
> > +# set, use the output directory given with O= or KBUILD_OUTPUT if a kernel
> > +# was built there, as with
> > +#   make O=/tmp/kselftest TARGETS=livepatch kselftest
> > +# otherwise the kernel source tree if the kernel was built in it, as with
> > +#   cd tools/testing/selftests/livepatch; make
> > +# and otherwise the build directory of the running kernel, which its
> > +# devel files provide. A kernel was built in a directory if it has a
> > +# Module.symvers.
> > +ifndef KDIR
> > +KBUILD_DIR := $(firstword $(O) $(KBUILD_OUTPUT))
> > +ifneq ($(and $(KBUILD_DIR),$(wildcard $(KBUILD_DIR)/Module.symvers)),)
> > +KDIR := $(KBUILD_DIR)
> > +else ifneq ($(wildcard ../../../../Module.symvers),)
> > +KDIR := ../../../..
> > +else
> > +KDIR := /lib/modules/$(shell uname -r)/build
> > +endif
> > +endif
> 
> [Severity: Medium]
> Does checking only for Module.symvers cause KDIR to fall back to the host's
> /lib/modules/$(uname -r)/build when the target kernel in O= or the source
> tree was built with CONFIG_MODULES=n or an image-only target (which
> produces vmlinux.symvers instead of Module.symvers)?
> 
> When that happens and the host has kernel headers with CONFIG_LIVEPATCH=y,
> test_modules/Makefile reads the host's include/config/auto.conf and builds
> the test modules against the running host kernel instead of skipping them
> for the target kernel, which breaks cross-compiled builds or builds where
> the in-tree test modules use newer kernel APIs than the host.

The problem looks real. But I would consider it a corner case.
IMHO, there are only few users using CONFIG_MODULES=n. They
might use SKIP_TARGETS="livepatch".

By other words, we could fix hit later when there is a demand.
You would not block this patch because of this. It fixes
some scenarios and goes in the right direction...

Best Regards,
Petr
