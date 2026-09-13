Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9377939CD16
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 19:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326585; cv=none; b=a3ksudxDLjEB0nKY6XPjfiYJPyJJ5o8d6oSjl65Ku1oopGNFqTEtPE/H/GXvu0b0bSS7V7nDhESBevgn6GY/C1UyxPWIb45WV4IDpYflaH9ihKmAa2LSXXgkGapSQQl1K3NxJLeeM22GjYI+s5BXLZ/829EZYqb4B7p/fSAShQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326585; c=relaxed/simple;
	bh=dHHmg+YUy5DAtGw3L/sGDAlQbgpMjvnnQZS1YmaKwQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4lK1omwvR3dKXkgYDzHKOqMcwbxkEkKxBvC4qHqzNM5WXDtDBhAOfCnpYKRM56+SpDxVK5VuoR/wmgJxh5wPrncNfebACPDBR9Kq+3/6UPs3PTYpiUpoAK0rtHKw+vZbHuBZ9uHPFGmvgT95dKF9w/cIZS6yN/ZjVJX5vESu4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKjPQzwe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKjPQzwe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23B3E1F000FF;
	Sun, 13 Sep 2026 19:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789326584;
	bh=lmhO64BOgV9xaPMFRdm4zXyLf2qicvTHG0qcBlHeLZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TKjPQzwe0tSiQM5/z1MqHiheyyvbYufv/O2BQqNbTsajGLn1C4xvpYzPWOSa+0Nf6
	 HsRDVeYH1nKN4ge2y7XtHvwne7Ptc41htbNTVQ246WbjAmgJwm8uPtuAJaQYzZqIg3
	 oJmfamP9hUxLtzcS+t+V+ZKXJMsO4LwxSTRtEIbH8bzFYuGCufwuxYafVGo2q/0JPq
	 YXZ0vg2dF5rCImu660u60CNls1Ny6yxRRzLQguXNdTQOhIha2bK6i9RP44YMEUXnPu
	 7ml5Xb4TIqdGWNMQXhOrEMSMHCxyCQpEuj2Gy6cBi1u2yweIvR/E04c7ORPSTglV0p
	 Z3q97g9E8swBw==
Date: Sun, 13 Sep 2026 20:09:40 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: gary@garyguo.net, ojeda@kernel.org
Subject: Re: [PATCH 22/23] kbuild: build rust crates in parallel with the
 rest of the build
Message-ID: <aqb06kVv8XjGowNE@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-22-5dc1ac01672d@kernel.org>
 <20260908214335.1C52F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908214335.1C52F1F00A3A@smtp.kernel.org>

On Tue, Sep 08, 2026 at 09:43:34PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `modules_prepare` target fails to build the `rust/` directory when multiple targets are specified on the command line.
> --
>
> commit b7cbb20d375e296dcfc9da28b89bbc6beb01af39
> Author: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> kbuild: build rust crates in parallel with the rest of the build
>
> This commit allows Rust crates to be built in parallel with C code by
> removing the Rust build from the make prepare step and establishing a
> top-level list of directories containing Rust code. It also attempts to
> ensure that the rust/ dependency is established for out-of-tree module builds.
>
> > diff --git a/Makefile b/Makefile
> > index 7d23d7b64be33..3805f72428cb2 100644
> > --- a/Makefile
> > +++ b/Makefile
>
> [ ... ]
>
> > @@ -1760,6 +1763,12 @@ modules: modules_prepare
> >  # Target to prepare building external modules
> >  modules_prepare: prepare
> >  	$(Q)$(MAKE) $(build)=scripts scripts/module.lds
> > +ifdef CONFIG_RUST
> > +# Ensure rust/ is build before any external rust module which will rely upon it.
> > +ifeq ($(MAKECMDGOALS),modules_prepare)
>
> [Severity: Medium]
> Will this exact string comparison fail if multiple make targets are provided?
>
> If a user or distribution build script runs a command with multiple targets,
> such as make modules_prepare scripts, MAKECMDGOALS will contain multiple
> words. The exact string match check here will fail, causing the compilation
> of the rust directory to be silently skipped.
>
> This would result in the prepared kernel headers being incomplete and lacking
> necessary Rust artifacts like kernel.rmeta, preventing subsequent attempts to
> build out-of-tree Rust modules.
>
> Could this check be modified to use the filter function to see if
> modules_prepare is present in MAKECMDGOALS instead of requiring an exact
> match?

Yeah this is valid, will fix in v2.

>
> > +	$(Q)$(MAKE) $(build)=rust
> > +endif
> > +endif
> >
> >  endif # CONFIG_MODULES
> >
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org?part=22

--
Cheers, Lorenzo
