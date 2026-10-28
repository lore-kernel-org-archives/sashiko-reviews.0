Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793229741;
	b=S9CubL9s93XXTWhnDMF5Gbw3C+mWlhex1C4OQMOn84ZVl18OVcELTzitjLww9O/++gRT
	 rYDC7hcRiYmTXz+OIua8SVnkg/nIy6O920QSmI06omvDjVpcj19YUMZOOVeOFlf2v3qYL
	 wp0t13yp4Ng+VvxX3iw4Y/ynMtwN6uEFu1wiLevj15O9J3t0MpvybX1/TkHTIbgoyepb7
	 czGrc/eTNgYJ2gPYsEB6X27AzLLOCoaMxLc64AEV4HsRnxDgMgLocqTqqoe18FDrk/+vA
	 Q2R3Vuro0dQ3+xiIfoyLVMmcNn/sX8LHmILWMbIs2iZwwUBVz9921TIeN36hx4hwV2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793229741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ErACdD6wnsCj5BI4BkkTwpFvg1ap5ibaSYHTkZSlAoQ=;
	b=n/A4JyPFTm3SzxvAS4T79bFnAuK9l1tJpq/dKwhprTIOas/JAMyzlJcrUhZP3RosPRrF
	 +7Nv+ztLubZ2PMe2QlSvokYOm+K+xTS2q/C5sYeGY5JrS7ZbXKYDEDxsLZkcgDfD5yUJf
	 vU8qYGiQW/Jv98dID3bUjvMIR4XoJbUGAotyDs33h9gOIMbVKhg/Vi8HU1k9UksMyZ1Xq
	 KZZkJ3QYQwURb8E0TnYFqQVNCcH6lq8Jnyr8lSgYIcZWGKNzgPCgirmNmAiL2Aub1WiT2
	 xguN/J/RXj1drz1bcetIKlg7yB8MALvrVBSrJSewVXZc/UYk4mGG+pByMjFuwkqfOrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iFt+qhSC;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E71A606A31A
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 23:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E71A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iFt+qhSC
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06c60065fso1230243b3a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 16:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793229741; x=1793834541; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ErACdD6wnsCj5BI4BkkTwpFvg1ap5ibaSYHTkZSlAoQ=;
        b=iFt+qhSCluiBJURpnDITt9Uvg/sjd5/nTDeU66J1pFeov7GXsz1n/Rpbrmsv36UujQ
         h5vMpYPF2Hu0j7THIHCyiGTm9CFySO4qXj1oixp3pI4ljZ7iEGzlKxg2ETK4ShH66kcc
         SJ5uCLvhet8ObNpA9qa6olUKgBpDdRjb9kK+CFUVyTF3roM+zUC2QodRAB3hUvijTWet
         XidEJiYIfpDKPkEamqDKil9AZbGYLHBTna2dOjTI6lLrRuwru6kA+M216ZLcKAIc5QRo
         2TI4p8Q0vAKn+VYYCnxKch0Zx8jsSaTjtkuBDVwUYPNM0hAv4U3BIIe6xa+jHf18RGAn
         qjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793229741; x=1793834541;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ErACdD6wnsCj5BI4BkkTwpFvg1ap5ibaSYHTkZSlAoQ=;
        b=mYc0z8OgJ+9T48klaTm7xJ1gcWWd3xrPTJOEeIOBLZ8YNlC4KxiAEQShBu9gPPedrv
         4jJ35Rb7pZz/atp/9AlSSkrzNGXbJ166HuPYqlm2iqyFTnggD1C1OYM6FFYe/y4zZTEQ
         Zw6rr+rWli1bzL+QZn0ga6z7nAa4E+CrK+LYy+SYqCNS779syHzPnsL+ifwSdG+EZW96
         o/fHzcmN+vgtzvcv/Wit4c26W2Omf7a+F/gYqHwVuVrPkKUMMMjAQT0jgovhbCf9tRaK
         PCeE54EJKOe9wIwPpGim5jsg1LCNGgRBjvncniIJO44GUP/oQNU7iCeW/MDoTFFJAeIP
         9K2A==
X-Gm-Message-State: AFq9FYJyBAB5AbAyHOJ2KhvaCpi3opHT5aVsqfcqeGgqxt2TEH50mkkt
	6CfXpvKJWXKQVu0ScZIeeIWM9nhJxLP31sz+WauZxUwnFJ6gvbcbqCDP3U7mFGXFe+IcTnNo1Zk
	qBOJcf8oM
