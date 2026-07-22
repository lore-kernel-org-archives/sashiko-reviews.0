Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5391478865
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706271; cv=none; b=mxzbsv+XeWx3A6H4iSYGJXVEcn52uPMt+Owg3phyTKxHXeIF+w6qQocGC0OnWkvoAIaCQyiVsiBmBTfzKx2Y5+g2Zz4AeqP+x3+9I3AFeX2msYMt28THwKXt6qfTJ+7FIcL83NNyxrC/jzzk9ES/baW2eiOb2Xy15I21DgP/iCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706271; c=relaxed/simple;
	bh=hvvZZ9WnDamFt2nH8Wj/UMAMyTXKq6pATnBAsjabcRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKCrgb++K+aMQ2GD63c7L0rspNBx96DEUKhLElxYzNRfdCJ9ag0NBDKsZDLSNXDA72jUDsit4UXM3uHykXmLGq6ytLhHzOc1fC3+RAK8eYqvP7ZwWSABr1YX1LLQW+G9FNlbJGeuOu3bfD7Qhuwsf03UwU8+85NBGPV0PiWzziw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Gx4mlAyL; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Gx4mlAyL"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c15b1da6b82so949754666b.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 00:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784706266; x=1785311066; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jF6485LeRKPydpaF+R9Ey9azSDTe9cIW9VnQV5w/95g=;
        b=Gx4mlAyL9mXrYxEc4mZB2s53W8HNF3UK5dnoiUdw64ZoqIhp99dxUgHdi34Oc8lCcn
         Vc3M1vkxM12t1CSy4qWNfSH/uhRMXByNM7C6QGK9S7Tn7aJoJ9RAbdQ+AXJq9WoO/aFj
         0oNctK0aZWGyoUJAodrZ9NvDyhAo+5JfPRHQy0GAiKoyj8oO3tHDaMM5mhJdwWBygeTd
         rWvhjEH+0RHBoHbiClW7bDUz0SRRjtsLW62SMuQeoVJdZctk3JRVxptk8zQ2tY9gVrTd
         43KktfWqSIA5t3MM/jw696zxzV03t2EY+I/CdneFzZUo4MUTO2g/qwbfaBIoTrdQbv44
         4RnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784706266; x=1785311066;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jF6485LeRKPydpaF+R9Ey9azSDTe9cIW9VnQV5w/95g=;
        b=Og49WX2xYAoBJEVDvkwfjlgwl8IsWKQ30rdkmnIA3Nn2qlsnNMTiJ4xubA42zQ/v8H
         GEP0PrftUTraQ+u6hq7AOVntl8odCKMr6GknkbU+NL6i6HlRDUjMBXa3ql2JxSCGDmO/
         m85O0caL4udxJqQrwXHkbbdJ+Qev2LDsZiSm5CFk/hN3fUJysRNPramY5vS/xwVqLZky
         iglMJXfOYMZ3Sham26PRvYFvEQf0t557eEUUy2GtLUKzrWYKsiO7dY5cxIUzceu9AOn9
         KXnmooRuGjHq9i4meab/N6oLyLy79IgyyKsT8zKhWGe6WpmxLWIuZ7Hkwufr3Nz7+m6Q
         mD6A==
X-Forwarded-Encrypted: i=1; AHgh+Rp7Pwldd8HswKUhPXDMuC3xBGuudqfCjzTI+khhTuPMXNE+T2X3uqfWrtBn6kThGN92NtSIPsBNjkB8LAYVz3s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJZ9ENi//4e/Sa79vTefmD1qUJpKRMsj5WSkNLwEw1RBnL5tft
	dFEk90wR+9CtKTijRhs7Qd2OgvVCATJ/INrMl2pQ4JPIOM1MCgw/cCuVNTSh+arX65M=
X-Gm-Gg: AR+sD12XXbhSv+WZZqTLTl7vZ36rnum2Em1tdKbINIoG9GoW4NZaKiY5zlpFIdKkhLp
	ONPCYxwTCwAZ5XxI0I/BliMNBoIIafj7+Qzg7AoinAhaUaSjvnwkh/sTj03ZNDHgM8rC2ClxDo1
	bg3t4gXY6BiQCmToss5gQGkeHxuCOwOdXU0N9yOPkAcXNb7TfpHF0Dsyr2MpFLm76XImDo+4Fz+
	ruwsxm6iVdiIs3ngMuh9r6EYXhmhU6orENj9XLp4C5DljlpHGT6mPqHGE5jzC78P3I11fh9TkM6
	IhiYO750FNDT1zjsHTj2hRoCM3lK+LL83cDuejAv0Boex77uNST3BAX/iXRG9Okv1qMR/sfSmU7
	iEI2XMNU/k5o//U/rZjDHhCX6iiILgaF6/HN7USOtCg60TMqYRYIpE0kpEKuRteQnzDwL4k4EPV
	W+2RF0jtCLiRykZ0pWLu0JO9LE
