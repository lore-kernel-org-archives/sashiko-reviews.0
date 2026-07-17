Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F7C3F0A94
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 14:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784297728; cv=none; b=j//1zhzdmG3a4tPptF74cqiMl2totq8KdBuprd1eWIWb8/vq6E9ZYp4rtwrqMJsS1eb/DXX2BMiZPyZsbyDNFsLQBNy48wlH1nCMfsFN8ME1+YKUflecVLwbO9tNqyy29W5s5b2h9e/u3/WIBKruimbmo9JBDgraeB3Crb8CmTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784297728; c=relaxed/simple;
	bh=RM1hOBqe41YQpTvamNFSraYKKzqvGr7XM19iPvWqC6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMwclgzvQT0WHH4N1MQa69Fx6Gi3/V2n45/iI5w1P25aZEyfZbBoIvxNHXjwGgLvyeSeoNUCnmpbDRhweW1YzdwS46zTxkKmeC1RdssMQ9/ZnMsvJdyVyRWEhHyiimygN1rJRVH630QkAZtSUYG4GKJcZmkI+378+qBw7Sxms40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VkbdwdyP; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VkbdwdyP"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69a45011a92so14703a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 07:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784297725; x=1784902525; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXWH6Jhwl8wi1iKMhYEPExb/6oMzNFQqYI2WByMT/XQ=;
        b=VkbdwdyPB+BUo7kxpX49NJPrLLOvfK7OI/01fVBf8DWbZFQaA56yFpI+IfDzEasyS3
         fIJcg8j5ZJtIrDGsJKwfjyGzGeiKjMO/Y3N3ncGFPrKs/DAhtW3vR7jbr90i2UaYeul6
         Uuur9NT23hkodE6kbz9nUAJC4NjfIF/vi9h1DawwIwXx5vx0F8E1vcxnYd//jU8eHnCn
         BZ7LlVy+CrWWyjAOS03rAQGZr8tALrv+tb0UwpoWVKKfx2ikd/Id95TdVWO2289At0aW
         hANIM80WS+8qb7N/BQV0Wjh0KTOtObDz9W8hcSl7Q/QQewY08OpUik1sVjtJFOASq7qY
         9LKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784297725; x=1784902525;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YXWH6Jhwl8wi1iKMhYEPExb/6oMzNFQqYI2WByMT/XQ=;
        b=BIQooglXLhmhxSd/u4fpOwnF2wLaKb+Kkv8+dFI8yNyJT1rdmx4oBKvW4zDuPCWmqZ
         ZC0xk1RSg9digXA8KaFoG766L3l96YSkWSJgMnfJmsk4Cxx+gkuYRlplkBtmST9kx1ac
         gNYr0E0BXITH1j/xs8bkBV6tX98Amsf3tE4YWpUF/ENCWOpp1u700/Mz0EY+nsj3hCkO
         wCNeKwKs03hsbAjZW8pkDR64Eogc6cEr1SeHfZvZGq9ib0xHc607+oTnGHqyAkECeHOA
         /SmMTvD6dwWZogoyykXerPK26LvpfUI/D2pSiunRytEarCIe4OPwOpP4AGjOjPA3gDhY
         erRw==
X-Gm-Message-State: AOJu0YwHyAhi4tgaGFNjM5dBSL7ggrQtT/rjGTUYqabuzibPhZu94tRI
	7w8obCct/KC2OOXmWvp0ewMAaYrkFdP0yBx+8vJfc/gMxTfTKftwFH2dGdKcXj2OqLxjxGYqby0
	p3USS5Q==
