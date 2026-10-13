Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC1D5304A7
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914411; cv=none; b=r+6aY/mdm/Z6i0urBItXKAmxE+8zxW5hg5itmYno2dzlzktgY+yrjIdU9t3xu6X9eXEAOAM1iTdIkqr3Q5R0EKbO/XovLWYZeDAQKPwWY8bfCDCjHrdJJbpJhC7NMNlNVR0+EfiYKHYP4RDd5b4IwgugamtnxQyZb6O1zhTJmuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914411; c=relaxed/simple;
	bh=nbgDcnVzZy5v+9x+VotHTcVXQOcWBOh+8O66h1RlO+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDNOuqCqrM5ug2SIu3hmmd6erbdZ8V/ncSkCexWnsVrpn/UpDoIjon3q+BUpBS/ORybeN7g4AeAh86eCjfXL0mJ6xUBPUbgNYTlToE1Owz4lX+2YSjTGme8ZKtdxNE1t8PYT9g9B3YHz6EXIgSeewSAHLiipb03o0hNh/nsnp+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9a7n9OY; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9a7n9OY"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67687f279b3so2646059d50.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 11:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791914409; x=1792519209; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9AuHP9q1EYZ5Uls4Fabp/S6p+sv4isxWlypix7WhUQ=;
        b=s9a7n9OYtCTxZ5hsdgsq73Wfzsd7j2VLlAoinyNGV+gWHLNCSkXTFdrMlA8TWID4jb
         lZa/4GYBAN8qeRQOilKMoJFjonHT6t5H05iupDtGMT8wMIVvex9mwZHqWBvAH/AUEURY
         y5eKIXW/sJUtOcvHfdf+LcP7kDgDUSLmi1Fan4F9zbkvz5SQDp7HPtHxyCjbsc2hRN5Z
         lkbaLL2//F/fIFyQc0nqSbRfDsepw1Dw+r2W27F9Kxw5JF95hah+77OVtCdYFdiQfMq/
         Wa5TuMmg7ikRniQLMbAtxRDiimL0ldatUYRUI+1YdaWTQ86RskizLV6QVnwgItRLZBFI
         er+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914409; x=1792519209;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h9AuHP9q1EYZ5Uls4Fabp/S6p+sv4isxWlypix7WhUQ=;
        b=0oGNwxUtpF9vF+VDctPX40GDfOIc+GYVEM3cftCcvZH7azXLmLi5vZDIU+I/BKJ3WJ
         kGYYpeq9134t751IAq9L4vtsRKfQbjewp1zFoLVusJS7eNLzT1mzD7LpQElYlRSaZNuN
         LHG3hWfX5Zg6UUQRpbh+fClbbSbY9Vn53MleMxrDlnGLzUTlau0DfqPgcKJw+dS7LNAj
         RDoxbVhy1BEfyp9DEHIWWVvg4HOj44aZ8uysJhDAl7ecHE4ac6gxbrdsUDgGslntPdas
         du+P79lyF0IItMJlr0z5qw3aDypqfyLMDV4o3M+8MB3IhwMx/39Wi4gQC27Ifc4OW7Vy
         oMTw==
X-Gm-Message-State: AFq9FYK7hufAyKHtu/YqLX5ok8imYxh/e03tQtE165PWSxyaDv/KmIib
	5BH/iBDlQyfFqykHHsQsX4Oj48KPw+K7Uu6W4IsWo8CcFkWULR2UxABMKZcJkg==
X-Gm-Gg: AYBFou2kQHtFryOo03nBmZ4NZzu0cS1ni1EZ/omTLMVenBm90tSHnHAh0C8zM3dERB0
	rjAqc3zH69fExzFlrIjDvSGlxtPOCYHazFTaeHkmgudE1Ww4OTy36KyrLDLHu9h5gD1iqtjOIVy
	mxMKqfIbCJej+VVqimSfSvGltBqO/s7Wjn67/ZILdZKj55HiNMjPiqYDe4gL+jnu8HaHv0wdRFP
	E3iUv5RAJ4+ZQvuR9eDoay/T5IFx6EUgMhADzuga/yMgPLOBYV93WQRijicVZsz+wpAe+YRyrhw
	XOSsxeFd+6MHbXkxFWRjZxU+vmG+BOFy22JDKtpzTBlbf+Uwffsi59nTq+UwooIRWib121ZakWx
	hf7H+ENuEZgfsDvjiBcM0dabWx/CEIb/JIJD+/u1QE7hc/YIFQvBfMaZvZecqEohiApjC4yQDlc
	noAVmARfH7bhVWxrKh4NP/QlYSiZmrkQGoSb8A8XuV0glKJRs/TPYhiJEqoEjO/xVC/Et7yt0=
