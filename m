Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8A38472
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784571204; cv=none; b=VFnHhvY+7D/0mElJQPuDJ/s1yHlINa5ZFXjBuhNjMvd+paLOV+DcXwQp4TIrwKhSSp5QuEYgkeyJzQENl7f/gvDAK25p3xR3+Czra2KoXPwRaeKGkHHMsCECYrLdBpi3RQNVopyHihwyrhfOaVrnmITXgRwEpzyfyoWvhsclysk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784571204; c=relaxed/simple;
	bh=Ynfe6G02XWaPRrihbfperCWnlNOvk+Q31z7WR7ZtVF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILkU2xmOCvgZym3XHAqkHkuKLIGP/Yx8ZiJigAPthHXqDY4MEMp7MPSeRtwCt/CAySXPnMGRqardd7bJLOHaTFF7r0ndWH5guf86oEcjTB9hlZS4iHdcY5VzGLZKRmIQU1I8gozZsi/PgfxUgsSTJ0+c2dSnySWzltdVOQKNtOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XBmYPRVQ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XBmYPRVQ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ccdf36f63dso405385ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 11:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784571202; x=1785176002; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQg5MSn5GIQMrrHb/N0B6MSuNfWqtdsH4Etxd7dMb2I=;
        b=XBmYPRVQtVQoVG55ZbJm1z2jf6T2rCg7+6vZXB4hH7k8IfO3qcB+X+EKk02gZhK5MQ
         +QzY5caaeqoi7D8k+qnw5Qdzqr9OTD51sVw9+kFOZCvyf/u5aywR+9QhBTIuZ6RdKSN7
         rowJmBakVknc4GiFyQEnn8l8sKPl79QRbXTHjpB1mbNP+33UcR/rUjjGUQZ+mbsiIuRV
         jLY6zmc+fX+qPha1B8T5tumGVB3LzUEWZ4M+dB6Xa7iYyaW18+iGwsPxnuYeYlrWSRh6
         PXmBTAQjzM36K7p5JLaKc2dIEJZ98r4sOkRvwfPsiYGr65W+jle8MOIHYC7eUNpehLqu
         qifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784571202; x=1785176002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jQg5MSn5GIQMrrHb/N0B6MSuNfWqtdsH4Etxd7dMb2I=;
        b=hTDjFITa/6YXgfQyBykfffgF2EFWSW5lbboKKpg1AP3DqGtJoCyuP1Tb8Inf7sIwGq
         pmD+ltrOds4FQPGbip+EBodq3UVhF5VSGLpn7Dvl3+FzMuSqhb81m18S17sNaympHoxH
         R8fv79qX7SzSP6R5ANEx6SL8q1XWcY2qSIwlw12vEFj20VpxobaZyzTwzmKYd+KkPi3d
         8tyorfK08YqU1AGsmZZIggS2EwlU+OxveDJyPZnfDXXC3jOWP4IxAuGBxNEsMltpJY8a
         vH1bLxUX6SVcwsIAyv2pK39guujE9X5cCUogBdxodgwZtFqgzt8t/VPytMy3Vnb6lMvp
         I8Ow==
X-Gm-Message-State: AOJu0YyTP/HJ3EqboP3yA5+ucfkL2z1jyGpaTl+JrwZczts95TgRrfVx
	nKHORJ1U6Gf5WCslX8PdSg80iqjW9K7ieu5qchm9FhStyljFXqgFKOEg8wTADO/xIVB5NTBuhfs
	it5lB6IP3YKk=
X-Gm-Gg: AR+sD12MuKziUAKbHUtuZ1YDV4TikasI9kOUJ9Y/xh50XGlncay3R6hd8i2EmyPBWKZ
	cXwUQlmfgDmD8+fMQlbrO9u/K6/xgbBdhuXi6x1P6yPE3TsTMTxAVK6uVlNkucu2cFp1fy255EE
	B6n1Rs3y3O4AhsdeC9c2ew2FZG0QUz+ip6pCRXxpBlxsqROWSsoROBw6CHgevVgInBeI0jCE8ow
	IfZzJcZNLRf/AAtHX3YlqjIJQDHUTJ2rMRcu/sYPObF0xrshqZIxQw/E5ExuIXfUhj0bJRFYKJp
	KuJ+zCx6WAV1o8Cn4j79/NK+tbWTDHD1ceMG1ngPS0yP7aVZQXNEWXutau1p3nqdrZ1GFqgHXMC
	y9LFkbOYdmOcE47kG6VKJX/OMnMiWG4StBOHz7D7vZtaofjyyNhxy8F/Bcsw3vDZ70/6BENHe9C
	0NTsWE4UeLJGoStlyhpfvWGuBtSKmgUbKqQm+m
