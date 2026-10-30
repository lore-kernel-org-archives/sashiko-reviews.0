Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793326289;
	b=eoha6gH3t0/VtLffACY9cBb4r1BzxGt3Ar/4T3nMWSXaJpFOwPPx3zq/vXUsaAFRGqYu
	 6+7as9j5jXQ64cIwNtJerTp9EBnORCAvapAfsHK3vIvn4p9XYMIwdyExIKJQieuWk7ZEr
	 wIhAl6QuVGIGRkWjjhqwy7vG5nOFaiJRRPjOETRKTP2ZjlMwkuMansjnB8oJMap82yDLP
	 HW0MJAyKv+0dS92SVU3xbbOtUtlSGRDOmp4LjnCbr/TK0fPBbs25nCFfRF9ceSPhCKNym
	 LnccCv9ovWBcuUkvEWy005vu5ekGcQxaD6PKi8VSzSiztjOmBXriE+bqmLqPe6Ln4Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793326289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=qa5uqZOFY2I0haMmHVU09YCvN4fkPxIgUfz1U7YDp3s=;
	b=nzX3ec5u1tY0aYyRelp16zIdZG3Pqtntbe/BMh4eED2C5CQEECtowB6ZfWrcirh49A9h
	 nuKA2OgdmGxSJTBUqTNj/Q5++RkBf3BIaJOBGCylUVdAjlLg9iBrg9BIQyLbwNAVIVVF7
	 gKSyMnWZHZJfdkpdwsrUWr+2fug8+jtMrod8NaEz9XnNCVujHLeEbgQ19b2hkPd7y588S
	 ylFIYmoQHBC3/rM/b/hDFl/KMUNnHuPHJyDINWQXEhojIA/nef/WhziSiI1bPGfooCIzV
	 NUKNJ5VJ27BFf1RFwn3tf8rW1L8JTMCBilN3ckABzo5rnNljoSLUoS+KSyF8clXMWiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ly8XnSdV;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C89606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 02:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25C89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ly8XnSdV
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso371802eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 19:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793326288; x=1793931088; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qa5uqZOFY2I0haMmHVU09YCvN4fkPxIgUfz1U7YDp3s=;
        b=Ly8XnSdV4oPHqVOhfO1tZZ1NgDnLkAnoM3exJnaDRAQlh7HSUi84TrzYPnlfQ5cqtL
         xgJx8qZlPQ0sffknDg5KiDqjCX1dWFbA/wxnzCXFQwE67AtxUrU4nXKZrf7whUfnWKys
         vJmolhD4StOzRrjzdj3zeG4+xdetVbzwcPBSh2bFuio2aUotajv1sLsg4aLrIuZPuDg8
         NUouLC9UaIILBdHLKhajSUQODrcUn6Pn53R4TUEWT0UhPqu5A/uotjz3qY/6zTdHySjZ
         SqZj1ytx8Q923wRd8Y1Wbn+d6dg+9fwxWzM8Db35byM3u605ewVhMT316p+I2SfayESu
         GPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793326288; x=1793931088;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qa5uqZOFY2I0haMmHVU09YCvN4fkPxIgUfz1U7YDp3s=;
        b=zs9wiZMH4kLW1y+gdxt2WLLRpd+vcThRiWR4j1YTO5HTCi8R1DHWGttZx6vP0GifLW
         FVr/C/afNgTQM2ViJ2lfHDIRkVB6N2LjkfjIZf9KYyVu+w7nKnb1mos8wDcznoPQwqrd
         bcQhvwf5rtGWJc0WQoaAay/rSEXCwmQjLYnpHkjWnqqT5slwX9EwxCkl75ExAccSqsvD
         hUQ+gG7g/G1JOwDeHhg6EB12wqUCsGnkDTA4LNxO2R82YjgSZNfq3Yu3e93t6YKkgYyM
         wkp2v4MKXzhf7mxWehcjIfInpgi2PZCowTomBYaP7VEuTjEhfUAo6vHRUgVxAL2N4Bck
         gKPQ==
X-Gm-Message-State: AFq9FYJYLJIgTEHmkZipNbRbmUAYLk4wX4Jdxr2Pr0ClpW7H5p33kv+u
	DUtS62rczdHxMFidh2tm45Omvc64YR3G07x8lU144D6+M3yKGKeGlSxYbFwmpQ==
