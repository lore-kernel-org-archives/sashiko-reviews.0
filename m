Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DE73CA4B2
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 12:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847497; cv=none; b=RrMAjxz4qHCJBYrk3wdJwro5j3fkAAi0IEJxUuAQwNkjZaWAGf6qWMmeMRIuXNQKUaWZxd5z0ebxHVqhCntcUbrWSNH1aAAH1Lu95IPT9TXdWADhO6bhau0ZSteAh3rSH4Yn6icIKWqxoWirkx/J0TDC/WDobZ1zNRzebCWY1Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847497; c=relaxed/simple;
	bh=AhCvAzGz5QWbk/302ntoX0RJ56FBrV8QY/YWkhL/+9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S1pzlsLoHtLkO+83eC6fSl19yyzoA0ptMzLtAx2uwZpzdCpS8aTZ0c4wG2VgzuUPe57LY01N8fGbenBLS7IrIMB9Hev+pCXYZUmeX6DDfkiT6m8KwbY9ut0aHgQk0Ml+fYLMGdir5mpMAE/kLlOvpsoLtyudwlcHKnY3y3L5hJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OgmpqFg0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OgmpqFg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785847494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhCvAzGz5QWbk/302ntoX0RJ56FBrV8QY/YWkhL/+9Y=;
	b=OgmpqFg0ylB/24ZG9TYLHrRlqDCrFG6UCfuwDkJAsBvVxZSXYFqDdC81JK9kGF0/E1Q3hn
	LqvsGtbHW/Keru8To7RNZ2gKvNzHEhnr7sZzNUs5SxKJqul/3+9WmhP6vMpqP+/b4yhlmJ
	Lckl3Oqluh443nfnZDTmKLR59dUdi/g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-xsS2CNH0NhirBEtsLuX-nA-1; Tue, 04 Aug 2026 08:44:53 -0400
X-MC-Unique: xsS2CNH0NhirBEtsLuX-nA-1
X-Mimecast-MFC-AGG-ID: xsS2CNH0NhirBEtsLuX-nA_1785847492
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f835ac1aeso3645634f8f.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 05:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785847492; x=1786452292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhCvAzGz5QWbk/302ntoX0RJ56FBrV8QY/YWkhL/+9Y=;
        b=Q5xqh0FrzU5DOYlV9+qIlw5Dkx8eFdTibLY1nuE8CNcfs27YE8WuAuvNuW7YVZzf5h
         em3ixz8giKK3cr/c2rrh7PgasYWc4S99ZDvSH7oUee3ex/oTWypQuAG77HNxqihUI1jO
         RGIJeLSkVD+hNJabIFxPhDtH9eCT9q+PDoi220Zw0Rtz0bKDdXYs3TRMICH4ex1yIto2
         qaWZ6KNXryg2tCgawn2DX+9s3pmxzac9AFfS5i5sC5uVj4TLTMZXfIFKYmnFWbFH41f3
         6I/EHZPEVddNP9T04G3EwFM5bSeoS2yaFhUIYeVBNG9+WcTEzqbHnrM31uWDK/D1BkCY
         XNeA==
X-Gm-Message-State: AOJu0YzWjfyDdkGvSIi73HAprP/2cjIVrYhoHKlyrEuHDBgYeA84VIWq
	AbuNqNBWxJ4A1Shj+BRHM/z7oRd9I3eUzxgvVfkAaNRDyKeMc0yr3sVnvER9LCDbWFYzKXFrG88
	kilqGdAil2e6wr4tnDC++pbXgU+ztM/k3HD8/rbfWB+s9CnfM+zDd2JMOycaXVu67qqG06SpQ0w
	PJAasdwyGkgvlYUcZ1KH0SF6rTymH/pdUj0OtHaHDrAKjFjPj4t8pz
X-Gm-Gg: AR+sD13Y91dcOWdewp3sYOXzOUaHTPLDvkwJ+M8QzLZETLKb67oNxh/XLlEEImrQhJr
	JbtiOV8U172EZ+2wAXRhmw4DGe9bD3OITLZTGahxmQMGYxbrIQ/uhLajT48Iabp0/Gveoe5cqB0
	rxKwoUoVWVRQQU7o3UCgASnvmMPPrWwZkwpXrZ1hS/CzI0zseyb6YU/RwyljEXO8HgTUhOu/YmQ
	XGIt6szkRpLkgtGnNjjd8CQIpCCysO6Wlp1CWwuS5JDyTknl0YAwh0r+Go=
X-Received: by 2002:adf:e196:0:b0:47f:91f0:9a8 with SMTP id ffacd0b85a97d-47fd72d9daamr44077320f8f.23.1785847492531;
        Tue, 04 Aug 2026 05:44:52 -0700 (PDT)
X-Received: by 2002:adf:e196:0:b0:47f:91f0:9a8 with SMTP id
 ffacd0b85a97d-47fd72d9daamr44077224f8f.23.1785847492081; Tue, 04 Aug 2026
 05:44:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804120529.1730187-1-pbonzini@redhat.com> <20260804120529.1730187-5-pbonzini@redhat.com>
 <20260804122348.AC6E51F00A3D@smtp.kernel.org>
In-Reply-To: <20260804122348.AC6E51F00A3D@smtp.kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 4 Aug 2026 14:44:40 +0200
X-Gm-Features: AUfX_mzeBd9D7i9RK65m6Y6i1uzG2a-w4C9IIV172eXDDgUNWsdPG5F7opYXrlc
Message-ID: <CABgObfbd63O_UkmCcik1z0J847Sr6a5rnFgwttBjBb0am=+2PQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] kvm: apply VM_READ/VM_WRITE checks to all VMA types
To: sashiko-reviews@lists.linux.dev
Cc: Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xdeYRMM_f2KA4bfTdIolDzNae-dCSZWM397kHwPH0HU_1785847492
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 2:23=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Write faults on write-only `VM_IO | VM_PFNMAP` VMAs are incorrec=
tly rejected, breaking guest writes to write-only device memory.
>
> If a guest performs a memory write to a guest physical address backed by =
a
> write-only host VMA (e.g. VM_IO or VM_PFNMAP mapped with PROT_WRITE but
> without PROT_READ), get_user_pages() will fail and fall back to this look=
up.
>
> Since the write-only VMA lacks VM_READ, this check will evaluate to true =
and
> return KVM_PFN_ERR_FAULT, skipping the VM_IO | VM_PFNMAP handler. Could t=
his
> prevent guests from writing to legitimate write-only device memory, such =
as
> command ring buffers or write-only PCI BARs?

This is theoretical only but actually a bugfix, because KVM does not
support write-only mappings and therefore it would not be possible to
enforce !PROT_READ/PROT_WRITE.

Paolo

