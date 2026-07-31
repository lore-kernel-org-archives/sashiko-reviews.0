Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D073BFAE7
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485125; cv=none; b=FOL7dMiU8YeJxVxW6Wen1lbEoNhx9oqcR7VkZO583UYTaGBDPMKnxILWPYocfa4Lqv50mMJN/qK+WIQSPjfuBJ3CgUdYSpUZ4Nxp+E79jdZXpCM+NIFrrSGg1NfxPZzpdYgTONMpClXlOexh77GSDEEA6aVwlIiCO/Z/nqXJHw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485125; c=relaxed/simple;
	bh=tBCCqlmZxn5OI2IhWZPZlmoTQkgcFX26oqBWaCvzdoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEfDEl55h5Sl2Ufou/BFVoOMOcURsnUAt31ci4ycf2e/OXMpUtYtUX0x0KoLUa4EjPdiiVtRZThtShHGym3DEP647FUkPuD+dkfXRpFG9/S4f2I8XpJQd76TrCj1wtZADyb6tGxqF7U+kXvmtV2p0k/pU0JqjmKE4K0j9hCHO0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=od+kVw/I; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="od+kVw/I"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c167bda216fso87923866b.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785485122; x=1786089922; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tREC8DWAl11F8/UnxzNAwFRNYfjo+IaeEh5kckOuNAE=;
        b=od+kVw/Iw72Z4vv5R4JLJj353wox7OoeJKsYv5ISz90I/dly4oj6xvlEjg8WSFVMhx
         sT+nfgRNxHgypxxXGAP9BYWJ60zkA/AHcw+WlASfMCzp4eUDsb7sTQgPI7nb0iHckWvI
         LzDxut9etIXYM0Wc4by7mAnK8cOgxkSoLd2RF/FJgEzN3H7mwqRzhUl5OKDJ5grJGqs5
         FzYGl5W/iCkEcoljEKTR/wgUDG1xhrSYFGTIhjkWv2XFi0g3OuO4v7xXcJFFJ8MTTSy6
         YuUKUFlfTvvwOYZc0tKMhB8TAU5llTytf4ETRydgewToMXjaJoxJ5I9gN1Bd13kvKqMN
         Pbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785485122; x=1786089922;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tREC8DWAl11F8/UnxzNAwFRNYfjo+IaeEh5kckOuNAE=;
        b=Y0OBvnqD1hqVQ1ZLej57ZxnEBehyZYDCU4e0cxMfZL5FZdbEcJzvlhNodSHuu/TaHE
         yhRuQb/mrp53DZ6Hgekqrv11MCx/04EL/n7e7DBq+gQWAtmEgZgSDHPQ51EjyLkzC+98
         Vo0HwOAB8qKlw5+nlOh/A6lUz4yMHg7y/uryFxH/0VcPiD5Lk5FhrCQLSqSbvrwp7we5
         4T8hxvuxC+qZG584oEdunqAiyNr6WyOaOv3BbuZUQ1Y1GML4FYBnlvfE7+KsL9K7btvT
         bzusXTYYgib042bxynsmOuXmuCAIEZnXEDrtav6Q2tUsM8tTT94Srw4RQtUkBKJ2eMMK
         er5w==
X-Gm-Message-State: AOJu0YyrcLNjaBXBBV7PwmB1BB15sTKtM5/MpKlr7k6O0BQpDsqWrlOX
	yWb3qcmQM/5yUkNG3mSX0GCVjChirhWsyfx/qDEKoqVSJb4F9VP2wwLrLpqnN1N5uYdGwCFuthV
	sQrepoA==
