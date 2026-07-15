Received: from mail-ej2-f3.google.com (mail-ej2-f3.google.com [74.125.228.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC5F3B4E87
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 22:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784153107; cv=pass; b=axaWGcB9H1bhE6PqCwmxPqAOVXKBrVU8ZfOIxqppZk9atHE59xMbWVTsBfnU37k1Yf1YRahMoc4lHr1yZKGD9X2CCuEIJ6FFcPJIAVLq8qF7QKUh/YE/XRtcbmo3+/NatbjSRsBLSchJb/toJzYa0rn6kuoLK6Og9F0pbZjURYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784153107; c=relaxed/simple;
	bh=wl/W20KdKnIqM7v6f+2D2RAhXS9EwAYkp1R56o0Q+uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QiGbkskuBCpnV00eJEKZOvEt2tEIVKUoGhFx2xzob28GwwNtW3WaFmdzn4L1srgCuRbp2unZYDRpfzpHj45adH+QSxEwTI98go57Ty88V5au2qzu7p+K7rTN/lM53q16fccMYWZ5JiH7yPvC6tG9TJltmXyqjVCFt9z/aaLGx9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qkLLslsP; arc=pass smtp.client-ip=74.125.228.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qkLLslsP"
Received: by mail-ej2-f3.google.com with SMTP id a640c23a62f3a-c160cba3944so267759266b.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 15:05:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784153104; cv=none;
        d=google.com; s=arc-20260327;
        b=FFtDFIe7wHwXtUjKMi3D93Q4jLfjD25Ks9Z9YHBFDqMjJE9oLbyffNsYHZNZp61iHs
         s3p7By8HU8FSkj9OhHhLK7XDMSIJ+7sr1Sci9HvS5IF413958WxxQTyXDva/kj1m4eeh
         OK+WXF2nJlo6mz/eCRMo85149+jryNejhb/ON4UZ2LzHCONMVBjR4WeT9JUCIDas27TN
         DBfWf41goZ1T6BXTcksnze9Ob++U7MUdZivjhMGpzwAQ8E53ExPqDfVNX9qh66HUFqKK
         8qRD6HJwR1IlvQ+p2zFe2hYUyls+onyQqVwSJJh1h3yqECMshH36LwUztGbJj/119QAC
         4WEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aQMpQFhIn857g7xLzahaS8Oo4j7adBTxb9kl7VJZy+M=;
        fh=KR5Wqcy5sj3m3NptUJG/DJo4aLqbYZIETLuRPCCv34U=;
        b=fhJ8skfMLJcV4JjNvrO74oWERxoo1pTbr6xP7BSFMP5HlbBbBsPqV2e45IfK+5wG1+
         fcUSkWCybTwZnKyMJKaIommpZs2yiSEb3bSJus8p4jMVf96xXBORLNLwIwBIM27p9Js3
         2+iDoXIv5XsRAvsILGhBxdm8xpxQtfVL3LbpkS2YR+xb9aBN8Sjw6ta6dDoHxESHHGEM
         ukKrDwZD2jLVagYw/UyF4zFB1Emk+7jr9Eb1vdWFQIVSBTP8skNKvRj9P8uKCVoqFY9G
         e9uLt2tVH67jBcLBkOOyS6MSpha4RpEHH8l2iq9dcZvBB/daHMXF44hDMRPz9w69MlsS
         Y01g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784153104; x=1784757904; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQMpQFhIn857g7xLzahaS8Oo4j7adBTxb9kl7VJZy+M=;
        b=qkLLslsPunq3v4XlEUJvFSWivHgHKzQMcwwdXagRAmDMv3i0WH4MEWaEuJl+yl1RHu
         w8PttJC7sEMe4EjCWUY0y6bCfIaBmb+BZz2tYVJxmUy+38WZisYIi6PYgG4T4lM2EQUJ
         ka46KHY4k835dm6wugCb6gakfSVt/LmPYmYJB8RXAwgyjVxwnTpvgZCxIxWBoSqetfBT
         lOc5o+YW3yoNoT1RBExYs+cnEJc2t1+bMhxEqOeKnu/z4CxIIGfdWnX6UOSVBwiJ6j9G
         RfBb5LQsU8XuKAlJN0JH4LPpdJsfw7Ymt94mU9NuEm0V3q87lNsUhclKdhXiZwsUdFzY
         NB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784153104; x=1784757904;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aQMpQFhIn857g7xLzahaS8Oo4j7adBTxb9kl7VJZy+M=;
        b=Yq4b4BtqYEffXhWSA76I1EeEQ3KZPsmdp9bTcRK8RghISOzjwLSZUmqZABRQexRGju
         agFVmk+c+NeHlj6u/iiwnUr7OH+ILVSvRAkdS6gBpYtAM1h47bvLxkpVGQD/sbUXHQ4E
         lu/tuJ9wEgBLFPrhW51p8rIfvyFB4Cqgjd+aFtFi74Ap0vUACiA9WeOpAs2ECblaJEQw
         Zq016/jNX2KpIEuluwspZASdcsjH6V1hN1R2OuR7y1tQbD7GvSzQAd5WCm3qiOU6xlrA
         sxYAvrefkColAIO2pDWDpKEBsZbqVZA1s6D0uwx88toZMkiIb/1phzgYL80KTlfNRFnY
         VoCg==
X-Gm-Message-State: AOJu0Yz84avwa3BkRY2KUpc/8G63j6NXDIRz4GYCjR59XbnKcWNDy1mb
	S2BFCNFlUB0QBDj7tgyrjoqwUbIOmT3WGrh91i1lHD5pf7XQtF4nuNWM3WGNdswUCjzWn8aegAO
	T0agt5J3dx665jq/WHojqd8j1d6DgFovOFR+BOsF9iEc0k/c=
X-Gm-Gg: AfdE7cn1vhOdyNXL9VNeawAzw4FpUxSmKUTCO3Bh6tPzpy0eMzQVEF3BB/8MGdgA08c
	TS/of9ce8/3nqzD2pUVJpHKY/+Hg1S+zssbossDMXyF8RDDG+jE0Efc/TDeJAiCNw2e7+0TDevJ
	Y6gGS8gG/1VFyOVWhvzn51+3AoBm4cmBYLbrzgtoE0vpufgds0vOUuOx/uhkaLcxDzoZG/J+Ww0
	5mu5XCRL9vzgePPbqGwMYTpqNGYnpu8t7nP67XtvXhpyaPwJRtPAK0SDbPibLZx
X-Received: by 2002:a17:907:940d:b0:c15:e956:f529 with SMTP id
 a640c23a62f3a-c167921c646mr308897966b.8.1784153103447; Wed, 15 Jul 2026
 15:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-8-coiaprant@gmail.com>
 <20260715191454.D12521F00AC4@smtp.kernel.org>
In-Reply-To: <20260715191454.D12521F00AC4@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 06:04:50 +0800
X-Gm-Features: AUfX_mzCJVaoRLkAFuMd2HDVFaZ_rNuQ-cMJT_rqC34HREB6SXQc34ycLqd-JyU
Message-ID: <CALj3r0ioKyJpcVLkeQskLqzcS_OcAbPsPxc7d7Zh9LiUprNguQ@mail.gmail.com>
Subject: Re: [RFC PATCH 07/10] net: pcs: xpcs: add Rockchip RK3568 platform
 glue driver
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	olteanv@gmail.com
Content-Type: text/plain; charset="UTF-8"

> [Severity: Low]
> Does this change cause build failures when CONFIG_PCS_XPCS=m?
>
> Replacing the composite module assignment (pcs_xpcs-y) with individual
> object assignments causes Kbuild to build separate modules instead of one
> composite module, which can lead to undefined references during modpost.
>
> > +obj-$(CONFIG_PCS_XPCS_PLATFORM) += pcs-xpcs-plat.o
> > +obj-$(CONFIG_PCS_XPCS_ROCKCHIP) += pcs-xpcs-rk.o

No. This change is intentional. pcs-xpcs-rk is a platform-specific
driver and should be built as a separate module, not linked into
the composite pcs_xpcs module. There are no undefined references.

> [ ... ]
>
> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> > new file mode 100644
> > index 0000000000000..ed969a38d544d
> > --- /dev/null
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> [ ... ]
> > +static int xpcs_rk_mdio_read_remapping(int addr, int dev, int reg)
> > +{
> > +     switch (dev) {
> > +     case MDIO_MMD_PMAPMD:
> > +             return ROCKCHIP_MMD_PMAPMD;
> > +     case MDIO_MMD_VEND2:
> > +             break;
> > +     default:
> > +             return -ENXIO;
> > +     }
> > +
> > +     switch (addr) {
> > +     case 0:
> > +             return ROCKCHIP_MMD_MII;
> > +     case 1:
> > +             return ROCKCHIP_MMD_MII1;
> [ ... ]
> > +static int xpcs_rk_mdio_write_remapping(int addr, int dev, int reg)
> > +{
> > +     switch (dev) {
> > +     case MDIO_MMD_PMAPMD:
> > +             return ROCKCHIP_MMD_PMAPMD;
> > +     case MDIO_MMD_VEND2:
> > +             break;
> > +     default:
> > +             return -ENXIO;
> > +     }
> > +
> > +     /* Writable only on MII */
> > +     switch (reg) {
> > +     case DW_VR_MII_AN_CTRL:
> > +     case DW_VR_MII_AN_INTR_STS:
> > +     case DW_VR_MII_EEE_MCTRL0:
> > +     case DW_VR_MII_EEE_MCTRL1:
> > +     case DW_VR_MII_DIG_CTRL2:
> > +             return ROCKCHIP_MMD_MII;
> > +     default:
> > +             break;
> > +     }
>
> [Severity: High]
> Can this asymmetric remapping between reads and writes cause configuration
> corruption on port 0?
>
> In xpcs_rk_mdio_write_remapping(), writes to these VEND2 registers are
> unconditionally mapped to ROCKCHIP_MMD_MII (port 0). However,
> xpcs_rk_mdio_read_remapping() lacks an equivalent redirect for reads.
>
> Because the generic XPCS driver uses read-modify-write operations on VEND2
> control registers for ports 1-3, this will result in reading from the target
> port's MMD but overwriting port 0's configuration.

No. Read remapping is performed by hardware. The VEND2 registers
reflect the settings of MII0; the corresponding bits for MII1-3 are
read-only. This is a hardware feature, not a bug.


> [ ... ]
>
> > +static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
> > +{
> > +     struct device *dev = &pxpcs->pdev->dev;
> > +     int ret;
> > +
> > +     pxpcs->csr_clk = devm_clk_get(dev, "csr");
> > +     if (IS_ERR(pxpcs->csr_clk))
> > +             return dev_err_probe(dev, PTR_ERR(pxpcs->csr_clk),
> > +                                      "Failed to get CSR clock\n");
> > +
> > +     pm_runtime_set_suspended(dev);
> > +     ret = devm_pm_runtime_enable(dev);
>
> [Severity: Medium]
> Will this leak the csr_clk if the device is removed while active?
>
> The generic devm_pm_runtime_enable() runs pm_runtime_disable() on cleanup,
> which cancels pending suspends but does not synchronously suspend an active
> device.
>
> Since this driver lacks a .remove callback to manually suspend the device,
> xpcs_rk_pm_runtime_suspend() might never be invoked on unbind, leaving the
> clock prepare and enable counts unbalanced.

You are correct. I followed the same pattern as pcs-xpcs-plat.c,
but I agree this could be a problem. I will add a .remove callback
in v2 that calls pm_runtime_force_suspend() before devres cleanup
runs, ensuring the clock enable count is balanced before clk_put().

> [Severity: Medium]
> Could this blind cast lead to type confusion?
>
> The code extracts driver data from the platform device associated with
> pcs_np without validating if the device is actually compatible with
> rockchip,rk3568-xpcs or bound to this driver.
>
> If a misconfigured device tree points to a different type of device (like
> an I2C controller), casting its drvdata to struct dw_xpcs_rk * and
> dereferencing it could crash the system.

This would only happen with a misconfigured device tree. However,
for robustness, I will add a compatible string check in v2 before
dereferencing drvdata.

> [Severity: High]
> Is there a use-after-free race condition when accessing drvdata here?
>
> This checks and dereferences pxpcs->bus before establishing a device link
> to lock the supplier.
>
> If a user concurrently unbinds the XPCS supplier driver (for example, via
> sysfs), devres will free the dw_xpcs_rk structure and clear the drvdata.
> The consumer driver might then dereference the freed pxpcs->bus before
> device_link_add() is called.

No. of_find_device_by_node() increments the reference count of the
device. The supplier cannot be unbound between of_find_device_by_node()
and put_device() because the reference count is held.

> [ ... ]
>
> > +static struct platform_driver xpcs_rk_driver = {
> > +     .probe = xpcs_rk_probe,
> > +     .driver = {
> > +             .name = "rk_xpcs-dwxpcs",
> > +             .pm = &xpcs_rk_pm_ops,
>
> [Severity: Low]
> Will this assignment cause dead code when CONFIG_PM is disabled?
>
> Assigning the dev_pm_ops structure unconditionally to the .pm field without
> the pm_ptr() wrapper results in dead code and possible compiler warnings
> when CONFIG_PM is not set, which violates the PM subsystem guidelines.

You are correct. I will use pm_ptr() to wrap the PM ops in v2.

Thanks,
Coia
