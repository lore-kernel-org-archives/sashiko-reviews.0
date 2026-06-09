Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A142204F8B
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 01:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780967474; cv=none; b=FqO63ZoaM31VKGGYj1KJUETS6ADKlNBXGuDwjLHxPYbH/4OKfqz/6BddnvSfuUugAxHxHdqNoIpPVPs3w4nDE+EgBOBwXrN37kkWKZOlBLT/jMhrJTaiI1kX5Q0/XYQh0Xk82qG3fo3WNnYs/kVfzbJq1uCny1VpRUE/Jz6s1+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780967474; c=relaxed/simple;
	bh=1jz7/qkG3lrWiZdluW2aFDaEkMcBULnXLZ9CJoTYe04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fl9GzUMl6aLNR7NyfMmxiT+2Hf9bfgXGA87B7/EOC3ajRM0P1mbiOpQtpGeFUwLDnvJKToQfQ9CnqyQx9Nz0j8+18NaT2LP3YI0q0cHvKbnjDaPc2V9CMSeEgg8ts1VobK89T01gahPk0qskVnCY2Hmv66zfNSHYiEnhDyV0ihE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=XPPFJ/Vn; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="XPPFJ/Vn"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso2957029a91.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 18:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1780967472; x=1781572272; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w9UMbSloWWXL6syIQR0iA++Ln8+7B/8YZI838KDjHc4=;
        b=XPPFJ/VncTMBGX6PDvbbnA+FYJHIhNRHIOHfeS5FKQeMvr0ZA+Triwt4WFkh2z4NS5
         GJpkdJfq3cjHtXh9yULriLGkLYDEKEsLFRGGmIRyzQSfNrYnF82CQQQUsiEOG4HAJE3E
         cJwmlwtIhHs+X9bvgJu5rJ3hUq8wlxG1eF6Xp1Q+opVaZ5LNLN5Gk2pNKHm+vrAWI5g7
         5pIqUuTpx5rQm42zUIFkEbyQm3JD/KkiHCYDUg8Mw/s4Ej/IX24Qrh+6azILmG/i+tbr
         mawgfEoCkhDLIr+0diCHqolI55TOt/wRoC+cCiAf7Kc861aPz9CJa/DDhgz0eFVOklFB
         Tr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780967472; x=1781572272;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9UMbSloWWXL6syIQR0iA++Ln8+7B/8YZI838KDjHc4=;
        b=DD4krO/b6ZbunkX8VrT4iJoSiub3AtP9fkXboF1gMO4KD+mygvB6HPLNGSLgDcU+PX
         mkLvpcRGnOkK/G6vuTdeKm3Pvb33qOyN6d4NBa3CNiWG1+JXjSG8WVaChOluznq8L7Qy
         ziZl9RXKbbyngw1Swgye+7FeGnvpNjT0LU+YsKQlb0hrxgvqJtNnU5Z8rKOQlJu2LKHz
         N9bHkagPezfDycDolLQ+uSkc6t1dqwBYze71RUTPJoTB0dK3AurIv4Ev1b2lvdTyaZFz
         YajsPWSz4UXE/s1R5SAQvZpCqp0CJcpEecoG1ED0biYyjemcaFAZ7S9elaT3yEGTZ+we
         wRIQ==
X-Gm-Message-State: AOJu0Yz+cDik9POEh7qQ1JqvqyXuct3E3ErN7QEb2BDvXiWoDLDJHUMI
	AeY68VM5/smKQ8mqiHxCCiaRPoVFWQGeEEsGzxWYboDwHgjLHVXCgykUFOpcrYoWcePcJ3tHGBx
	ULo3PwfhK
X-Gm-Gg: Acq92OHYeMzZP2UhFj92/ERxT04aPlHa0lQelM3wAtfDNIwT6AjlfVrG8rIE/QBDPLC
	y7hMCywtjeZmKKOovMTk/7UxZ4lN6O8znPwr0nq4+Z6OWrcM5u7pqjhEcj/Ouq2NTfpASmdFNrh
	9m0ULAMAQU+7IOLnuobolQfuD3wJ65sMmhRchC4uDRWUP1uUIiVzEEilTx6rFPdiCabmTOB9oa1
	Xaj+BUOj9ehKJy65NDfCE4WA1r1FMIXkgQrRuAmYptCv22bM35RL9BOIR4NNCZqGRxJYhyfCxyW
	pyRcdgv9hcxuWz8wK/vVoCGb++dUXMNbFvFDQcy5jDygTw4tHa6+w62hlVxSPLsr+2ZTQE6UTLi
	VtN39NPUWD/BTCl9wqMlib5O4Q/GkSYncdz//NC+SAsIHYe3F6w03Fz+o/d5S4YEie4LwNIMq2E
	MOcL/qGzZM0CbuQ7c5
X-Received: by 2002:a17:90b:38cc:b0:36d:f28b:72e0 with SMTP id 98e67ed59e1d1-370ee92adfdmr19412890a91.12.1780967472421;
        Mon, 08 Jun 2026 18:11:12 -0700 (PDT)