X-Received: by 2002:a17:907:3f99:b0:c16:592b:ec4c with SMTP id a640c23a62f3a-c16b46990d8mr908620966b.1.1784706265503;
        Wed, 22 Jul 2026 00:44:25 -0700 (PDT)
Received: from u94a (27-53-137-220.adsl.fetnet.net. [27.53.137.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa9918sm9950635ad.16.2026.07.22.00.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 00:44:24 -0700 (PDT)
Date: Wed, 22 Jul 2026 15:44:19 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, 
	sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH 1/2] bpf: Preserve stack frame number for commuted
 arithmetic
Message-ID: <amByrnAG0NWd0dLK@u94a>
References: <cover.1784563950.git.chenyy23@mails.tsinghua.edu.cn>
 <a092a059781aad37b8d8ce3bb927052de5f73431.1784563950.git.chenyy23@mails.tsinghua.edu.cn>
 <20260721094829.3D0C71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721094829.3D0C71F00A3A@smtp.kernel.org>

On Tue, Jul 21, 2026 at 09:48:28AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] The patch completely breaks the security check that prohibits subtracting a pointer from a scalar (`scalar -= pointer`), allowing unprivileged eBPF programs to bypass memory isolation and achieve arbitrary kernel memory read/write.
> --
> 
> --- Patch [1]: [PATCH 1/2] bpf: Preserve stack frame number for commuted arithmetic ---
> commit 3b8c2832d6eb05fc6ef4d1f2af9ee96ccdf5566e
> Author: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> 
> bpf: Preserve stack frame number for commuted arithmetic
> 
> This patch modifies how commuted pointer arithmetic is handled in
> adjust_reg_min_max_vals(). It uses a temporary off_reg to copy the
> destination register before calling adjust_ptr_min_max_vals().
> 
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 52be0a118cce0..3c0af83db4672 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> 
> [ ... ]
> 
> > @@ -14854,15 +14855,18 @@ static int adjust_reg_min_max_vals(struct bpf_verifier_env *env,
> >  					bpf_alu_string[opcode >> 4]);
> >  				return -EACCES;
> >  			} else {
> > +				struct bpf_reg_state off_reg;
> > +
> >  				/* scalar += pointer
> >  				 * This is legal, but we have to reverse our
> >  				 * src/dest handling in computing the range
> >  				 */
> > +				off_reg = *dst_reg;
> >  				err = mark_chain_precision(env, insn->dst_reg);
> >  				if (err)
> >  					return err;
> >  				return adjust_ptr_min_max_vals(env, insn,
> > -							       src_reg, dst_reg);
> > +							       src_reg, &off_reg);
> 
> [Severity: Critical]
> Does passing a pointer to the local stack variable off_reg here break the
> pointer equality check in adjust_ptr_min_max_vals()?
> 
> In adjust_ptr_min_max_vals(), we have this check to prevent subtracting a
> pointer from a scalar:
> 
> 	case BPF_SUB:
> 		if (dst_reg == off_reg) {
> 			/* scalar -= pointer.  Creates an unknown scalar */
> 			verbose(env, "R%d tried to subtract pointer from scalar\n",
> 				dst);
> 			return -EACCES;
> 		}
> 
> Since off_reg is now a stack pointer from adjust_reg_min_max_vals(), it will
> never equal the verifier state array pointer dst_reg. Could this regression
> allow eBPF programs to bypass the restriction and execute scalar -= pointer,
> potentially breaking memory isolation?

This seems right. adjust_ptr_min_max_vals() has the assumptions that
either one of these cases has to be true
1. off_reg == dst_reg && ptr_reg == src_reg
2. ptr_reg == dst_reg && off_reg == src_reg

By passing neither dst_reg and src_reg as off_reg we're breaking the
assumption. Perhaps we should have add a ptr_is_dst_reg argument for
adjust_ptr_min_max_vals(), which could also then passed down to
sanitize_ptr_alu() as well (which currently computes ptr_is_dst_reg
itself).