X-Received: by 2002:a17:902:ec92:b0:2ce:f9e2:4646 with SMTP id d9443c01a7336-2cf7b71d50emr1730055ad.27.1784571170441;
        Mon, 20 Jul 2026 11:12:50 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448db72sm62309825ad.1.2026.07.20.11.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 11:12:49 -0700 (PDT)
Date: Mon, 20 Jul 2026 11:12:45 -0700
From: Vipin Sharma <vipinsh@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v5 14/20] vfio: selftests: Add
 vfio_pci_liveupdate_uapi_test
Message-ID: <20260720181201.GE1381701.vipinsh@google.com>
References: <20260714151505.3466855-1-vipinsh@google.com>
 <20260714151505.3466855-15-vipinsh@google.com>
 <20260714154402.D3C651F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714154402.D3C651F000E9@smtp.kernel.org>

On Tue, Jul 14, 2026 at 03:44:02PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The selftest `vfio_pci_liveupdate_uapi_test.c` fails to compile and link due to missing headers, libraries, and undefined functions.
> --
> 
> --- Patch [14]: [PATCH v5 14/20] vfio: selftests: Add vfio_pci_liveupdate_uapi_test ---
> commit 4ef2d85343eb23f4f743330b67aabe0e09e08f3d
> Author: David Matlack <dmatlack@google.com>
> 
> vfio: selftests: Add vfio_pci_liveupdate_uapi_test
> 
> This commit adds a selftest to exercise preserving various VFIO files
> through /dev/liveupdate. It verifies that VFIO cdev device files can be
> preserved while group-based device files, group files, and container files
> fail.
> 
> > diff --git a/tools/testing/selftests/vfio/vfio_pci_liveupdate_uapi_test.c b/tools/testing/selftests/vfio/vfio_pci_liveupdate_uapi_test.c
> > new file mode 100644
> > index 0000000000000..f81c8ab21db3f
> > --- /dev/null
> > +++ b/tools/testing/selftests/vfio/vfio_pci_liveupdate_uapi_test.c
> > @@ -0,0 +1,97 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +
> > +#include <libliveupdate.h>
> 
> [Severity: Low]
> Does this header file exist in the tree? The build fails because
> <libliveupdate.h> cannot be found. 
> 
> Additionally, is the Makefile missing an include for
> ../liveupdate/lib/libliveupdate.mk to ensure the dependencies are properly
> pulled in for the build?

This series is built on top of in-progress Live Update series.
https://lore.kernel.org/linux-pci/20260710212616.1351130-1-dmatlack@google.com/

Same for the other issue below.

> 
> > +#include <libvfio.h>
> > +#include <kselftest_harness.h>
> 
> [ ... ]
> 
> > +TEST_F(vfio_pci_liveupdate_uapi_test, preserve_device)
> > +{
> > +	int ret;
> > +
> > +	ret = luo_session_preserve_fd(self->session_fd, self->device->fd, 0);
> 
> [Severity: Low]
> Is this calling a kernel-space function from a user-space selftest?
> 
> Looking at the code, luo_session_preserve_fd() appears to be defined in
> kernel/liveupdate/luo_session.c. Since this is a user-space selftest,
> calling it here results in an undefined reference during compilation. 
> 
> Should this be invoking an ioctl directly, or is there a user-space library
> wrapper intended to be used instead?
> 
> > +
> > +	/* Preservation should only be supported for VFIO cdev files. */
> > +	ASSERT_EQ(ret, self->iommu->iommufd ? 0 : -ENOENT);
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260714151505.3466855-1-vipinsh@google.com?part=14
