Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CA8342CBA
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 20:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786739533; cv=none; b=djU3LCbE3QgechyYelc9joay3zYqh6DN/knzq0UfXM59CZleHFg+Y8CDfoljgqFPrzKxYuzVRpo1hzG/z0p5fAIQR6U7decRF+SZmjL7cceVIzkgfP6oGjvzEX1BV7BpWgLrSPsUIHpto7Rf0kpNe7tQkf77RBsf6+TQPL9nGIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786739533; c=relaxed/simple;
	bh=MK/2wvBExvaRorwp7Kd0NgP5LRlZ05gKnlm2NTq2DwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OfZS7W1A0XC8bWQUMlF5BZ+l29AAIKonF/GWh0ECnPbtXLE3uCrkW4hvH5qTv5kMq9MHFeOIYWHz6hQCrfdK5MzZokVkeu0sWHed3WOPjfb8/N6ny8Eeb8v7zI6Asc4y5/+WVEeJQyEC6Lp4VjAxMN/ypEcdIgpqv194yBOTSlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QiHJBOJk; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QiHJBOJk"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so1078310b3a.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 13:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786739529; x=1787344329; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gHMgqR5xaH+LzeveXaQjYX4+JDNDzjOWZYfupv8kpk=;
        b=QiHJBOJkNY1V0DizOZNTrbqQ4TEoNoPV1oQJv/h4XmeoQQnURJjOepQVRL31KcdLFv
         8SzI+sNqYx2NLoKfNAjc6yWBg63J3QfGcLmQm422rkNJZ9ya/8JtxBDKyJzggSZBZIM5
         F0dkJWLH72NDk6mysNYeuflDyMC0DnpzqfxIzEN68lOQzgKBgbkqG6LNUF3ja58SGOlS
         ia6l0i/IWkGs+0oTyt/6S1yaxxwYKQHmdbTBZo1dlG+ltoDb9lUCCoSut6g289WgnunX
         PjXk8fibK1BS4dormXQvvEH0TXHJmKT98mjx2zSV1XNww89c5LwjSm8WUbhh1kvYaIfG
         Wshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786739529; x=1787344329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3gHMgqR5xaH+LzeveXaQjYX4+JDNDzjOWZYfupv8kpk=;
        b=Tl3aAchTdsZJ5CS4i0VtZqKuREWrLIPv6xMPhHfo9N8o2nBltFe4alobhArrwT6Cjj
         l5ESx1iGHunDB6kibCcnt+526u0B0ASbchfc3V51+jZaxAb/6OpfCYvrC5XbW/UI0Wcy
         cxrOMwn/5LQvUy7xPXvM44NG32Y5rbbv7Dn9s8B1R9oybapXj/A81IuImCohhL/7iWaU
         moeqNNUlNPpopPe0T0yLgNhhyZsEyL5k/qrw1uFJv2mf9kTFfl70nuaxpQgK4y2DR//0
         qPQ5GpLvIAeokmTazrgitnk08H9I5cTobc68w7Fkovu4f+XpEgf+r1smKg6hj83kEZGt
         1L/w==
X-Gm-Message-State: AOJu0YxwSqp1yU3o/wlcfaivD2m1x3/4nixb8wk1KQVxX4/Z+jwu0D6Z
	IF91pc9d+ROKpWUFIWDu21godb6aSa/TC+GLGyuziyKZnJ21DVH7gz8lgtzwlE6aefdzkZ3wFXW
	MElf/6Q==
X-Gm-Gg: AR+sD12r6mhjQxOh+Xcnx37o7gYaGF0TUUZEUH5ycl3MLL8xPmUOIQbBsvtDa4aNJ3P
	JMQ0++mrYtJePHKUnD96YDkVuUBk6DKvJffq/2ycKiDPYzg57grf0AOf9uZ3Hm6sSE0iXTdWLpy
	x4DyuxDUAFqUhiFOuZ86Zt/EVWl8VtBE9ehjIJ2rw+YVPm1RRX3ZcAptny8fP3TqQc7Sdab5rIP
	aA+FNMDkGZ0d49JWaNO9r6IHTCN8Y+2QoQzIs6DQMrKcZed//NHs1k9ydC3rbOkiKF07xpCc8zC
	PWvUDckruY4C3nUi9D/7YkgR71EiQ97SGtChq7QOoH32Rzm0rl1kokRGZtyhNUsUlx2PWB3boWj
	K5cEk+smZH4iDMr4kxIevroPc+v2IgRxwD6m2gRMUQ2Edvq4F4OWZ9IB3MXB4J+WG2buhVwEUwj
	9Fj4EcMA+qqX9K7luDcWypUi+uQR6ER4a1epfjuk73G0gzLxYjDywXTXBlEvHPP1AJ5eGjSMFTS
	zNCqQi8512A4CS1WjEwcC9dXwq4fIeTSIyuZTIdzg==
X-Received: by 2002:a05:6a00:14cd:b0:84e:1a9d:d879 with SMTP id d2e1a72fcca58-84fde32a11emr9358821b3a.28.1786739528814;
        Fri, 14 Aug 2026 13:32:08 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm970844b3a.27.2026.08.14.13.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 13:32:08 -0700 (PDT)
Date: Fri, 14 Aug 2026 20:32:05 +0000
From: David Matlack <dmatlack@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Aaron Lewis <aaronlewis@google.com>, kvm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] vfio: selftests: Introduce
 vfio_dma_mapping_perf_test
Message-ID: <an97Ra3XXqqgnWJu@google.com>
References: <20260804165748.1060476-1-aaronlewis@google.com>
 <20260804165748.1060476-3-aaronlewis@google.com>
 <20260804171540.F09C11F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260804171540.F09C11F00A3E@smtp.kernel.org>

