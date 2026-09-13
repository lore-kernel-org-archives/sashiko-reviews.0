Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326C432D42B
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 17:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789320053; cv=none; b=I4btwMhcbWcmKDmbeeYSNn48NZOTKVJC0evdSOKrHK0Emze63+USmitcKTImTlWQ39BMxJEYC2+6vsxTG+GtyNPN7Zk0/zLUCy3Hv9MmzQqAXAWYIxHtzYQNmOA4Mu/rwPrx7si5c5iDk4fv5vfUkV8aojjUM3Fe1XdwlJuvaHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789320053; c=relaxed/simple;
	bh=nJptRM8dwtke6CPUFyBXukamdxk+DHD1KOAFWyVgSzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXTAtPLR6cnduC/vx1gFsQkJ4N9F2sx5OoIq75ud5bkC2/ZgujRd1xOjvLXTtg+WnEtIixLxMUQOU6AwC0l9KdTpNMeh5CmMkCH3JVWwtbpQw3yf8JpiepZv1hrgWEPpom6v4DIskdQUg2Rq4wcLarUhCtwaDKsVoa2acVg9yqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0I4bNZ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T0I4bNZ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3A51F000FF;
	Sun, 13 Sep 2026 17:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789320052;
	bh=SitOYg4KX34WdgfdWAgDEuxGFskL4Zw0LoKdr7C6qLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T0I4bNZ0lU2z+0pRgi2kqQ5RGY19yE+0NZxfCw6ZPWrUldqwvHIQxPsfygeY1zi6T
	 Zmd8dZuN87DAGVvWg3ZUZtMVDLVL+QyZOduxzb/WbQTzT+nSy9wy/IV6W9XcmBrg+C
	 gld1TieQ5GLSzV5Zscr9SulptuAfb9sFeFxpO0vPRgmIUf1Wh4ZtLw7xeWEiupodeS
	 pie19K5BIR5flOLp6+08VLXmo+hnpwS1vM06x/9kM5yQDGfXosLViGvajSUgfFGlc4
	 ZGFSo7CHkId5ISEmVrJOzp2pMbGvVpJWYumP0gyD7W/kcT9OH0TaZ2/r0mqx2nEaTY
	 wyGAEngJ4PL5Q==
Date: Sun, 13 Sep 2026 18:20:48 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 06/23] kbuild: only emit vmlinux relocations when required
Message-ID: <aqba1CW91zlM11Oa@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-6-5dc1ac01672d@kernel.org>
 <20260908211205.156371F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908211205.156371F00A3A@smtp.kernel.org>

+cc Nathan as you flagged in reply (will reply there separately also! Doing a
sashiko pass right now).

On Tue, Sep 08, 2026 at 09:12:04PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Inconsistent kallsyms data build failure on RISC-V due to missing --emit-relocs in temporary links.
> --
>
> commit 4ec1c86acad0eaa0b52dbb5d1c138c6e094e48d0
> Author: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> kbuild: only emit vmlinux relocations when required
>
> This commit modifies the kernel build process to only append the
> --emit-relocs parameter during the final vmlinux link. Symbol tables
> of trial links preceding it no longer receive this parameter, which
> reduces build time since GNU ld is slow at emitting relocation tables.
>
> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > index 970ca10f8fa90..09c5222ccb941 100755
> > --- a/scripts/link-vmlinux.sh
> > +++ b/scripts/link-vmlinux.sh
>
> [ ... ]
>
> > @@ -96,6 +97,11 @@ vmlinux_link()
> >  		ldflags="${ldflags} ${wl}--strip-debug"
> >  	fi
> >
> > +	# Only the final link actually requires the relocations.
> > +	if [ "${output}" = "${VMLINUX}" ] && [ -n "${LDFLAGS_vmlinux_relocs}" ]; then
> > +		ldflags="${ldflags} ${wl}${LDFLAGS_vmlinux_relocs}"
> > +	fi
> > +
>
> [Severity: Low]
> Does omitting --emit-relocs from the temporary links cause an "Inconsistent
> kallsyms data" build failure on RISC-V?
>
> On RISC-V, GNU ld disables linker relaxations when --emit-relocs is used.
>
> If the temporary .tmp_vmlinux* links in vmlinux_link() are built without
> --emit-relocs, they will be built with relaxations enabled. Because the
> final vmlinux link uses --emit-relocs, it is built with relaxations
> disabled.
>
> Can this difference alter instruction sizes and shift symbol addresses,
> causing the final System.map check against kallsyms symbols to fail?

This was checked empirically between --emit-relocs passed/not and confirmed
there was no change whatsoever with identical size and sizes.

The code doesn't do anything differently. So this claim is false.

>
> >  	if [ -n "${generate_map}" ];  then
> >  		ldflags="${ldflags} ${wl}-Map=vmlinux.map"
> >  	fi
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org?part=6

--
Cheers, Lorenzo
