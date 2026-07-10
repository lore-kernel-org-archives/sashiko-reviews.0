Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0826495E5
	for <sashiko-reviews@lists.linux.dev>; Fri, 10 Jul 2026 00:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783643568; cv=none; b=rZDATH+u5KfnDNxP2Df6ACHb/AaJsDa1AEsV2AlNvX3FfccsyIfc6fnjniPHFkOJh6PTZ/oPVTZXRuk2s4NyJACBhWwjb5g/6a79mZ3eSFPdcKKFg6ky+sOgRWgiWFKjkcEzS9MJQsxoIM/+pd1sxwbaJC2fNb1ETN3mqOLsjBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783643568; c=relaxed/simple;
	bh=+bTWA5hnGpiQxtS2T9bX9sGL7iC1eSy6311oxdmEM2o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jo8Btc54jQIjFmoL3zqlJBu0kkppo2LVP/ANAD9VfyAw5XN3wwWk6xcnltT4vSXU0nsIUMJzYimZM5D/4SU9IkhCvDL1G33gw+t6sHagN/OZ4sgFnz0UGHmu+vQnPFsxbEpQefCYbhecqoch+cL4YJXBfzLo3RdObcvdAccIZWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Szu8nqMl; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Szu8nqMl"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so314320a12.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 17:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783643566; x=1784248366; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8xU1EYHsasAehLSIMgUsqKDLz4v33CnWDNqy3BlS09M=;
        b=Szu8nqMlvUd1EIzzMebd2r2TAAnN6Jb/pICUtvyuFgmu4v+LnLXBexkJfMlDdPvS1O
         W3t912XYIFOs9FPen1k3u60n/xxYuYWmKkPO6TFOqKrIjX+p2CjMhDxdhc2M8KUyGVC4
         2j4Q5rIvcK5Yfe8siwaoL4g77zJSgIeObxm4z/fzT61Q1FZ0X8fCY2o18J/EkrBgDNYH
         Rb+UteY+T40pL+IvUok+rIE5mry4bH18gfzKP9OPgmAwGP8Ao2+nwiV4gaYME8ziZCZY
         i9XIUf/WC8QkYXw2HwY1TvdSRS8WcMy1TUPqQFs324wI3QWRK0dktwkzW8F5/w6LqRfn
         D2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783643566; x=1784248366;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xU1EYHsasAehLSIMgUsqKDLz4v33CnWDNqy3BlS09M=;
        b=msOTYULJQ0fmC1qnYaDSRuXkWC1t5CYocs2M85EFCxwdIS6qPwcjTpvHSazXQ+nB/n
         nZ0XzuB9UwTzzm/z4p7qmKnXoQIugvUT9pGEqVqLWpjPJqq/GEb3Kr3pvOsCsoHTl7ov
         Ko4fWHSu+uInVELN9CSyO7qo/sy58feO/lpMNNDVzjpTIJkbhj45DVW3GmMFpigsnb1R
         A27FtESazwSfx0l7kxIQrM9r4q62PVii3DIm2BsKhDPJpujnTkhgk4TkKGC1/w/XU8hQ
         E+S6mQrHA5QCYBoZr0oLoWl+cNTcGgT8N4OwbrmL0ldceruYS/yDqD+Vk1RYgFQ6y+Fr
         CTBw==
X-Gm-Message-State: AOJu0YxsgJy/QRf0nYp/PPz8vAg+dRaflNW82H8edDVAkTm3b7MUOgc0
	vUKvKRT43YJjZ0WopFpq2/conCuhzfJc6u99tUpUXihKFut9fwJ4gkaSddw3IG4XPeOARPrqsq2
	DD9UWgczbZNPRWHMypCb9HqX7F+r/sgxHQJ7K1HM4QIDmtU7q55orSjuzVXvkEMUIAvoxupOyoy
	0ziELj9tOtmfdOWp/K76Z2tsjgZwIVS6HKtYGlely5d/7VfZaI
X-Received: from pggg11.prod.google.com ([2002:a63:200b:0:b0:c7b:b2bd:6cb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6e8a:b0:3c0:9c19:65a2
 with SMTP id adf61e73a8af0-3c0bd276af6mr10032774637.74.1783643565720; Thu, 09
 Jul 2026 17:32:45 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:32:45 -0700
In-Reply-To: <20260709211123.C97C91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260709204948.1988414-1-seanjc@google.com> <20260709204948.1988414-16-seanjc@google.com>
 <20260709211123.C97C91F000E9@smtp.kernel.org>
Message-ID: <alA9rQSsMmfTfrTX@google.com>
Subject: Re: [PATCH v4 15/18] KVM: guest_memfd: Fold __kvm_gmem_prepare_folio()
 into its sole caller
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
>=20
> [ ... ]
>=20
> > @@ -82,6 +69,7 @@ static int __kvm_gmem_prepare_folio(struct kvm *kvm, =
struct kvm_memory_slot *slo
> >  static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_s=
lot *slot,
> >  				  gfn_t gfn, struct folio *folio)
> >  {
> > +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
> >  	pgoff_t index;
> > =20
> >  	/*
> > @@ -101,7 +89,12 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, =
struct kvm_memory_slot *slot,
> >  	index =3D kvm_gmem_get_index(slot, gfn);
> >  	index =3D ALIGN_DOWN(index, folio_nr_pages(folio));
> > =20
> > -	return __kvm_gmem_prepare_folio(kvm, slot, index, folio);
> > +	return kvm_arch_gmem_prepare(kvm, gfn_to_gpa(gfn),
> > +				     folio_file_pfn(folio, index),
> > +				     folio_order(folio));
>=20
> [Severity: Medium]
> When folding this helper, did we lose the GFN alignment for huge folios?

Ugh, I totally missed that, obviously.  Aligning the index in the caller us=
ing
a gfn, and then subtly computing a new gfn is just mean.  I'll fix this by
squashing in "Align the gfn as well as the pfn when "preparing" a folio"

> In the old __kvm_gmem_prepare_folio() helper, the gfn was recalculated fr=
om
> the aligned index:
>=20
> 	gfn_t gfn =3D slot->base_gfn + index - slot->gmem.pgoff;
>=20
> By passing the original, unaligned faulting gfn to kvm_arch_gmem_prepare(=
)
> alongside the aligned base PFN from folio_file_pfn(), does this create a
> mismatch between the unaligned GPA and the aligned base PFN for huge foli=
os?
>=20
> While guest_memfd currently restricts allocations to order-0 folios, this=
 would
> pass an offset GPA with a base PFN to the architecture hooks once huge fo=
lios
> are supported, violating the API contract and potentially corrupting the =
guest
> mapping (e.g., if a backend like SEV-SNP falls back to 4K mappings for a =
huge
> folio).
>=20
> > +#else
> > +	return 0;
> > +#endif
> >  }
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709204948.19=
88414-1-seanjc@google.com?part=3D15
