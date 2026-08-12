Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E536C32E12E;
	Wed, 12 Aug 2026 08:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786522527; cv=none; b=Q0qLJaqoEH8Apd8oHuXpoPokhTbpYn/WuPFl8AG6nZcdHlQ83f/3cjaTUxxONPIaIp/VhmCt8adbN7Y8iz3MO+Ph3INKy3RTJl+0gq5dubEso/WrHP5srbJQADEx5ObXGh2ElpfYsYUXrqQP9LUIDE0xf3dW3V/C5HiQSt3hv94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786522527; c=relaxed/simple;
	bh=9BY7ufueTNS3wdYw/+vOSPSkUrKWO4ohMTslQOu0JwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssZkJ/5kAWjeEGWCrvrIBprfl8fFEsVmXA4b2x4YrUJJJ4rLQQ88Kskil9tfdJrMeahKoIBQBS5ZoCE+e0rquAcTI379Sv3UUVPTTQK+B+mIhKLSHStGTHqBJ5lAGcVmDV7sczRz1eTVysBjQSA/j/4tE1mmsz0xDVfYJmlZXJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQuLFUDv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQuLFUDv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE961F000E9;
	Wed, 12 Aug 2026 08:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786522525;
	bh=nZtfL1kwIlkIkj/Cq5rLTRLLBqk+ImQDiZUgSiLiBpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CQuLFUDv9XLflAELJY36wwErBRpVAuJN7zcl92mvIbBcTYuxS6tdtP2HdE464CXVc
	 Fr/2zXIIzKTG6maPVbZpbQovMr2g55NmU95xS/Acsn/wOo+kuafSiEutBsbYs6vQYn
	 h5dthN6B3vIqftGHQjdvvtBYNf78ui2/saVJQbqwCxuLGy8sdvehOqagfKJBMkKvua
	 oMByjghDPbgStf44rHqUWkqzWIMJpu0g1xB/00qik2t9Rn8YD5sdvNLnN42y7llq9n
	 xXBgSeccy+vQSP2fPzcfnfS5389bfMWVIG+qv2sqATWH4BuqLpBbVFw5cPqEbF927x
	 UDYRpe3jsSgCw==
Date: Wed, 12 Aug 2026 09:15:21 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	conor+dt@kernel.org, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
Message-ID: <20260812081521.GE1072730@google.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <20260803100023.7AA1C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260803100023.7AA1C1F00A3A@smtp.kernel.org>

On Mon, 03 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The new `psci-mfd` driver lacks a `.remove` callback and does not set `.suppress_bind_attrs = true`, allowing manual unbinding via sysfs which leads to resource leaks.
> - [Low] The newly introduced MFD driver, its file, and its structures include the string 'mfd' in their names, violating subsystem conventions.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> --- Patch [4]: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for cpuidle-psci-domain cell ---
> commit 26907aee3ff3e0a5d7112a9be25ebbebb10e94c7
> Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> 
> mfd: psci-mfd: Add PSCI MFD driver for cpuidle-psci-domain cell
> 
> This commit introduces a new PSCI MFD driver to manage multiple consumers of
> the PSCI device node. It registers the cpuidle-psci-domain as a child cell
> and updates the cpuidle driver to probe as an MFD child.
> 
> > diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
> > new file mode 100644
> > index 0000000000000..7affd6bb09dd8
> > --- /dev/null
> > +++ b/drivers/mfd/psci-mfd.c
> [ ... ]
> > +static struct platform_driver psci_mfd_driver = {
> > +	.probe = psci_mfd_probe,
> > +	.driver = {
> > +		.name = "psci-mfd",
> 
> [Severity: Low]
> This isn't a bug, but does naming the driver and struct with the "mfd"
> string violate the MFD subsystem guidelines?
> 
> The MFD guidelines state not to hard-code implementation details in driver,
> struct, or device names, and to specifically avoid including the string
> "mfd" or the driver's own filename in names.
> 
> [Severity: Medium]
> Since there is no .remove callback provided in psci_mfd_driver, does this
> allow manual sysfs unbinding that could leak resources?
> 
> If a user unbinds the driver via sysfs, devres will destroy the child
> devices. Because the child driver (psci-cpuidle-domain) lacks proper
> cleanup for non-devm resources like generic PM domains, those resources
> might leak or leave dangling pointers on this administrative path.
> 
> Should .suppress_bind_attrs = true be set in the driver struct to prevent
> unsupported sysfs unbinding?
> 
> > +		.of_match_table = psci_mfd_of_match,
> > +	},
> > +};
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com?part=4

-- 
Lee Jones
