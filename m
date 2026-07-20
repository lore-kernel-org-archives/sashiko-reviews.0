Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6BC44683B
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 17:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784568709; cv=none; b=fZxuWE1PlDjL2MFNMM5YZ0g/YIB1RzO1Qw9OSpO1D5BSa++g7rdR9z+/5MxM9Jp+m3zoZ8LkObkXhZ6F5Ek24LUACQEysEWB/i/1tc8TbA/WkCEcgDu8KUqB1kd/sFSAxvaTm/hYgz/CsMTP7rIaOH/I09X5/rYos6UVAzLVty0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784568709; c=relaxed/simple;
	bh=qw4JPuFzFFBPT4iH1s9YU2BZkhtjNYvO5TG+CT6T0gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJbpNkYSm7Y12rkNACs08uGOYnn4pM6gCSnFbPWpYrC3Qsq3MQSspoVQX/LWXJcP9wieFnHon+jfafddcajsYKblHOUXWwKCAHxayXW2wMY2xQ2JDIi3XU47bAvmZbwP7xyUQmqdyQYAQhmZCDoidzIUe3U/g6PV7B6EnVnWzlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X118h2pF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X118h2pF"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cacef7d299so387945ad.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 10:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784568699; x=1785173499; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=354gFNaVuvmOpRh2GIKgIn4uIuwVXTK+d7q38SvtQbc=;
        b=X118h2pFd8KJFw+C/7hWOxSFC9xtDLu/EWjUVThN5srI+r5yPdrdNNFDgKdNYj/OlN
         6FlamKTV5Kguep5On392Sfazq4RTWKhmboSgOZRglnSx5bNAzf9LUJobK5lLgJb6XIg4
         LlDmbpGCucR7xzN5FeFMKuKJEWGXbHyAFNyVEjM/xjnHpqj7/VrjFKuQCr3+0FNTtPN4
         RZVlAULQMTsRdxuSoZcDVYN/Oc5peuwgSWy+q3DfBkOXXJgB4rKa9ntvWdhdB1DKCPSc
         meMMTs6lj+iNjcYVnIZK/7pAThhvPvS66mv7nLMQVCqOAwNvz2cs1nHZUFuvMs4ask4C
         vFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568699; x=1785173499;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=354gFNaVuvmOpRh2GIKgIn4uIuwVXTK+d7q38SvtQbc=;
        b=sIR+DYol+DgedNTe0A3BVS76sPOfk7F1tEa75X9w2FBU4TfI9qpELGm0Rj+fkneZgA
         tj6Iz7toLCg5LO9KDYRBTGTG2IR+Z7JP2mpG/OvRtPzASnbvIIsyCpS+lOtbWyz4z/ta
         Jc6V4ebxsiU0gTKOdmK2r0kxMqkIWz18mWuho4uyLFheDTW7bXWXLNF0sxO5ksW5ukYM
         Zxmor3hAzCHdqMvbqcBe3k4FR3S/iLCbhphuDzDmkb0arYIjQ33UBDXbmc4ruTK/C0IU
         gUtieT1v0EAxcf7H3IyKlIGu8iGzXDrOJdj0qKxQt/zUiGZtBCmEqK5DTtO3weHr1CuI
         fAIw==
X-Gm-Message-State: AOJu0Yyf7xnC8/KzAxHvtMZwJietBQifs5wb8FYsTQcap1QDrpDfqssu
	QoO7XetTsM2TbGAbvO576LlInS+e/TnBYsYZ0hZ5+Ihmxe8a2F59y7pJht4/vhPFgfsWJ2VDbWF
	ZPJOs7HPD
