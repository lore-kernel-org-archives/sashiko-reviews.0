Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ACD4302F1
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108016; cv=none; b=tJ7U7BPCiD3tyTM0d00wnJvgJG84exEquPXcWaEJR5hg1zVlRybGlDbdwkDy466anXlcAmyAaU/uYMxMjP56JNBZ4dI539DDlJLIMyi3bllRKzsh5v5yB6mE+AORQUnVBdgJ0R130/vJIVWrtwSxBIui4sRR+GohFyE06ockvqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108016; c=relaxed/simple;
	bh=RDX1Uo9WlVNnTxYEtR2+gBUgrmWDdLhar2YbSB4dzGw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kN/wcj0eRIDMaibDRXiAhcNduQRBtnSBHtD1cqUyo8tFhOSvGhpCSfY76H9Po1yQ1tE20f/HhZcK5B+5KzlLF+957ZKh1ixcgEsEPB1os6jdA2U0fEmWIsAMoUJtUTWWU8g0aLs1SKRZYCNRDb5a5xN4hrSROaJnBDzASQDCV6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9adETue; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9adETue"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-448b89f700fso3180402fac.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 02:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784108008; x=1784712808; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qpKE0Ztd8LwTs3URtxw/L1Mr92CYYHr0Elkx6ZybgOo=;
        b=M9adETuenm8J6Q4IeIBt+v846LdFGe0URGh00y3ZphhS1l2unwLlJm/iSWRVO82dlq
         vbRiYmH8VN12mDQkTlyqnLvfVtRg3+IOXDLTAFfULNxWWr+x+kSmRISahssZTA1p4VCx
         jnIrdRJvUhqMX9InA/fIMi3nOCS1rXEjhqa28vGO7lxRHFHHjzN4jLFpMZl+zKJrTCpe
         zghUsVPXZF3hzt/4e0cbKdwwDkXAsGh1wgNK8IptcMv/rCMThNW1HFNSrdtnsjLvtm/y
         m1sEhUyPDIkpM0CDZQotchN+LNP6wYvNaxrxHgkx9oMPq9a7MkO2xg95R7xQYQzpg4Sk
         /jGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108008; x=1784712808;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qpKE0Ztd8LwTs3URtxw/L1Mr92CYYHr0Elkx6ZybgOo=;
        b=b2oiU3fB4NONYwEW4BaVfzbqZ3lDkCzuIw7Gl49REeC9zpHQ97QMl/gTHuv5rtCUsN
         aMgsBxcYqvfLPDOe22KqMk2AoIj5oW75Z0AvUZmxRQ41+qZU/UJXInphFTr2ZA/rN9Nr
         aM32yLh5MBg1f7VMn6j3Z83omyPvD3/Z/26NqBa1qCm6Fq/8Yxdd+0KYCsiARPE3S4KB
         JLm7txqyc8m5TR8QFI4ClYkV5XZYLzcQrzHFg7CCrroiTW61SyZsybmzKV/XKZw/aL5g
         Nnxl6+A8hZ+4+lpI8wrWpSc+nOA6JQ9M04KMWcn9trCW2GvISCifC78+SNK0TIdQHlvv
         fSDg==
X-Gm-Message-State: AOJu0YzUEGuysUZ6bM0RQ2H4eRkpoOd85BOFwSdJiBp8xyJweQ/A58hZ
	g/z/DlkYzID7z0SEVT1ppXGm3EL/5qSKMibUGWw2N0D8afK3eAKxFe0pP7QXiRz5uXA=