X-Gm-Gg: AYBFou2gieDqaZmE3bdBk+GgU+P+bm0PAK0ilpFK/C52idIiXjW32mzKPT9KrfXG4z3
	Oxkuql55sGk3q1BCNb3RutCWvYUXK7PnLiw1GI++Y0T07zjRxsyYdBxijVJeDAF8i69aatFrkCo
	Qip+p+WRZc2Aujxr4uTHW6e7IEOaqMlhxtshnU+2y2L0thvIEBGmN+RB1SpnU5JBXalZJWti2/7
	3y2/SQzrHlpMaNoDgKscwemdpN1Ln4WkdHgTz0NEa4i989SznBgHYo2yVQjHRZr4pW4k0AiTrNv
	mrQRm6NbA+075DKKly5/qr+s/nDtAHKX98aK+/OrpU9NA9tLvswsVhR0D8TWhY3/or2uacofes/
	C2xFCc19QKYVFnNz7yyNRb2hjWzmwAQla2pPZWbouYH+LzH6w+gsNgeT42x57wAMqQRZj+QZbg3
	bcMK1pA+lPN1EB5AjHk0QYtbLjBnwCNJkmwsY1KpFhl6eGvc1N3XuZ4bN4i2jajcVA/5kxWPikx
	Vz7WDnTJe78ApPBq606xRM2awvmvjfKVUGPNn1jT1WxXf+5iedf5P54CjmCBI/xZRpoUpMYCgng
	HXqhdUfdvOXH3QzH9YBtOgFB0YH0CfoUxQhK3HZX7verTtQLOTY9KhoK9hz+NtsGjQZnnrNf
X-Received: by 2002:a17:90b:1b0f:b0:3a4:967c:6947 with SMTP id 98e67ed59e1d1-3ae580cb98emr2772733a91.21.1793229740129;
        Wed, 28 Oct 2026 16:22:20 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57a56a1dsm2552085a91.4.2026.10.28.16.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:22:19 -0700 (PDT)
Date: Wed, 28 Oct 2026 23:22:15 +0000
From: David Matlack <dmatlack@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kexec@lists.infradead.org, linux-mm@kvack.org,
	Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v2 08/10] mm/shmem_luo: Allow preserving tmpfs files that
 are still linked
Message-ID: <auKDp6MfztVCIzp2@google.com>
References: <20261022225035.377445-1-dmatlack@google.com>
 <20261022225035.377445-9-dmatlack@google.com>
 <sashiko-outbox-183327@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-183327@kernel.org>

On 2026-10-23 10:51 PM, sashiko-bot@kernel.org wrote:

> > +static int shmem_luo_may_preserve(struct file *file)
> > +{
> > +	struct mnt_idmap *idmap = file_mnt_idmap(file);
> > +	struct inode *inode = file_inode(file);
> > +	int err;
> > +
> > +	err = inode_permission(idmap, inode, MAY_WRITE);
> 
> [Severity: High]
> Should shmem_luo_may_preserve() in mm/shmem_luo.c also verify that the file
> is open for reading (file->f_mode & FMODE_READ) or that the caller has
> MAY_READ permission?

> Wouldn't that allow a caller with only write access to read the file's
> contents after retrieval?

Yes. I will fix this in v3 to require the file is open for reading and
update the selftest to cover this scenario.

> > +	if (err && (sb_rdonly(inode->i_sb) || IS_IMMUTABLE(inode)) &&
> > +	    inode_owner_or_capable(idmap, inode))
> > +		return 0;
> > +
> > +	return err;
> > +}
> 
> [Severity: Medium]
> What happens if shmem_luo_may_preserve() in mm/shmem_luo.c is called on an
> append-only (S_APPEND) tmpfs inode?
> 
> Tmpfs supports setting S_APPEND via FS_IOC_SETFLAGS in
> shmem_fileattr_set() -> shmem_set_inode_flags() in mm/shmem.c:
> 
>     if (fsflags & FS_APPEND_FL)
>         i_flags |= S_APPEND;
> 
> Unlike IS_IMMUTABLE(inode), inode_permission(idmap, inode, MAY_WRITE) does
> not reject S_APPEND inodes. In fs/verity/enable.c, fsverity_ioctl_enable()
> explicitly checks IS_APPEND(inode) after checking MAY_WRITE:
> 
>     if (IS_APPEND(inode))
>         return -EPERM;
> 
> When a caller with MAY_WRITE permission on an S_APPEND tmpfs file preserves
> it via LIVEUPDATE_SESSION_PRESERVE_FD -> luo_preserve_file() ->
> shmem_luo_preserve(), shmem_freeze(inode, true) sets SHMEM_F_MAPPING_FROZEN.
> Because all writes to an S_APPEND file extend past i_size,
> shmem_write_begin() and shmem_fallocate() in mm/shmem.c will then fail with
> -EPERM:
> 
>     if (unlikely((info->flags & SHMEM_F_MAPPING_FROZEN) &&
>                  pos + len > inode->i_size))
>         return -EPERM;
> 
> Should shmem_luo_may_preserve() also reject IS_APPEND(inode) with -EPERM so
> an append-only writer cannot freeze the file and block future appends by all
> users?

I am not sure on this one, but rejecting S_APPEND inodes for now does
seem like a reasonable place to start.

A writer of an append-only file can only add data. It can't destroy
existing data or stop others from adding more. preserve() blocks all
future appends, so arguably it could be abused.

I will update v3 to reject S_APPEND inodes. If someone has a use-case in
the future for preserving such files we can revisit this and look at how
to support them.
