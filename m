Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9D0390C8A
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 19:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326140; cv=none; b=KeSZQWykr1Y4O1twv6nOR3dSG7hQye1pUKl9zGLlTvR1IWs6DX/ESTdLv9aHtuk/nLI6zYsRXKIHrXGenUfb1pU9pLeCWjJEWTR8INPrdTeAUMxz5J5W1Aj1PXDSk2Rlrn39GKD+vocQqPr/wX6wic2NUMomwYuc4C1KeoTs4zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326140; c=relaxed/simple;
	bh=k6t5Ti103vZRlsKUiDpdsQU2Hqvw+9x1xtqqmSsANtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOJaNlB1v0ezz9JRvaGhvKqQT8hSAWwxm/Y7jWTw5d16ypNdBXAlAhxEGVP47Vv84Faa3fIagDlqhJfH/0u/AcFcE2jYmI5CGneI7H8+OsNV8NgtEYk1XyHIZ1GWMCXauq8uphTeC87LK9w4jpaKqgl4S5n3zjaK70OYVKd48jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tuzprcu2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tuzprcu2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F8F1F000FF;
	Sun, 13 Sep 2026 19:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789326139;
	bh=DW3R2KHTBbJYWwfwzwEO0X9YiCqPAvJ3eeZPjWS1CZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tuzprcu2qGc2K9+nLqH1QsN70ph3Z1KgEr9nuQ8ShConuJS9vs1Dz7LH53LKzx4VI
	 O6w+BmOjp3m5MVeBO9M4KD4DPOB1SXQDz4loAmgBX6eVRP3qGXtTplJZoI/QCsExrB
	 XGE9HP2db/L4dKE1LMCUL8bPyQxiEFBdFmS7W/7VV7H611LUgm7NkWE58+LYZy/c8y
	 sJnl/ID625H5D2k+WnoshT8VxZuMMhWyqP4WrOJM76bsKSgUjOSGRhrK1e33uom+fe
	 RGxBym6a+NWAR0/mI69RNWkVjtIraq9331b0YLPnOf5NehbvclDOFnA1U4NEmFf5sf
	 Rr4NrsgmnpgvA==
Date: Sun, 13 Sep 2026 20:02:15 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
Message-ID: <aqby2K6mddww50_U@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
 <20260908212035.010861F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908212035.010861F00A3A@smtp.kernel.org>

On Tue, Sep 08, 2026 at 09:20:34PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unconditionally passing `-j8` or `-Zthreads=8` to `rustc` breaks single-threaded Make invocations (e.g., `make -j1` or simply `make`), forcing an 8-thread pool and creating an OOM risk.
> --
>
> commit 31e6e028120fc1bff9382e6014058f3d1bbcb274
> Author: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> kbuild: rust: parallelise rustc front end
>
> This commit adds parallelization flags (-j or -Zthreads) to the rustc
> invocation for Rust kernel code. It uses Kconfig checks to detect compiler
> support and applies an 8-thread default to speed up the Rust frontend build
> process.
>
> > diff --git a/Makefile b/Makefile
> > index 997fc7ebe0965..7d23d7b64be33 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1204,6 +1204,10 @@ KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/= --remap-path-scope=macro
> >  endif
> >  endif
> >
> > +ifdef CONFIG_RUST
> > +KBUILD_RUSTFLAGS += $(if $(CONFIG_RUSTC_HAS_JOBS),-j8,$(if $(CONFIG_RUSTC_HAS_ZTHREADS),-Zthreads=8))
>
> [Severity: Medium]
> Does unconditionally passing -j8 or -Zthreads=8 to rustc break
> single-threaded Make invocations (e.g. "make -j1" or just "make")?
>
> It appears this might override Make's job controls and force an 8-thread
> pool even when no jobserver is present. On resource-constrained systems
> where users intentionally use "make -j1" to limit the RAM footprint, could
> this significantly increase memory consumption per rustc invocation and
> cause an out-of-memory error during the build?

No, when a jobserver is present it doesn't override that.

When -j1 yes it will, but the memory delta is small, a few hundred megabytes
(~1.1 GiB vs. 1.4 GiB).

So it doesn't seem to be real world issue.

>
> > +endif
> > +
> >  # include additional Makefiles when needed
> >  include-y			:= scripts/Makefile.warn
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org?part=20

--
Cheers, Lorenzo