X-Gm-Gg: AfdE7cnMkr56BPv0LqqyVcaYOP7avBRvFTxn7zj/tMf6pLLQhTcFaGztPnHhR/DTLyb
	L68PhsPYbK0SMGY9VLrL9M33QzWHVYgZ9CBq7aAx35i3H2XrDPGjumyHqnO2QAlMFFyVNmz/gKs
	lqX6qvGmMjuUFP8nC+TJodctAsnL3Sm94Xt+j9MHsyYWMMiRANnNP3PsdrpU4YADXGMae5hX+q9
	9X9tsa5QzifEdISdoYc+PVGBxXnCU+jMgJl0ZHQ8sjw8iL5gi8fOg6ezy3agJqV5DC0+LpU4sOC
	T+Ttl4UZcArfSN5vYaffEjkdDc21/aojI8Jbd0ckYJjOPXlSxuoCNK0Li6QM/i2Qba1jGcm/7dA
	/kU8kRYUcxTcnvzDdxUyfHfHaz5AmUx9dNw1wlO49V7rPYc0/ac+0GfEUxgjy+9jnuLPECvH/AT
	c6aBtG5MnMbIIX4leWNNt/MSaYGcjBlRq6suYOLtxhpE0=
X-Received: by 2002:a05:6870:d32b:b0:448:6ba8:be6f with SMTP id 586e51a60fabf-4562b4c48f0mr1353839fac.19.1784108007743;
        Wed, 15 Jul 2026 02:33:27 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:6::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-455ad91df9esm9770592fac.9.2026.07.15.02.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:33:27 -0700 (PDT)
Date: Wed, 15 Jul 2026 02:33:24 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH net-next v5 3/3] selftests/net: devmem.py: add
 check_rx_large_niov
Message-ID: <aldT5PnKUFHTlCkg@devvm29614.prn0.facebook.com>
References: <20260708-tcpdm-large-niovs-v5-0-34bf6fac941b@meta.com>
 <20260708-tcpdm-large-niovs-v5-3-34bf6fac941b@meta.com>
 <20260710072712.0F50B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710072712.0F50B1F000E9@smtp.kernel.org>

On Fri, Jul 10, 2026 at 07:27:11AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Unhandled Python exception in selftests when hugepages are disabled or sysctl is read-only.
> --
> 
> --- Patch [3]: [PATCH net-next v5 3/3] selftests/net: devmem.py: add check_rx_large_niov ---
> commit c6680f91b9c04fa78f7d8b9d5f92ce1bee9816c1
> Author: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> selftests/net: devmem.py: add check_rx_large_niov
> 
> This commit adds a new devmem test case for binding a dmabuf with a 16K
> rx-buf-size. It also sweeps various RX payload sizes across the niov boundary
> to exercise the sub-niov, exact-niov, and multi-niov RX paths.
> 
> > diff --git a/tools/testing/selftests/drivers/net/hw/devmem_lib.py b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> > --- a/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> > +++ b/tools/testing/selftests/drivers/net/hw/devmem_lib.py
> 
> [ ... ]
> 
> > +def run_rx_large_niov(cfg):
> > +    """Run the devmem RX test with a large niov (rx-buf-size > PAGE_SIZE).
> > +
> > +    Sweep payload sizes that straddle the niov boundary: below, equal to,
> > +    and above rx_buf_size, to exercise sub-niov, exact-niov, and multi-niov
> > +    RX paths.
> > +    """
> > +    hp_file = "/proc/sys/vm/nr_hugepages"
> > +    with open(hp_file, 'r+', encoding='utf-8') as f:
> 
> [Severity: Medium]
> Will this crash with an unhandled exception on systems without hugepages
> enabled or when run without write permissions to /proc/sys?
> 
> If the system was compiled without CONFIG_HUGETLB_PAGE=y, opening this file
> will throw a FileNotFoundError, causing the kselftest framework to report a
> test failure rather than gracefully skipping. 
> 
> Could this be wrapped in a try/except block to catch these exceptions and
> raise KsftSkipEx instead?

Do we usually defend against kernels not using the config (in this case,
selftests/drivers/net/hw/config)? Maybe should be a skip? We do already
use this pattern in iou-zcrx.py and nk_qlease.py.

Best,
Bobby
