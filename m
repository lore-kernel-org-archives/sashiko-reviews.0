Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B7F3F54D9
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 18:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323317; cv=none; b=hHaQ8sE6KZ4UQZobtMWPkzf/Bmx03OS1MkH0bO9rgo8aAU9QNdKN8xKGLrNCyAiE2JFUsZ0OOSTlPgH6YacRf72jGHv8GtBxVymmgVkwBNoRXrD8LN7nUFYXgT++kqNektFZUCFYHw5+ila3gZrrJNgLri6mZpK/N2wS83gsMRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323317; c=relaxed/simple;
	bh=5P4Ofaqnvso51P2FqMstqEiv+aXRgB52sASeqtigzIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKqyx9SBw3SurwR76wSNkgjCLl/PCve5GHoHy2ALCTkR/b5+VY+MwMeTTPuaBhYhc/89NqhEtLdmzye2cYvrBkvZsrUsRw8YC8Q/+9OwVI41mCMqutTLou3Nox7KijXVjeDr7OYAQDjsu2n6B1KwJs6Bbdu8qu5E3bkcfECgtXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1sVwqqP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1sVwqqP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44611F000FF;
	Sun, 13 Sep 2026 18:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789323301;
	bh=0ThwI7r3nMg0rZtPYri+b1oiLL52vKlrHsRaE3QzeMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o1sVwqqPVPB7IRkH7CkJ/oGRCLuH39ZfW9FgGVkuVYs1cT+neskTkYRcXu/xREnhX
	 xd5YCoiCCjh0CEwDEUOM6Flm4SFdyFhRMKXj1Z3+vxmo15x9oYEFEHopQCewN0d+HK
	 pADeez9DJpQzSxsxXYw8bRCgsfmXqHx2LcBMi9WZb94cZPTMfAqGjjT9bkKkoKlrEb
	 0loZWVO+HNP/h5gy+JvUhMwsXxDd7mNLPyT9x4vve6ZpMSYltsdTxVaNIoyOWQ+p+I
	 qKO5I8Uuu6Xf2LojtGbbNRWOtx9s+k5HGTn5fDwQCUwPwj5nUAvh9fzc41atRJfbv7
	 rH024tmE8O5Kw==
Date: Sun, 13 Sep 2026 19:14:57 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org
Subject: Re: [PATCH 16/23] kbuild: batch module finalisation
Message-ID: <aqbnyyfkjHk8WLvd@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-16-5dc1ac01672d@kernel.org>
 <20260908211822.C97E01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908211822.C97E01F00A3A@smtp.kernel.org>

On Tue, Sep 08, 2026 at 09:18:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Unlisted and non-POSIX dependency on the `seq` command causes a fatal Make syntax error if missing.
> - [High] Fatal Make syntax error when no modules are selected for the build.
> --
>
> commit 6c6d5fda60bd6b0c0a86fda35f3eac7d4488623e
> Author: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> kbuild: batch module finalisation
>
> This commit splits modules.order into chunks of 128 at a time for module
> finalisation to speed up allmodconfig builds. It parallelises the finalisation
> workload by having a parent make process dispatch chunk instances.
>
> > diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> > index 75e9effdf02ce..858fa798090be 100644
> > --- a/scripts/Makefile.modfinal
> > +++ b/scripts/Makefile.modfinal
> > @@ -13,9 +13,30 @@ include $(srctree)/scripts/Makefile.lib
> >  # find all modules listed in modules.order
> >  modules := $(call read-file, modules.order)
> >
> > +modfinal-chunk-size := 128
> > +
> [ ... ]
> > +else
> > +
> > +modfinal-chunks := $(addprefix chunk-, $(shell seq 1 $(modfinal-chunk-size) $(words $(modules))))
>
> [Severity: High]
> The `seq` command is not mandated by POSIX and is not listed as a required
> tool in Documentation/process/changes.rst. On minimal environments or
> certain BSDs where `seq` might be missing, the shell command fails
> silently and returns an empty string.
>
> Will this result in `modfinal-chunks` being empty, leading to a fatal Make
> syntax error on the rule below?

This is very silly, it's shipped everywhere that can possibly build a
kernel. Build would fail loudly if missing.

>
> > +
> > +PHONY += $(modfinal-chunks)
> > +$(modfinal-chunks): .module-common.o
> > +	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal modfinal-first=$(@:chunk-%=%)
>
> [Severity: High]
> If the kernel configuration enables modules (CONFIG_MODULES=y) but no actual
> modules are selected, modules.order is generated but empty. Consequently,
> $(words $(modules)) evaluates to 0, and $(shell seq 1 128 0) outputs nothing.
>
> Does this leave `modfinal-chunks` completely empty, evaluating to an invalid
> target-less rule (`: .module-common.o`) and causing a fatal Make syntax error
> (`*** missing target pattern.  Stop.`)?

Bogus. Tested and works fine, GNU make accepts ar ule with an empty target list.

SO 100% hallucination here.

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org?part=16

--
Cheers, Lorenzo
