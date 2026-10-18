Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9373A784A
	for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342063; cv=none; b=QoAeu5YsPqdBIdeXzHegkPjIGE4i7lgQeFBJd0sTvtc206FpH5rldtpqsA+BV64J574+ow2eilWNEfjMfQH+HHKBu6WEhFFP8HVq6b8L5ncVKuaTQ42sovUFdsBTeCo3YcynkSPcjXWzddmdq6l9Q+T1FwN6YP8ZQW2D8OXHN/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342063; c=relaxed/simple;
	bh=F4gfl0+YMk4ioGpONVD79EZfw8vpMfcktCDSQJ6061I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJ7mmIGkHu0SJwhB/A6fmO6a8SL9/rNTbOCRqoxIhxUeAS/vsJip2SbAbjY6r9EGj+qvRsX8Ozj8gOGS8GwjubzPUvo7POdNrXQ5Ci0wP1kjmzl7HOSpTqFMQNFV4w7rsJ4mdzlPVOKillvOVauPG+N+DmOdDe1+85gDv67OthE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0HaZ41x; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0HaZ41x"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e00eee27dso639756f8f.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 09:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792342061; x=1792946861; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EnjrROwlUYtLbg1DZjsxtXuCk8E0M6SVTV0/eLvG49o=;
        b=L0HaZ41xKVxbVjBrJDu1i/+kdh5xyjO32y4VM0hKPW7024Y04fxXK4dOA0BnBdSlT1
         IGppcH4L0vAChE/x8EhBdIbzDNsASlGzt9MYpjKRqN5GCm4+sw4fdNEdsGKUu2zEQd5y
         4X9H955xL3N01/xmH5EEVPnSJ62BFSqG4Of2m+BrrjHuh3I3OYB4zT8n6YSYrBpmstv5
         9s0Aa7zFn6nI3GhEMZePCm5N+q78eDQdfVToYN8TlQZzJlx3VJtRz3eDKNM12DSyV6PW
         nMQpWcUthr0rbXLg85gAoZy9rZ6l5/+Ld7cZZ4SPJbl5p+jwryOQHS4ycz4RO1l8NVGZ
         CovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792342061; x=1792946861;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnjrROwlUYtLbg1DZjsxtXuCk8E0M6SVTV0/eLvG49o=;
        b=EFkkXBFdQYNTv7ZtP8LyH9vHdgbcOzKCa9XKyjmocC6TB3WCGBdLVzcFtqk6u+RAcp
         sdNx0lziOyVUilOg+mnodhzGir4MvGsh67SGWoqitOM7CUKxE2TutAGb7mEOtkkb4ORO
         9q5xnr4D4eLKyqRUSwY9kuogE/GE18bL1vzr9A3mHDWaniQirCJHHpQI4CxEh9GOW5s1
         oTXx2E21+gfjy+3bEU6b3g4pHhwPtsOZuXDl1RHh1NJj9idjZggsjuHIvOQVQzqKYHkg
         i/Zene/oZSmoHJGFG7Kng07MFQZqbmIprfsfAine6d2hXlYTkUal//n13Kdw3B8TPUT1
         ii9g==
X-Gm-Message-State: AFq9FYL+hvL4YBwpo+dBg+S4hr83jVTyfxEEI9kM472+8uXy5yTIycvv
	NsSwAnzmRWF6Dzriu3uYzBTIIcpFVk9j2Y7jYtqcrQ6cxIV5u9eC1rQJ
X-Gm-Gg: AYBFou38MuMN+uCJEkyVMiYiw78wRN59Dup1lmdC2usZHnsSq/fZue9uOzAY2AxNFJv
	Bm7F1CDjfXS8XBZp4On0d/REHp2FawAiaj9JVbv98+/e3wch9HU4sZeW+eJ6xUf8k0aJ8BdRBD0
	9szdH8ZCDftdSqiEfJ3sYXgkh+lc18G2O40ST4HvRKeE40P4N5JCYtbZNAQKpit3ytsYcKhQzzG
	O4u2X3Umq2alSWwux13PkHZExEmmcGhZSusX8hnn0ICvYxJWNARtnAUuLj7jTW9kMJ766A9moRG
	hS9bKUdgn3+EF9FZga6Eob8OEY4lBFatHHsd0JG5Zlmog8mzInwb/X9IRBq3YsTgKbX//7MdKvv
	gmz8gsFMRBj6SrMg8yQLVI7lPz+fqfLHVUSTp+TOoBso9pWUT0FaI1JvLOqtoPEgkM2Q0tjZ1Eh
	mIh7mO9XLEIvtniFwdiNFDkPHpOBX+shCbMHG9pCUJ60ACMHHpdcXOsvpfbt5J7olbKYgpXG6iG
	UZ52zfw8UlrC4izJs1BhFmBuaxz7tpcO+E=
