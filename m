Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6203905F5
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 19:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326809; cv=none; b=D4hZQUx8yXNPKEGj8a8cEJERuMUZH4TfRXOh9FIPCBejth01ijhB2NYqcasvMrLXp9MiaTxp7IyElWUR8H2wzM9zNxbMewfEwueSq3IfrjK9budzO/agdbpy+2IG7q90csEAzCHWy5cA9HikN2S1/0uBeopLfwZ3k+ou4uL97uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326809; c=relaxed/simple;
	bh=cfWllBRD/mj3yK6g4KMqUcu8bMpR7oST8wpGjxYW/g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrAUUinx06s1UK49kg271dX+iCRrY0PMdHVyHkpT/6F3pIJ7ysKupslyaUkDYV9giRCMJWo0Nwq6RlO2ZpySWQn1+i4xLFkZo+7dbBU7k3j28YSgHZJ9unVP/xOL8pFDDdhOLud7eGFE6I2iTyL0K5Q1RG+XDwsiAdrXUY3hQjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsspEVX0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsspEVX0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A38C1F000FF;
	Sun, 13 Sep 2026 19:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789326807;
	bh=CaOskXcnrNTIaMxe9Pjo7V95wpt10lRhOuuuc/ER/I0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NsspEVX0THgW4vHHN+MreCCN7IQdUpGD5TLe3T3lmU10CCkQ60e7xUtvWXlIA8T+l
	 HMmo4Uk6cXIbOyuCwAHa7omAqmYLiV25fg6fqc17pugh4EFSeefdkzu+VAjwbH+oWN
	 Xd6D86hqq3SZq9isX70NUfRsvxxOUMjm5poc32Ef2OTApV3sxt46UMX/CDkCnGcrBb
	 n7DAXw2lhRWi+KoknNTjnEhoYi8VKu9fKgwr2ujQ6/M/+mkJkIqB1ezZA8V4Qlycmw
	 uy/u+Lr5V6ho3yKS+wwK/ui9FuFUWYXOoO2GAkGzLNddRrnlCj97soeXjzQzsCR0nU
	 hA3pPEpwiGFvQ==
Date: Sun, 13 Sep 2026 20:13:24 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org
Subject: Re: [PATCH 23/23] kbuild: use pigz for gzip compression if available
Message-ID: <aqb1vC5h4LqE9LBc@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-23-5dc1ac01672d@kernel.org>
 <20260908212045.A3E6D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908212045.A3E6D1F00A3A@smtp.kernel.org>

On Tue, Sep 08, 2026 at 09:20:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Implicitly replacing `gzip` with `pigz` causes massive nested parallelism (N^2 thread explosion) and resource exhaustion during parallel `make modules_install`.
> - [Medium] The `KGZIP` variable is unconditionally assigned using `:=` in the Makefile, ignoring user-supplied environment variables and breaking the documented reproducible build instructions.
> --
>
> commit 705f9cac49412988e279fbfecc9fcd8e34672bd2
> Author: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> kbuild: use pigz for gzip compression if available
>
> The gzip step of a kernel build is very lengthily, especially for larger
> builds such as allmodconfig. gzip itself cannot be run in parallel, however
> an alternative tool exists that can, providing the same feature set as gzip
> itself - pigz - which works as a drop-in replacement.
> Therefore default to using pigz if it is available on the system upon which
> the kernel is being built, otherwise fall back to gzip.
>
> Link: https://zlib.net/pigz/
>
> > diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> > index 5a9013bacfb75..ebfc2319d6dac 100644
> > --- a/Documentation/kbuild/kbuild.rst
> > +++ b/Documentation/kbuild/kbuild.rst
> [ ... ]
> > @@ -110,6 +110,19 @@ HOSTLDLIBS
> >  ----------
> >  Additional libraries to link against when building host programs.
> >
> > +KGZIP
> > +-----
> > +The gzip compressor used for the compressed kernel image, compressed
> > +modules and packaging.
> > +
> > +If unset, it defaults to pigz (a parallel implementation of gzip) if available,
> > +otherwise gzip.
>
> [Severity: Medium]
> Will this fallback behavior actually work as documented?
>
> Looking at the assignment in the Makefile, KGZIP is unconditionally assigned
> using the := operator, which overrides any user-supplied environment variables.
>
> If a user sets export KGZIP=gzip as instructed to ensure reproducible builds,
> but runs make without command-line variable overrides, wouldn't the Makefile
> unconditionally overwrite their environment variable?
>
> [ ... ]
> > diff --git a/Makefile b/Makefile
> > index 3805f72428cb2..5cb8190343729 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -561,7 +561,7 @@ PERL		= perl
> >  PYTHON3		= python3
> >  CHECK		= sparse
> >  BASH		= bash
> > -KGZIP		= gzip
> > +KGZIP		:= $(if $(shell command -v pigz 2>/dev/null),pigz,gzip)
>
> [Severity: High]
> Could this implicit replacement of gzip with pigz cause massive thread
> explosion and resource exhaustion during parallel module installations?
>
> When running make modules_install -jN on a multi-core system with pigz
> installed and CONFIG_MODULE_COMPRESS_GZIP enabled, make spawns N concurrent
> instances of cmd_gzip.
>
> Looking at scripts/Makefile.modinst, it invokes the compressor without
> restricting its thread count:
>
>     cmd_gzip = $(KGZIP) -n -f $<
>
> Since pigz defaults to using all available CPU cores, wouldn't this result in
> N*C active threads during parallel module installs, leading to CPU thrashing
> and potential out-of-memory errors?

These have already been addressed for v2 as were raised by Nathan.

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org?part=23

--
Cheers, Lorenzo
