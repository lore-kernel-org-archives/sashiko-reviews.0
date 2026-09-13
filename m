Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CA837F739
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 18:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325639; cv=none; b=GLi0z0wEP+MgNhpU5bqs+GHUMmDd/Lzp5jGBIXBuStqOhEeO5523yULHk2kbzXtWKnpu1A213TRjOdEZ5ZJNDZ9O46kWNjg5nYfABoASUcYDCLbxzYeQoaZOxMKTZo7acKe2WjdhiHQqlXKI8T/x4IZgs6KJ1RjYgLF9gmsYR7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325639; c=relaxed/simple;
	bh=cspXqsK3LBEcSLPx3r/LoD1F3/ClCRUOn01Su4W/Djg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PjnuOsKRKQt5fbQ/DSkfMd2i75T80uh9+1oQVcoWCLE2brbmEEEv7du8mE38IqkRpKrwKZADL+8ED4p7uCz8En0wFkyedLRIFVS+mLxgzToZlaSluYqTvqD+YrI+EjCjYApQqq0S/jpwWf8iZ1EYm0Ly2UDNRC4d8znqUeQOZt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ls39EpMV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ls39EpMV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AD61F000FF;
	Sun, 13 Sep 2026 18:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789325637;
	bh=yU+L/gZMWMi51NQLonplXoQL5Bd2NfJB7Hbi7XmOuW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ls39EpMVsSGhTnBqFZ2xIdZhsYaW9ncz5rC0L232MCPOF1P5ZoMsaD1fuaDHrNJBd
	 wxzG8XYHHaqACp8znlqDdP/J2bVh1huTmpIEpHIQuF3XFX/xvcL/e6CL8gCLPHRylU
	 izL6gRQoLdivjSUThTzexc8/yk44Megkqj+ESbQmfnmm5zyFc3IRqUmuB1WSHQGmFX
	 jGFifoPZmP/u7Mck1hW+OsY+W8P4IJy79d732EVI21sa5KLqCJ+B5vHql9ruBKGSmm
	 xSiUQknVEh9FR2Cpe3T4J7DoesGENLGsKkwdlJp/B2jj0OG2+CKh7sOlkUIj9FS5gQ
	 ldBGTnZ/mU12w==
Date: Sun, 13 Sep 2026 19:53:54 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org
Subject: Re: [PATCH 19/23] objtool: decode instructions and resolve branch
 targets in parallel
Message-ID: <aqbwY8ojsKtkRqoq@gremlin>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-19-5dc1ac01672d@kernel.org>
 <20260908212532.90D9A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908212532.90D9A1F00A3A@smtp.kernel.org>