X-Received: by 2002:a05:6000:654:b0:48c:557d:ab24 with SMTP id ffacd0b85a97d-48e079800d3mr8049235f8f.4.1792342060574;
        Sun, 18 Oct 2026 09:47:40 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503d78sm17256266f8f.50.2026.10.18.09.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:47:40 -0700 (PDT)
Date: Sun, 18 Oct 2026 17:47:38 +0100
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Andrew Morton"
 <akpm@linux-foundation.org>, "Petr Mladek" <pmladek@suse.com>, "Kees Cook"
 <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, "Jim
 Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH 14/15] kallsyms: scripts/kallsyms: Reduce the output
 file size
Message-ID: <20261018174738.79ae97b3@pumpkin>
In-Reply-To: <sashiko-outbox-176260@kernel.org>
References: <20261018155206.132411-1-david.laight.linux@gmail.com>
	<20261018155206.132411-15-david.laight.linux@gmail.com>
	<sashiko-outbox-176260@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Oct 2026 16:05:41 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] kallsyms: NULL dereference and offset mismatch in write_src() on unused tokens
> --
> 
> commit 20102d6e3b81d88a59f6ac3b9732c8a7b28d3f98
> Author: David Laight <david.laight.linux@gmail.com>
> 
> kallsyms: scripts/kallsyms: Reduce the output file size
> 
> This commit reduces the size of the assembly output generated by
> scripts/kallsyms by formatting byte values in decimal, packing multiple
> values per line for kallsyms_token_index and kallsyms_markers, moving the
> token tables first, and replacing duplicate symbol name comments with
> symbol offsets.
> 
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 189fb50ec8c58..8576fe6ad90b7 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c
> > @@ -350,6 +350,30 @@ static void write_src(void)
> >  	struct sym_entry *se;
> >  
> >  	printf("\t.section .rodata, \"a\"\n");
> > +	printf("\n");
> > +
> > +	output_label("kallsyms_token_table");
> > +	off = 0;
> > +	for (i = 0; i < 256; i++) {
> > +		best_idx[i] = off;
> > +		off += token_table[i].len + 1;
> > +		printf("\t.asciz\t\"%s\"\t/* %u: %u */\n",
> > +		       token_table[i].str, i, token_table[i].refs);
> > +	}  
> 
> [Severity: High]
> Can token_table[i].str be NULL here when fewer than 256 tokens are
> populated?

This is the same issue it found earlier in patch 11.

David

> 
> During pass 0 of a CONFIG_KALLSYMS=y build, scripts/link-vmlinux.sh runs
> scripts/kallsyms on an empty symbol file:
> 
> scripts/link-vmlinux.sh:kallsyms_step() {
>     ...
>     if is_enabled CONFIG_KALLSYMS; then
>         true > .tmp_vmlinux0.syms
>         kallsyms .tmp_vmlinux0.syms .tmp_vmlinux0.kallsyms
>     fi
>     ...
> }
> 
> When symbol_cnt is 0 (or whenever the input symbols do not populate all
> 256 entries), insert_real_symbols_in_table() leaves token_table[i].str as
> NULL and token_table[i].len as 0 for unreferenced tokens:
> 
> scripts/kallsyms.c:insert_real_symbols_in_table() {
>     ...
>     for (i = 0; i <= 255; i++) {
>         if (!token_table[i].refs)
>             continue;
>         token_table[i].len = 1;
>         token_table[i].str = xmalloc(2);
>         token_table[i].str[0] = i;
>         token_table[i].str[1] = 0;
>     }
> }
> 
> In optimize_result(), find_best_token() then returns -1 and breaks out of
> the loop before filling the remaining unused tokens.
> 
> When write_src() passes token_table[i].str to printf("%s"), isn't that
> undefined behavior that segfaults on non-glibc hosts (such as musl)? Also,
> on glibc hosts where printf("%s", NULL) outputs "(null)" (7 bytes
> including the NUL terminator in .asciz), off is only incremented by
> token_table[i].len + 1 (1 byte), which mismatches the actual size emitted
> into kallsyms_token_table and corrupts the offsets recorded in best_idx[].
> 
> [ ... ]
> 