X-Received: by 2002:a05:690e:1183:b0:672:ede8:d1f4 with SMTP id 956f58d0204a3-67936062f7cmr4971148d50.62.1791914409230;
        Tue, 13 Oct 2026 11:00:09 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:d326:f863:5ae3:683])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67986a15c13sm145635d50.7.2026.10.13.11.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:00:08 -0700 (PDT)
Date: Tue, 13 Oct 2026 14:00:07 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 05/11] bpf: add a path ancestor iterator
Message-ID: <as5w8lY-3Z6sVlxe@zenbox>
References: <20261013164800.2906577-1-utilityemal77@gmail.com>
 <20261013164800.2906577-6-utilityemal77@gmail.com>
 <sashiko-outbox-170194@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-170194@kernel.org>

On Tue, Oct 13, 2026 at 05:11:54PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] bpf: deadlock in bpf_iter_path_ancestors_next due to GFP_KERNEL under VFS locks
> --
> 
> commit 0d24b2f0561971ff2a9d89456692d9ec1ea13279
> Author: Justin Suess <utilityemal77@gmail.com>
> 
> bpf: add a path ancestor iterator
> 
> This commit introduces a sleepable BPF iterator for evaluating a path's
> ancestry using the stepwise vfs_walk_ancestors() engine. It adds kfuncs
> to manage the iterator and hands each position to the program as an
> acquired reference by allocating a copy of the path structure.
> 
> > diff --git a/fs/bpf_fs_kfuncs.c b/fs/bpf_fs_kfuncs.c
> > index 08f0847c49708..02398f5a46d5a 100644
> > --- a/fs/bpf_fs_kfuncs.c
> > +++ b/fs/bpf_fs_kfuncs.c
> [ ... ]
> > +__bpf_kfunc struct path *
> > +bpf_iter_path_ancestors_next(struct bpf_iter_path_ancestors *it)
> > +{
> > +	struct bpf_path_ancestors_kern *kit = (void *)it;
> > +	struct path *pos = bpf_path_ancestors_step(kit);
> > +	struct path *held;
> > +
> > +	if (!pos)
> > +		return NULL;
> > +	/*
> > +	 * The position must outlive the walk's own view of it, so it gets a
> > +	 * reference and a struct path of its own to live in: struct path is
> > +	 * a value type, with nothing a BPF reference could be taken on
> > +	 * otherwise.  Sleepable, so no atomic allocation.
> > +	 */
> > +	held = kmalloc_obj(*held);
> 
> [Severity: High]
> Can this allocation cause a deadlock if the iterator is used from a sleepable
> LSM hook?
> 
> If a sleepable BPF LSM program is attached to a hook like
> security_inode_setattr or security_inode_unlink, it is called by the VFS
> with the inode's i_rwsem held. 
> 
> The kmalloc_obj() macro appears to default to GFP_KERNEL allocations, which
> includes the __GFP_FS flag. Under memory pressure, this could trigger direct
> memory reclaim.
> 
> If reclaim attempts to write back dirty pages or shrink the dcache/icache,
> it might try to acquire the same i_rwsem, resulting in a deadlock.
>
Direct reclaim never takes i_rwsem. So this is incorrect.

(Also if that were the case, the mkdir selftest would splat with lockdep)

Justin
> > +	if (!held) {
> > +		kit->step = -ENOMEM;
> > +		return NULL;
> > +	}
> > +	*held = *pos;
> > +	path_get(held);
> > +	return held;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261013164800.2906577-1-utilityemal77@gmail.com?part=5