On 2026-08-04 05:15 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The `TIME` macro can clobber `errno` before the caller evaluates it.
> - [Low] Diagnostic output uses `printf` instead of `TH_LOG` or `ksft_print_msg`, violating the Test Anything Protocol (TAP) format.
> --
> 
> --- Patch [2]: [PATCH v2 2/4] vfio: selftests: Introduce vfio_dma_mapping_perf_test ---
> commit 3d215ae55639b2f45faac3bfc752e16beff09489
> Author: Aaron Lewis <aaronlewis@google.com>
> 
> vfio: selftests: Introduce vfio_dma_mapping_perf_test
>     
> Introduce vfio_dma_mapping_perf_test to aid in latency testing. Rather
> than a traditional pass/fail test, which tends to be flaky when
> enforcing latency bounds, this test directly reports the latency of
> various stages in the mapping and unmapping process.
> 
> > diff --git a/tools/testing/selftests/vfio/lib/include/libvfio.h b/tools/testing/selftests/vfio/lib/include/libvfio.h
> > index 07862b470777b..cf322b499cfba 100644
> > --- a/tools/testing/selftests/vfio/lib/include/libvfio.h
> > +++ b/tools/testing/selftests/vfio/lib/include/libvfio.h
> 
> [ ... ]
> 
> > @@ -9,6 +9,34 @@
> >  #include <libvfio/vfio_pci_device.h>
> >  #include <libvfio/vfio_pci_driver.h>
> >  
> > +#include <stdint.h>
> > +#include <time.h>
> > +#include <linux/time64.h>
> 
> [ ... ]
> 
> > +static inline uint64_t timer_elapsed_ns(struct timespec start)
> > +{
> > +	struct timespec end;
> > +
> > +	clock_gettime(CLOCK_MONOTONIC, &end);
> > +
> > +	return (uint64_t)(end.tv_sec - start.tv_sec) * NSEC_PER_SEC +
> > +	       (uint64_t)(end.tv_nsec - start.tv_nsec);
> > +}
> > +
> > +#define TIME(_name, _expression) do {				   \
> > +	struct timespec __start;				   \
> > +								   \
> > +	timer_start(&__start);					   \
> > +	_expression;						   \
> > +	printf(_name " = %.2lfms\n",				   \
> 
> [Severity: Medium]
> Can this TIME macro clobber errno before the caller evaluates it?
> 
> If the target _expression (like mmap) fails and sets errno, the macro then
> calls clock_gettime() inside timer_elapsed_ns() and printf(). These libc
> functions can modify errno, causing the caller to read an incorrect errno
> value.
> 
> For example, this happens in dma_map_unmap(), where the SKIP() check reads
> errno after mmap() is executed through this macro:
> 
> tools/testing/selftests/vfio/vfio_dma_mapping_perf_test.c:dma_map_unmap() {
>     ...
>     TIME("mmap",
>          region.vaddr = mmap(NULL, size, PROT_READ | PROT_WRITE, flags, -1, 0));
> 
>     /* Skip the test if there aren't enough HugeTLB pages available. */
>     if (flags & MAP_HUGETLB && region.vaddr == MAP_FAILED)
>         SKIP(return, "mmap() failed: %s (%d)\n", strerror(errno), errno);
>     ...
> }

Please fix this. Something like this?

#define TIME(_name, _expression) do {				   \
	struct timespec __start;				   \
	int __errno;						   \
								   \
	timer_start(&__start);					   \
	_expression;						   \
	__errno = errno;					   \
	printf(_name " = %.2lfms\n",				   \
	       (double)timer_elapsed_ns(__start) / NSEC_PER_MSEC); \
	errno = __errno;					   \
} while (0)

> [Severity: Low]
> Does this output violate the Test Anything Protocol (TAP) format?
> 
> Since it outputs directly to stdout without the TAP diagnostic prefix
> ("# "), it might confuse TAP parsers. Would it be better to use TH_LOG() or
> ksft_print_msg() here?

TH_LOG() requires defining TH_LOG_ENABLED to get the logs. I don't think
we need that kind of on/off switch for the timing logs; they should
always be on. ksft_print_msg() looks like it would work for getting
these results printed without breaking TAP parsers.

> 
> > +	       (double)timer_elapsed_ns(__start) / NSEC_PER_MSEC); \
> > +} while (0)
> > +
> 
> > diff --git a/tools/testing/selftests/vfio/vfio_dma_mapping_perf_test.c b/tools/testing/selftests/vfio/vfio_dma_mapping_perf_test.c
> > new file mode 100644
> > index 0000000000000..26c04cabef616
> > --- /dev/null
> > +++ b/tools/testing/selftests/vfio/vfio_dma_mapping_perf_test.c
> 
> [ ... ]
> 
> > +TEST_F(vfio_dma_mapping_perf_test, dma_map_unmap)
> > +{
> > +	const u64 size = SZ_1G;
> > +	const int flags = variant->mmap_flags;
> > +	struct dma_region region;
> > +
> > +	printf("mmap size = %lluG\n", (unsigned long long)(size / SZ_1G));
> 
> [Severity: Low]
> Similar to the TIME macro above, does this directly output to stdout without
> the TAP diagnostic prefix?
> 
> Using ksft_print_msg() or TH_LOG() instead would ensure the diagnostic output
> complies with the TAP specification.

Let's use ksft_print_msg().

> > +
> > +	TIME("mmap",
> > +	     region.vaddr = mmap(NULL, size, PROT_READ | PROT_WRITE, flags, -1, 0));
> > +
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260804165748.1060476-1-aaronlewis@google.com?part=2
> 