On Tue, Sep 08, 2026 at 09:25:32PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Concurrent list_add() on shared pv_ops list heads and symbol nodes corrupts doubly-linked lists.
> - [Medium] Concurrent unsynchronized writes and read-modify-writes to elf->changed and sec->_changed boolean flags during threaded passes.
> - [Medium] Dynamically allocated `insn_hash` is not freed, leaking up to 32 MiB.
> - [Low] Memory leak of `decode_ranges` array on `realloc` failure and early error returns.
> --
>
> commit 979675b19c505e12e7330b836dbf233b74331260
> Author: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> objtool: decode instructions and resolve branch targets in parallel
>
> This commit introduces multi-threading to objtool for decoding
> instructions and resolving branch targets to speed up the kernel build.
> It sizes the instruction hash based on the text size and limits thread
> creation to objects with 8 MiB or more of text. The decoding and branch
> passes are threaded using a map-reduce fashion over split ranges of the
> objtool file.
>
> > diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> > index 2abd41cc3aaf7..b092cf8d582f7 100644
> > --- a/tools/objtool/check.c
> > +++ b/tools/objtool/check.c
>
> [ ... ]
>
> > +static int alloc_insn_hash(struct objtool_file *file, unsigned long text_size)
> > +{
> > +	const unsigned long nr_buckets = text_size / INSN_HASH_BYTES_PER_BUCKET;
> > +	const int bits = ilog2(nr_buckets);
> > +
> > +	file->insn_hash_bits = max(INSN_HASH_MIN_BITS, bits);
> > +	file->insn_hash = calloc(1UL << file->insn_hash_bits,
> > +				 sizeof(*file->insn_hash));
>
> [Severity: Medium]
> Since the statically allocated hash table is replaced with a dynamically
> allocated array here, does this memory need to be freed? It looks like
> free_insns() was not updated to free file->insn_hash, which might leak up
> to 32 MiB of memory during objtool execution.

Yup fixed for v2.

>
> [ ... ]
>
> > +static int decode_range(struct objtool_file *file, struct insn_range *range)
> > +{
> > +	struct instruction *insn = NULL;
> > +	struct section *sec = range->sec;
> > +	unsigned long offset;
> > +	u8 prev_len = 0;
> > +
> > +	for (offset = range->start; offset < range->end; offset += insn->len) {
> > +		const unsigned long remaining = sec_size(sec) - offset;
> > +
> > +		insn = next_insn_slot(insn);
> > +		if (!insn)
> > +			return -1;
> > +
> > +		INIT_LIST_HEAD(&insn->call_node);
> > +		insn->sec = sec;
> > +		insn->offset = offset;
> > +		insn->prev_len = prev_len;
> > +
> > +		if (arch_decode_instruction(file, sec, offset, remaining, insn))
> > +			return -1;
>
> [Severity: High]
> Can this concurrent decoding corrupt doubly-linked lists? During the
> threaded pass on x86_64, arch_decode_instruction() calls objtool_pv_add().
> Because range->shadow shallow-copies the file structure, all threads share
> the identical f->pv_ops array and func symbols. The concurrent calls to
> list_add(&func->pv_target, &f->pv_ops[idx].targets) appear to have no
> locking.

Yes, valid, and ThreadSanitizer found more. Fixed in v2.

>
> [ ... ]
>
> > +static int add_decode_range(struct section *sec, unsigned long start,
> > +			    unsigned long end)
> > +{
> > +	const size_t size = (nr_decode_ranges + 1) * sizeof(*decode_ranges);
> > +	struct insn_range *range;
> > +
> > +	decode_ranges = realloc(decode_ranges, size);
> > +	if (!decode_ranges) {
> > +		ERROR_GLIBC("realloc");
> > +		return -1;
> > +	}
>
> [Severity: Low]
> If realloc() fails here, it returns NULL and overwrites the decode_ranges
> pointer. Does this permanently leak the previously allocated memory for the
> array?

Nope, that failure results in objtool exiting so nothing leaks.

>
> [ ... ]
>
> > +static int add_call_destinations_range(struct objtool_file *file,
> > +				       struct insn_range *range)
> > +{
> > +	struct instruction *insn;
> > +
> > +	range_for_each_insn(file, range, insn) {
> > +		if (add_call_destination(file, insn))
> > +			return -1;
> > +	}
> > +
> > +	return 0;
> > +}
>
> [Severity: Medium]
> Does this threaded pass risk a data race on boolean flags? If a thread
> needs to patch an instruction (like removing KCOV from noinstr),
> add_call_destination() eventually calls set_reloc_type() and
> mark_sec_changed(). This executes:
>
> elf->changed |= changed;
> sec->_changed = changed;
>
> Since elf and sec pointers are shared across all shadow copies, multiple
> threads might perform these bitwise operations and assignments concurrently
> without atomics, potentially losing flag updates.

It's not something that would have any impact.

>
> [ ... ]
>
> > @@ -2689,6 +3080,8 @@ int decode_file(struct objtool_file *file)
> >  	if (read_annotate(file, __annotate_late))
> >  		return -1;
> >
> > +	free_decode_ranges();
> > +
> >  	return 0;
> >  }
>
> [Severity: Low]
> If any analysis pass in decode_file() fails and returns early before reaching
> this point, does it bypass the call to free_decode_ranges(), leaking the
> decode_ranges array?

Nope, every early return is an error path that exits objtool so nonsense.

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org?part=19

--
Cheers, Lorenzo
