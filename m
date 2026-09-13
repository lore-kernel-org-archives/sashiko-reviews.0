Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF43937756A
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789321668; cv=none; b=UTUU2mjWBpSiCUvUyKqySw6HGWKcwbDl3nEejZoQHS3vh8eKeimw8px41h0W+YuQEwdqWo6fOZ0oLvSKXmBWZy4SmXzQFTWaIR1fZMRUx2StxmDp6ft7e7Mbaz34qbw4sE6LX/jZWrC5em6ORxrLjSfSzJLF3jcYbdNpXHLjIgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789321668; c=relaxed/simple;
	bh=+KZNhtbWhjPZFlJf5CfwTfh8NVgy39aJCYvIuByXp2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qOoYyG6iYERJuy9Dr2LLuW2EfEHgrhXC8ihPzJOsR0ry6yVPDDRfRvIGmMMJlll8x8jGhmlBCfKWkolNK8oLuz+0eUIq9JXoMrleqNNQPPhTrRno47/jkdss5C4HPsR9Q7RF7y0gECNYYMKuzERkPMUzhFbeagmZUVZHfyXOebI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VWrY8gnF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VWrY8gnF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADE71F000FF;
	Sun, 13 Sep 2026 17:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789321667;
	bh=n92V8tmk44Rq2lo491Cy/FALKz/xnK0fy0/Lewv97cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VWrY8gnFghxJuSVF05BjOeyX8N9Cw20uA+gN+U2Tspo3aZzSgTgwqB8INrSS3vGQv
	 lq5XPJPVym/s+AjNKrWI2HG1Eqm6kckayImuqW56E91v1zLFapd2jupHHVWt8hn9LZ
	 9qoZkbdqazjHISxq4Sd0qcx23oV9RvuUcPobmmRIBumYmfOMYFJEoqbZTfzdnXJ/mZ
	 Q+EdAmgRGlTlXeLOJW97GbjMU/3YCvpRUUFoT8+iytB/Z+XLT60z4JpMidI4K4CTLH
	 GnxWG3R/HWEqSGT+7pW8BvTGwYZvwSw+vK1i157ACGELYIlZDUvHhGJ3iC7yZuyNqy
	 eEAbeCxAa39qA==
Date: Sun, 13 Sep 2026 18:47:43 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org
Subject: Re: [PATCH 11/23] kbuild: implement and use depcheck to check
 dependency timestamps
Message-ID: <aqbhbsQlABUwKgh0@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-11-5dc1ac01672d@kernel.org>
 <20260908211038.2846F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908211038.2846F1F00A3A@smtp.kernel.org>

On Tue, Sep 08, 2026 at 09:10:37PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing return value check on `fwrite()` allows silent data corruption of the generated makefile fragment.
> - [Medium] Use of `st.st_mtim` breaks host tool compilation on non-Linux platforms (e.g., macOS) where the member is named `st_mtimespec`.
> --
>
> commit 6f34a9bb88096e341033a46a588226f8854a9a98
> Author: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> kbuild: implement and use depcheck to check dependency timestamps
>
> This commit implements scripts/basic/depcheck in C to speed up checking
> dependency timestamps for .cmd files. It reduces the work make has to do
> by generating fragments with only the saved command line for targets
> that are already up-to-date.
>
> > diff --git a/scripts/basic/depcheck.c b/scripts/basic/depcheck.c
> > new file mode 100644
> > index 0000000000000..5f9bbdff88032
> > --- /dev/null
> > +++ b/scripts/basic/depcheck.c
> [ ... ]
> > +static const struct dep *lookup_dep(const char *path)
> > +{
> [ ... ]
> > +	dep->exists = !stat(path, &st);
> > +	if (dep->exists)
> > +		dep->mtime = st.st_mtim;
>
> [Severity: Medium]
> Could accessing st.st_mtim directly break host tool compilation on non-Linux
> platforms? On systems like macOS, the member is typically named st_mtimespec
> instead of st_mtim, which might cause the build of depcheck to fail at the
> very beginning when cross-compiling the kernel.

Silly :)

It's a POSIX requirement.

>
> [ ... ]
> > +static bool target_is_fresh(const char *cmd_path, const char *buf, size_t len,
> > +			    size_t *deps_off)
> > +{
> [ ... ]
> > +	return deps_are_fresh(list, buf + len, &st.st_mtim);
> > +}
>
> [Severity: Medium]
> This shares the same st.st_mtim portability concern as lookup_dep() above.

Nothing compares at nanosecond ersolution.

>
> [ ... ]
> > +static void write_without_deps(FILE *out, const char *buf, size_t len,
> > +			       size_t deps_off)
> > +{
> > +	const size_t tail_off = deps_block_end(buf, len, deps_off);
> > +
> > +	fwrite(buf, 1, deps_off, out);
> > +	fputc('\n', out);
> > +	fwrite(buf + tail_off, 1, len - tail_off, out);
> > +}
>
> [Severity: High]
> Are we missing a return value check for fwrite() here? If the tool runs out
> of disk space or hits a quota limit while writing the .depcheck.mk.tmp
> fragment, this could fail silently.
>
> If the generated makefile fragment has silent data corruption, the build
> system might use incomplete dependency lists. Could this lead to the kernel
> being built from stale object files, potentially resulting in unpredictable
> runtime issues?
>
> [ ... ]
> > +int main(int argc, char **argv)
> > +{
> [ ... ]
> > +	for (i = 2; i < argc; i++)
> > +		process(out, argv[i]);
> > +
> > +	if (fclose(out) || rename(tmp_path, argv[1])) {
> > +		perror(argv[1]);
> > +		unlink(tmp_path);
> > +		return 1;
> > +	}
> > +
> > +	return 0;
> > +}
>
> [Severity: High]
> Is relying on fclose() sufficient to catch the earlier fwrite() errors in
> write_without_deps()?
>
> If a previous write failed (setting the stream's error indicator), fclose()
> does not necessarily return EOF if its final buffer flush succeeds or does
> no work. This could allow the program to exit successfully (0), masking the
> earlier write failures entirely.

There are valid, will fix to reflect the changes already in fixdep + kallsyms.

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org?part=11

--
Cheers, Lorenzo
