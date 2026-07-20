Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291BD31AF1B
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 18:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784572426; cv=none; b=rB6+zwb0X65RKI84OqMgE/fCO5z1vvmFUCL0DSVp/hPcGUDxWwyyY1f40soSnf1PFNX8frn9EwKqLgIXvpl3GeTmCZmo2lliUTjiFCawh7MuqUS+Arw1bw9KLapj57w9ZEMEg63ocgKyi9Y3n5Wg2aOYkgdWhzZWJsnU8BuC4Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784572426; c=relaxed/simple;
	bh=CzRT3xMj8yG5S1v+ToPB3HBCkkmQKdbdC8TM0Ehbm1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uX9qZ/M8s+OlH5AEzh4jIPaBwQWY2WEIf2GNcH9zVR9VR2d8h51Nn4LKdL2ftAS3vhi3k+iJWnUL0XKfsbBAoXaJKsia3130Z5o2LWcXDx5xmlohDMOoUR3L8ZbPEbpT9KqVzVH/4kf7BP0Leotn7JxpV+P9YMCDy9uHl5qOpbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mtnTzHdv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mtnTzHdv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ccdf36f63dso409085ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 11:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784572424; x=1785177224; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3MZcjKOaWcWRrEDWjms3JoYJ25WsY0RZ3KRMLZHlqLM=;
        b=mtnTzHdv+6Qf8xbgQ3mKH5jY7pLSkJNMxTlS+bfPNNyAqqcxMH+7zRim71qrBsBaeb
         y8NwBsMftyIMyUFNoW+6C3Yx5RbyjZqmCUYiGvWgh/hd1GRw/OR3QRbdXONscnX1lblz
         IOKcZJD7eS8dOmT++5Lxi87ISuwrVWM010XN5cb/iM7p7TpY07p+fR1WK3XIzYV0KLAH
         GcRcMN8PODZxSfT3aDS0oOYBd9YTA/tjst1DT4QK8VZOn1VlLDAEORUCz5V+T8Y9h/8k
         RPYHtlS550LTobeiw64+IFyk76TjNj1ooWkLAhfJb63D7hYGl3CWft63ARl4NNpm13Ee
         lInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784572424; x=1785177224;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3MZcjKOaWcWRrEDWjms3JoYJ25WsY0RZ3KRMLZHlqLM=;
        b=j7zjeR3GEq3FKJWp5SbXKsFVXyqQvnl8VuZu0OfekY3p96RzYI7o3at1b1P4tgTWlV
         oQrDQe7b+d2QclHpbLe6glESfbd3vTaL5TKPensUwsIamFncPfKIbfJuEGgXv9+07yqa
         1RrdznkEPl2Ujz4wEE77hT9ZaxsZxutRrRppaPNI0uUUwuGe/upjoDSnVAUGS6Smm4KF
         gPQIumYHfPNOMG8eYV75yvXO9BH8z9BL8H+9UyUShvqjmiyA5Yb3yPgNdVuTjRGpNg2L
         mpm1RfhrzOXyjybzVQV1IwOUnPstb3QJ7MgNXuE7CnuFusFXHTzhd/oUBSC5FaemYLVw
         73sQ==
X-Gm-Message-State: AOJu0YzLviuWlquIoI/UUDzWWWv7Bytbi2u9E6y9yVZObzHsnIgf0Yp/
	7UMkpxXpd9MMKWX6PpuJtZb85qvpmuW7p4/j+sivWaRGa6zg5BSNPGiPJwzuNQBNuj3FgQRfG/q
	HbqsAWdPm
X-Gm-Gg: AR+sD13VeyyBAv+KlCCV+nbXoWWiiVVnS/v451EMPfCEwVcPXYCtQVq0JOZc3JMJ1ou
	GwsjcB5+LdNKsIk81DzTeCFa6+1gISWiuVosZydesNPImhYN80HQs1qN92LFZ2T5J17OPuweuwd
	L7tzGSlWs7kjBISoYf1H9k3zvM1nWy+Ng90oKmIXOe/6NBWX/VcJcKuZQzAIhyYdd0Qv1C4bYvB
	NVu2tl7xeJvR9xXCmuTS0viA3nR9QCoY+gKyrQSXZavBljl8+OlC0BWbOFfwdxI/7Qy6DqXo/l4
	I4+WXtjHnWFgrcSL+XWd0e0VEtBow9B77SWOymyyFGP63SEh79dj9WUPF+WhHz3GUyPcpFG/+tI
	W6tbjXGEgk7fl0f1qQGoyCoCUIWC47n/vPN7gXEgalcKn+sPnIXssj1QQGlHpjZTIDJwAQM8BkF
	Z/ifhTezUO75hjrEI8mGg4tq1nLgja7glPWT7ZYO4=
X-Received: by 2002:a17:902:d091:b0:2bd:6dad:7ccd with SMTP id d9443c01a7336-2cf7b6febffmr1448145ad.25.1784572424013;
        Mon, 20 Jul 2026 11:33:44 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3471f42csm61098845ad.61.2026.07.20.11.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 11:33:43 -0700 (PDT)
Date: Mon, 20 Jul 2026 11:33:38 -0700
From: Vipin Sharma <vipinsh@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v5 20/20] vfio: selftests: Add continuous DMA to
 vfio_pci_liveupdate_kexec_test
Message-ID: <20260720182853.GH1381701.vipinsh@google.com>
References: <20260714151505.3466855-1-vipinsh@google.com>
 <20260714151505.3466855-21-vipinsh@google.com>
 <20260714153740.CBA041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714153740.CBA041F000E9@smtp.kernel.org>

On Tue, Jul 14, 2026 at 03:37:40PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Partial initialization of DMA buffers in dma_memcpy_start().
> --
> 
> --- Patch [20]: [PATCH v5 20/20] vfio: selftests: Add continuous DMA to vfio_pci_liveupdate_kexec_test ---
> Note: Due to system recitation restrictions, this report does not use the standard inline diff quoting format. The findings are instead summarized below without quoting the original patch code.
> 
> commit 123ec8cfeb386e8660107c771eabe7ddc5cba029
> Author: David Matlack <dmatlack@google.com>
> 
> vfio: selftests: Add continuous DMA to vfio_pci_liveupdate_kexec_test
> 
> This commit adds a long-running DMA memcpy operation to the VFIO PCI live
> update kexec test. It ensures that active device DMAs during a live update do
> not cause system instability, even though the DMAs are currently expected to
> be dropped.
> 
> [Severity: Medium]
> In tools/testing/selftests/vfio/vfio_pci_liveupdate_kexec_test.c, looking at
> the dma_memcpy_start() function, the buffer initialization seems incomplete.
> 
> The code calculates the transfer size and sets the destination pointer, but
> then calls memset() on the source and destination buffers using 'size / 2'
> instead of 'size'. Immediately after, vfio_pci_driver_memcpy_start() is
> kicked off using the full 'size'.
> 
> Does this code unintentionally leave the second half of the DMA buffers
> uninitialized? While the test does not currently verify the transferred data
> since iommufd preservation is unsupported, will this partial initialization
> cause false positives or negatives once the test is expanded to validate the
> completed DMA operations?
> 

It is an issue, even though we are not verifying the copied data yet.

I will fix it in the next version.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260714151505.3466855-1-vipinsh@google.com?part=20
