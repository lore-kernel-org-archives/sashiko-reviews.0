Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270CF3C1D42;
	Wed, 29 Jul 2026 15:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340301; cv=none; b=TEyQC7J0o3qpNTZ/DBTiDcfKIr/rUatQOsMnqNIbOCPhLqL74Ai7Iwqbc3PeKzSRvkiENFpjLeuIchNaIVKF8nZkVIkfJDb7O1Pkd+HUSi1fi1WINF2MQzfnF0VH+r2PP1225CibVZPSvmPt69tHp5yjYKtXB6kJlenQQKOs+M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340301; c=relaxed/simple;
	bh=ArMm/6amqL3gg4HQXIbEF+HJZIIu0p4GexKLNdrx5l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nACw4HMt8dk6buueDmXX2qE2+9UKfOpXQEDAFMmiEckElDnRnX9rX/ngmzVEbR1uztjFqHtWv8j/IndkHXNyeLTp6h/mrQXyBZXpPewp/f7HI2ro/bbflEN55+OVymfAYj6I5gNAclJbP9As8/FAz86TMELlRmr02E5+1BAJQ/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFFYdS/e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFFYdS/e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A955E1F000E9;
	Wed, 29 Jul 2026 15:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785340299;
	bh=iW6++TsjsjkHVWeS+D4H1852AWqORztvK6zBY0Nmi1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iFFYdS/eRmw1AtZ0pXDcFy2jjzYONtoxY17oelWuQmyEDhOkG4NASfnS6kuWFQByV
	 0hsPg9lLQc0xs0MzA/pucX1whYc3gqk/5MAs1OZDjUs4AwQwdqxY6gZLub3tHNogpE
	 dBVzWxxBhxHuLjJlyMYPqwyEV+juntfwYWwER0w8AeP6aGcTjZiZvF7xirxjFrjERN
	 /ER66FEyU0IDYy0kHjB8dUKLNI0Oho6xmsvpfEzSKGWyuuK16RA9j1ghHURgeoudq8
	 nrnV311BCTOAnMnGlvhxZ8lIav1DYT05u94ivhf5SWbbyHyvmSfEPO0qxokrt9XrZa
	 5aVzpOxlRrTlg==
Date: Wed, 29 Jul 2026 08:51:38 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
	robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com,
	vkoul@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: add a driver for T-Head TH1520 USB PHY
Message-ID: <amohirbdNtDLtXeH@x1>
References: <20260723084316.3573714-1-zhengxingda@iscas.ac.cn>
 <20260723084316.3573714-3-zhengxingda@iscas.ac.cn>
 <20260723085527.BDB5A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723085527.BDB5A1F000E9@smtp.kernel.org>

On Thu, Jul 23, 2026 at 08:55:27AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing explicit inclusion of `<linux/delay.h>` for `udelay()`.
[..]
> > +static int th1520_usb_phy_init(struct phy *phy)
> > +{
> > +	struct th1520_usb_phy *th1520_phy = phy_get_drvdata(phy);
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(th1520_phy->ref_clk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = reset_control_assert(th1520_phy->phy_reset);
> > +	if (ret)
> > +		goto err_disable_clk;
> > +
> > +	/*
> > +	 * Do some initial PHY setup:
> > +	 * - Set COMMONONN to allow the PHY to automatically power down.
> > +	 * - Set REF_SSP_EN to enable feeding reference clock to SuperSpeed
> > +	 *   PHY clock PLL.
> > +	 */
> > +	regmap_set_bits(th1520_phy->regmap, USB_SYS, USB_SYS_COMMONONN);
> > +	regmap_set_bits(th1520_phy->regmap, USB_SSP_EN, USB_SSP_EN_REF_SSP_EN);
> > +
> > +	ret = reset_control_deassert(th1520_phy->phy_reset);
> > +	if (ret)
> > +		goto err_disable_clk;
> > +
> > +	udelay(10);
> 
> [Severity: Low]
> This isn't a bug, but this code uses udelay() without explicitly including
> <linux/delay.h>.
> 
> While it currently compiles due to indirect inclusions, should the header be
> explicitly included to prevent build failures if the include chain is later
> refactored?

I noticed that checkpatch complains about 'udelay()':

CHECK: usleep_range is preferred over udelay; see function description
of usleep_range() and udelay().

However, it seems that fsleep(10) may be a better choice than
usleep_range(). It is used by phy-snps-eusb2.c, phy-rzg3e-usb3.c and
phy-exynos5-usbdrd.c.

From include/linux/delay.h:

static inline void fsleep(unsigned long usecs)
{
        if (usecs <= 10)
                udelay(usecs);
        else if (usecs < USLEEP_RANGE_UPPER_BOUND)
                usleep_range(usecs, usecs + (usecs >> max_slack_shift));
        else
                msleep(DIV_ROUND_UP(usecs, USEC_PER_MSEC));
}

Thanks,
Drew