X-Gm-Gg: AR+sD13MbgmSkdilaoptvpurrAov1kghTyCfeZACJAEhGxSxBH2HuYqMXT5UaJy85Y/
	jE+SlY458yJ5YWRFuLLZvZrK28TtvmaGCS64VP9dVk2u2G5Q7a2oShekdaFO9slLp8xxkl68AAg
	98D5u8hJIzFCnLRDKpTbQPGTUzvtgpmhSXQkSiSU5OWhFzNb19rDQoXYF3W8PP70oI3OKAGPBme
	C3KMoa+Mx14wMylWGrK1rV623xxBE7WxgYq63NiVX3UI/VnXFZNT1qeJtcxsWY7H1KSRp9iyZkm
	DHRKdzdZ09O9Srubm/m+ePAUFscAa4LPGpQPjh5G/v4IPR3bp4diAgksejN4IvnCY6V6DtrPAJE
	ptzEUOK39i2n6trHO5YWF/iHVUbTJRhWDENJDzkaRjop++2o2jPiUMZlz5AlSuycxeIokLLxhSH
	oi77EXsjNnrNKN5rpnZfJUb07nGZT2LFfUy3sfP7DBThiJWahauLcFbHowHias9J9C64y1NIrdw
	YTc/8FjMpCdEa25leyEWBZwF7pkeZtw
X-Received: by 2002:a17:907:d08e:b0:c16:2d90:68d9 with SMTP id a640c23a62f3a-c1fd26e8036mr51597866b.56.1785485120934;
        Fri, 31 Jul 2026 01:05:20 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3cc3ea1sm54322866b.26.2026.07.31.01.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:05:19 -0700 (PDT)
Date: Fri, 31 Jul 2026 09:05:16 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 01/17] KVM: arm64: Add pkvm_private_va_range_pa
Message-ID: <amxXPMVAMExpVEU8@google.com>
References: <20260720171513.1415357-1-vdonnefort@google.com>
 <20260720171513.1415357-2-vdonnefort@google.com>
 <20260720172559.B2DBB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720172559.B2DBB1F000E9@smtp.kernel.org>

On Mon, Jul 20, 2026 at 05:25:59PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Incorrect physical address calculation for block mappings in pkvm_private_va_range_pa()
> --
> 
> --- Patch [1]: [PATCH v3 01/17] KVM: arm64: Add pkvm_private_va_range_pa ---
> commit 81aa726ac7516be8619c0cb2674493e48b6fca16
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> KVM: arm64: Add pkvm_private_va_range_pa
> 
> This commit introduces pkvm_private_va_range_pa() to resolve physical
> addresses for the pKVM private range by walking the hypervisor page-table.
> This prepares for the upcoming pKVM heap allocator.
> 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
> > --- a/arch/arm64/kvm/hyp/nvhe/mm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mm.c
> [ ... ]
> > +phys_addr_t pkvm_private_va_range_pa(void *va)
> > +{
> > +	kvm_pte_t pte = 0;
> > +
> > +	guard(hyp_spinlock)(&pkvm_pgd_lock);
> > +	WARN_ON(kvm_pgtable_get_leaf(&pkvm_pgtable, (u64)va, &pte, NULL));
> > +	WARN_ON(!kvm_pte_valid(pte));
> > +
> > +	return kvm_pte_to_phys(pte) + offset_in_page(va);
> 
> [Severity: High]
> Does this calculation handle block mappings correctly?

There's no risk to step into a block mapping with the users of that function.

I could WARN_ON() though...

> 
> If the virtual address is mapped via a block descriptor (such as a 2MB
> large page), kvm_pte_to_phys(pte) returns the base physical address of
> the block. Adding offset_in_page(va) will only preserve the lowest 12
> bits, discarding the intermediate offset bits between the page size and
> the block size.
> 
> Could this cause multiple virtual pages within the block mapping to
> incorrectly resolve to the same physical base page plus a small offset?
> Perhaps this should retrieve the mapping level from kvm_pgtable_get_leaf()
> and mask the virtual address with the corresponding granule size?
> 
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260720171513.1415357-1-vdonnefort@google.com?part=1

-- 
-- 
Vincent