X-Gm-Gg: AfdE7ckgbmJ+Zac54vT3tOVvbzFTU4HY9vgQQjaUoH6qEuKEHgUDhUmxmAeIoD+Kb0z
	EFm51XEPYuLZIUQToXLsl+pKVvM/DBUSZ697Kz7MFYHgdsgxZcILgAAmM9yyxqYhb+FXy7JKFcb
	9z2DrNig6naXlKsTmPzFOGpmZMVp0d8gZSxF0tK3kdNtU2tcIm/CT5e3b6440MTSKHwsdeXE6Vh
	AjG37UIqipwA5+D79/nzdSgfVfbaIfgFq0u2JZeeEiygJDl5EV5bPydqqH/vDOvpGTV3ydCtKmy
	PBPmMTGMdfvcChKiy+bVNa6X0tEDDRgkA4K6QM5wjqd73IhrjVCgP0nIfMlr6t4Z/ULRBxD/09p
	idckIXhKEJA8mc4DOUj/OFzkaFtxBJbcvZg0YO/qu2xeOClBTKuMwEnyYrzwlC5kpjo3yttNw0Q
	j0WkP1nHjNh0nAGa5XWyy/SZgQR2M06bX4eFTIEAk=
X-Received: by 2002:a05:6402:b32:b0:69c:39f5:7e36 with SMTP id 4fb4d7f45d1cf-69e85fbe0damr3218a12.0.1784297725014;
        Fri, 17 Jul 2026 07:15:25 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f837sm82465066b.32.2026.07.17.07.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:15:23 -0700 (PDT)
Date: Fri, 17 Jul 2026 14:15:20 +0000
From: Mostafa Saleh <smostafa@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	Oliver Upton <oupton@kernel.org>
Subject: Re: [RFC PATCH 2/2] KVM: arm64: Support BBM level 3
Message-ID: <alo4-GK0K012OppT@google.com>
References: <20260717130901.2239134-1-smostafa@google.com>
 <20260717130901.2239134-3-smostafa@google.com>
 <20260717132857.AC30A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717132857.AC30A1F00A3A@smtp.kernel.org>

On Fri, Jul 17, 2026 at 01:28:57PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] Replacing a block mapping with an empty table mapping using BBML3 violates architectural requirements and causes TLB conflict aborts.
> --
> 
> --- Patch [2]: [RFC PATCH 2/2] KVM: arm64: Support BBM level 3 ---
> commit ea79cffc563af3beac80c1a139cbab5674ecb7f0
> Author: Mostafa Saleh <smostafa@google.com>
> 
> KVM: arm64: Support BBM level 3
> 
> This patch introduces support for hardware Break-Before-Make (BBM) level 3
> to replace stage-2 PTEs directly instead of using the software sequence.
> It atomically updates the PTE and relies on hardware features to handle
> the transition.
> 
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> 
> [ ... ]
> 
> > @@ -1069,7 +1102,10 @@ static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
> >  	 * will be mapped lazily.
> >  	 */
> >  	new = kvm_init_table_pte(childp, mm_ops);
> > -	stage2_make_pte(ctx, new);
> > +	if (!stage2_make_pte(ctx, data->mmu, new)) {
> > +		mm_ops->put_page(childp);
> > +		return -EAGAIN;
> > +	}
> >  
> >  	return 0;
> >  }
> 
> [Severity: Critical]
> Does using BBML3 to replace a block mapping with an empty table mapping risk
> a TLB conflict abort?
> 
> In stage2_map_walk_leaf(), the code allocates a zeroed page for the new
> table and installs it. With BBML3, stage2_make_pte() atomically overwrites
> the valid block PTE with the new empty table PTE, bypassing the software
> break step.
> 
> Because the new table is unpopulated, if another CPU takes a stage-2 fault
> on this range before the TLBI completes, it can populate a 4KB page in the
> new table. That CPU will then cache the new 4KB mapping while still holding
> the old 2MB block mapping in its TLB. The overlapping entries will trigger
> a fatal TLB Conflict Abort, panicking the host.
> 
> Would it be necessary to either fall back to the software break-before-make
> sequence when splitting a block, or ensure the new table is populated with
> equivalent translations before the atomic swap?

The point of BBML3 is not to get conflict aborts, so I do not believe
that can happen.

Thanks,
Mostafa


> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260717130901.2239134-1-smostafa@google.com?part=2