X-Gm-Gg: AYBFou3UWo1ldvVWYrzE7iGmRKwYTlYaTjT7XfUDvc/miovpQdpUPCSTLWjUznkujwy
	VZGye0fyj3TX41+jXg9h+N+KGWWajBcQcOMlNeEkTNrlburbEKFGzyu1pW6zefO9GGK8Nq2oE0p
	TgVXmH+QmG5+vnTvlm8QNdzDcxE8zBpAWUcAnqpcld9cdRF0HXbhsa+5XFZ+wl9srQgxmYY7HzJ
	YIj0F80HevwKyPWW7/XHQ2whMo8w7J0ER4wzc5wxme1ecpf09g8mFyv3U5hyArZRrTh+wqkq5kP
	hoM2Han3m6npU1YUR4X6WjFZM4VPUlHHJIPMJx0d/ZuLY08yl8sgxlHzxVG7WTmUZ3Ei/uUnTHN
	vx9B6yRKvsccpuvNYFonkuJFevAmRCCNlaFwGGcGjoo9QzNLk/NndVt5MgQpOUsaotR1JDCMRB+
	zEjUgSUWunLzFFRl/LxJAJ7gAvvOWgT85rHxzefnKpko+JJ4XzY75lr693GRQMQM6O6iW/LLTWC
	uL2BqBe9lpk5VrlE4BWKfUPx6ExhuM/lOV0fzDm/8homWOZ/34j8Ox4yPd7lAs+rM3FGu+61bx/
	TB6qqwceakglx8NQ3yh4dA==
X-Received: by 2002:a05:7022:f115:b0:183:7d42:cfb5 with SMTP id a92af1059eb24-1ac5d88c1famr1087217c88.19.1793326287926;
        Thu, 29 Oct 2026 19:11:27 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm2448104c88.14.2026.10.29.19.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 19:11:27 -0700 (PDT)
Date: Thu, 29 Oct 2026 22:11:24 -0400
From: Kwanghoon Son <asdfkwang@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org, gary@garyguo.net, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: io: mem: Fix exclusive MMIO region requests
Message-ID: <auP8zJwRmAdnpZO3@debian>
References: <20261027-b4-rust-iomem-origin-master-fix-v1-1-16215ae197af@gmail.com>
 <sashiko-outbox-187333@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-187333@kernel.org>

On Wed, Oct 28, 2026 at 02:12:54AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] rust: io: dead_code warning in Resource::iomem() when CONFIG_HAS_IOMEM=n
> - [Low] rust: io: missing #[inline] annotation on Resource::iomem()
> --
> 
> commit 87df13a505aabe5d12ec487bcf72bfc859780ac8
> Author: Kwanghoon Son <asdfkwang@gmail.com>
> 
> rust: io: mem: Fix exclusive MMIO region requests
> 
> This commit updates ExclusiveIoMem::ioremap() to request the MMIO region
> from the global iomem_resource root via a new Resource::iomem() helper
> rather than from the device's own resource.
> 
> > diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
> > index 758ce62b3cce3..c99a2530186fc 100644
> > --- a/rust/kernel/io/resource.rs
> > +++ b/rust/kernel/io/resource.rs
> > @@ -79,6 +79,12 @@ unsafe impl Sync for Region {}
> >  pub struct Resource(Opaque<bindings::resource>);
> >  
> >  impl Resource {
> > +    /// Returns the global I/O memory resource root.
> > +    pub(crate) fn iomem() -> &'static Self {
> > +        // SAFETY: iomem_resource is permanent; C serializes resource-tree updates.
> > +        unsafe { Self::from_raw(&raw mut bindings::iomem_resource) }
> > +    }
> 
> [Severity: Low]
> Will Resource::iomem() in rust/kernel/io/resource.rs trigger a dead_code
> warning (or a build failure with CONFIG_WERROR=y) when CONFIG_RUST=y and
> CONFIG_HAS_IOMEM=n (for example, on ARCH=um or s390 without CONFIG_PCI)?
> 
> In rust/kernel/io.rs, the mem module is gated on CONFIG_HAS_IOMEM while the
> resource module is compiled unconditionally:
> 
>     #[cfg(CONFIG_HAS_IOMEM)]
>     pub mod mem;
>     pub mod poll;
>     pub mod register;
>     pub mod resource;
> 
> Since the only caller of pub(crate) fn iomem() is ExclusiveIoMem::ioremap() in
> rust/kernel/io/mem.rs, should Resource::iomem() also be annotated with
> #[cfg(CONFIG_HAS_IOMEM)] (or made pub)?

I reproduced the dead_code warning.
I'll add #[cfg(CONFIG_HAS_IOMEM)] in v2, matching the condition on its only caller.

> 
> [Severity: Low]
> This isn't a bug, but should Resource::iomem() in rust/kernel/io/resource.rs
> also have an #[inline] attribute, matching the other small helper functions in
> the kernel crate abstractions?

I'd prefer to follow those and leave it without the attribute, unless
there is a specific reason to add it here.

I'll wait more reviews on this and send send v2!

Best regards,
Kwang.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261027-b4-rust-iomem-origin-master-fix-v1-1-16215ae197af@gmail.com?part=1