Received: from p1 ([2607:fb91:1526:188d:d085:3143:4422:bc50])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6d013c9dsm17915041a91.8.2026.06.08.18.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:11:12 -0700 (PDT)
Date: Mon, 8 Jun 2026 18:11:10 -0700
From: Xiang Mei <xmei5@asu.edu>
To: sashiko-reviews@lists.linux.dev
Cc: tytso@mit.edu
Subject: Re: [PATCH ext4] ext4: fix out-of-bounds read in
 ext4_read_inline_dir()
Message-ID: <ngi53x7to5noqwatvmcakf2yl2o7ectaa6j346cxbtmzafo42r@57g2vrreekne>
References: <20260608210713.1940288-1-xmei5@asu.edu>
 <20260608232043.0D7DD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260608232043.0D7DD1F00893@smtp.kernel.org>

On Mon, Jun 08, 2026 at 11:20:42PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Low] The patch introduces calls to a hallucinated, undefined function `ext4_dir_rec_len()`, which will cause a compilation failure.

That's a valid macro. We have compiled and tested it.

> 
> Pre-existing issues:
> - [High] The newly added bounds check for `ctx->pos` in the main loop uses signed arithmetic, which allows it to be bypassed via integer underflow, leaving the preexisting slab-out-of-bounds read unpatched.

Good catch, we have sent a v2 resolving this issue.

Thanks,
Xiang
> --
> 
> commit 55b9111aac741d14a84fa1bd6c454a9d505ad753
> Author: Xiang Mei <xmei5@asu.edu>
> 
> ext4: fix out-of-bounds read in ext4_read_inline_dir()
> 
> This commit attempts to fix a slab-out-of-bounds read in getdents64 by
> adding bounds checks to ensure the dirent header lies within the inline_size
> payload before dereferencing it.
> 
> > diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
> > index caa51473207d7..5dd96c175c96e 100644
> > --- a/fs/ext4/inline.c
> > +++ b/fs/ext4/inline.c
> 
> [ ... ]
> 
> > @@ -1515,6 +1515,9 @@ int ext4_read_inline_dir(struct file *file,
> >  			/* for other entry, the real offset in
> >  			 * the buf has to be tuned accordingly.
> >  			 */
> > +			if (i - extra_offset + ext4_dir_rec_len(1, NULL) >
> > +			    inline_size)
> > +				break;
> 
> [Severity: Low]
> Does the function ext4_dir_rec_len() exist in the kernel tree?
> 
> It appears this might cause a build failure due to an implicit function
> declaration. Should this be using the existing EXT4_DIR_REC_LEN(1) macro
> instead?
> 
> [ ... ]
> 
> > @@ -1549,10 +1552,21 @@ int ext4_read_inline_dir(struct file *file,
> >  			continue;
> >  		}
> >  
> > +		/*
> > +		 * ctx->pos can be set to an arbitrary value via lseek(), and
> > +		 * the rescan above may also advance it.  Make sure the dirent
> > +		 * header lies within the inline_size payload before
> > +		 * dereferencing it: extra_offset only inflates the logical
> > +		 * position of "." and "..", the dirent itself always lives in
> > +		 * the kmalloc(inline_size) buffer.
> > +		 */
> > +		if (ctx->pos - extra_offset + ext4_dir_rec_len(1, NULL) >
> > +		    inline_size)
> > +			goto out;
> 
> [Severity: High]
> This is a pre-existing issue, but does this bounds check protect against
> small attacker-controlled offsets due to signed evaluation?
> 
> In ext4_read_inline_dir(), ctx->pos is an loff_t (a 64-bit signed integer).
> If ctx->pos is small (for example, 1) and extra_offset is a typical positive
> value (such as 20), the expression ctx->pos - extra_offset evaluates to a
> negative loff_t.
> 
> Because all operands in the bounds check are signed, the comparison is
> signed. A negative value evaluates as less than inline_size, causing the
> bounds check to pass incorrectly.
> 
> The subsequent calculation:
> 
>     de = (struct ext4_dir_entry_2 *)(dir_buf + ctx->pos - extra_offset);
> 
> will point before dir_buf. ext4_check_dir_entry() will then dereference this
> out-of-bounds pointer, causing a slab-out-of-bounds read.
> 
> This state is reachable if an ext4 image contains a directory with both
> EXT4_INODE_INDEX and inline data, where ext4_dx_readdir() fails (returning
> ERR_BAD_DX_DIR for example) after updating file->f_version, causing the
> rescan loop to be skipped.
> 
> >  		de = (struct ext4_dir_entry_2 *)
> >  			(dir_buf + ctx->pos - extra_offset);
> >  		if (ext4_check_dir_entry(inode, file, de, iloc.bh, dir_buf,
> > -					 extra_size, ctx->pos))
> > +					 inline_size, ctx->pos))
> >  			goto out;
> >  		if (le32_to_cpu(de->inode)) {
> >  			if (!dir_emit(ctx, de->name, de->name_len,
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260608210713.1940288-1-xmei5@asu.edu?part=1