X-Gm-Gg: AR+sD11yLKRwW1JYDNY+WPNjSL5Dr0vkEEDGIrsBF+kEnNqq6j2+OIQvMxUTyHMAbCC
	WgDMZr2XztROZH1JK56lDRFRXIGKAEUG3jiBjaoyl7v98Pd3umwKJ++pgUa/tEcAed0ijoMKMw2
	d9A0JhSUOxaOuW0H3rX+NSpgXPN8j18ClVqE+/fPWb3pMaNsEbmHOZESiZjDsO+rLvGjuYErhwS
	yb2ucMJpzFBWiSXWKaVfVHFW6EcnPTIZdgcHtmyFl0/BadhOKz6Fo8JeyFenk4PBLGW4VGSHikz
	bheukuylehieQmyIlhtPzeZtUP3cfCE4bqYl8LL5c+RFplt0M9RWWbHQTMpMHSMcA6YwVn5/RrS
	mTY5OTTaDm21GNP50Zd51LGkHtQFU1ZE8CikI6t5ux8J0S4ujbCw6/wPpphMqbEY1LpNhLKKvo7
	cBQ9vGKntTBd81OycN72KGyh/yRtJovJZFTN828j4=
X-Received: by 2002:a17:902:e349:b0:2c7:df7a:859a with SMTP id d9443c01a7336-2cf7b68e207mr1146615ad.15.1784568698588;
        Mon, 20 Jul 2026 10:31:38 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e921f2e1esm116328a91.0.2026.07.20.10.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:31:37 -0700 (PDT)
Date: Mon, 20 Jul 2026 10:31:34 -0700
From: Vipin Sharma <vipinsh@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v5 02/20] vfio: Export various helpers from VFIO
Message-ID: <20260720172344.GD1191959.vipinsh@google.com>
References: <20260714151505.3466855-1-vipinsh@google.com>
 <20260714151505.3466855-3-vipinsh@google.com>
 <20260714153051.DDBCD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714153051.DDBCD1F00A3A@smtp.kernel.org>

On Tue, Jul 14, 2026 at 03:30:51PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing EXPORT_SYMBOL_GPL for vfio_pci_ops, violating the stated intent to export the variable for other modules.
> --
> 
> --- Patch [2]: [PATCH v5 02/20] vfio: Export various helpers from VFIO ---
> commit fcee4889ab47813a22592eb00c453edea425e0f0
> Author: Vipin Sharma <vipinsh@google.com>
> 
> vfio: Export various helpers from VFIO
> 
> This commit makes several vfio helpers and the vfio_pci_ops variable globally
> visible by removing their static declarations and adding them to headers. The
> stated intent is to export these symbols for use by other modules, such as
> the upcoming live update feature.
> 
> > diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> > index 0c771064c0b84..1fb4b276afe7c 100644
> > --- a/drivers/vfio/pci/vfio_pci.c
> > +++ b/drivers/vfio/pci/vfio_pci.c
> > @@ -125,7 +125,7 @@ static int vfio_pci_open_device(struct vfio_device *core_vdev)
> >  	return 0;
> >  }
> >  
> > -static const struct vfio_device_ops vfio_pci_ops = {
> > +const struct vfio_device_ops vfio_pci_ops = {
> >  	.name		= "vfio-pci",
> 
> [Severity: Low]
> The commit message states the intent is to "Export these functions and
> variable for other modules to use them", but is there a missing
> EXPORT_SYMBOL_GPL(vfio_pci_ops) here?
> 
> The other helpers modified in this patch received an EXPORT_SYMBOL_GPL() tag,
> but vfio_pci_ops did not. Without it, external modules attempting to reference
> vfio_pci_ops will fail with unresolved symbol errors during the build.
> 

We don't need EXPORT_SYMBOL_GPL() because it is accessed in
vfio_pci_liveupdate.c which is compiled in the same module vfio-pci.ko
which has the definition.

I could have done better job in the commit message log to explain this. I
will fix it in the next version.

> >  	.init		= vfio_pci_core_init_dev,
> >  	.release	= vfio_pci_core_release_dev,
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260714151505.3466855-1-vipinsh@google.com?part=2
