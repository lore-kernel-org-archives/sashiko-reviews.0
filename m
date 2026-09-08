Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D804559B67D
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 17:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889538; cv=none; b=fEZt7PKCUZkzgP4p6T2taSP/Tn5QVpKuufyWY/dqkWw6+5N9XlCIV7csartjcue+KzbvVjWxvGghPP42Qh9i69CXPONYTopuKxKWdu5XCFScacEJ9dIVznxCUv65Ev+StGhm7OAKPQGXEyQPM4CjDlmcJNy9oVJpcsMgz3FY0gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889538; c=relaxed/simple;
	bh=3j6z46JE/64hFT3id7t0B9GpbJsjgyzExR0kDeIoi1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dr2uso1gkOpy3RbvaqBAb5cS+wNXQXYdbvGKJA0BMSbE4EuVUZH5JxmjDiNepDmaUxUQEJD8gOnFHAQRoa2LGbOW5VpsjhAo0qgqtU4ms/dDTHJVGc6kKu+el4BLR4E8JkBsMbUDHDTIydiRhs/T5cC9FABKXQNLGDoMjHb7odY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQyQ02Pn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MxV8Gjt/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQyQ02Pn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MxV8Gjt/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdZ4f2899274
	for <sashiko-reviews@lists.linux.dev>; Tue, 8 Sep 2026 17:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	St/Sk9a+p3XhMP4xZTJv7PZaeP9BSabCb1wIv9/ECMc=; b=KQyQ02PniihoxDBs
	jD6xRVY48ta1jVKYV37M6PENab+d3OFQzhmYB8ggOx3AheWtPtwxvMxuZGyUx2AW
	+0yTx8vrVTRosXuvFoRDox/D035EF2U1Fy+brNFBS97hSKBNutSkrndVuECh6VPk
	5uZkGL+YzE2m2RX4aRDUr23a1e++hm4gIl0zOn0uaEKcZ9gvxtkQT8yQ0x/gwleO
	5SdkM/fr5MkIdiOBdo/0cuFqjTXDRl7jWl5uWce09Z386PM8R+hJQTClIi2PnAfK
	BywdULIPdzu1rg/N8g3bSRn7FrHbP37iIi1x1oSEcOBGWPX/OMil6gupwTMPJemO
	6UxFnA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvuk0qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 17:45:34 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39b6416441eso4437042a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 10:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788889529; x=1789494329; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=St/Sk9a+p3XhMP4xZTJv7PZaeP9BSabCb1wIv9/ECMc=;
        b=MxV8Gjt/7IF73FqGr/5evxoagvvBtK2oGCpmDoBaCUDtMwesY+IXodJ8Zl+v7umVFP
         TF5Gv57j65pSsDPo3BUgUvH70ka5r8odmLBSxYHLCuR9vJenjBrkY3/NOyatKNgS3LmA
         FsupwZtqCg/D12Uf/fBYZjkPuq9b+mgI51S8Dc0RWYmp8TYltZtwYL8DEI1H/DrQGMmw
         e8Q0dkU5llkEUxlHsBfLVaXyuI2NlaYv5KNKx7UA1G+OoNH2R6BK8gDadnAZuoshunTH
         WriE9VIqcR00Yy++L+91LQ/iEokpj1XMZc9rY9nxdHh5Uh+Yh6aa9zl3jtDrU86aiUHv
         vuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889529; x=1789494329;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=St/Sk9a+p3XhMP4xZTJv7PZaeP9BSabCb1wIv9/ECMc=;
        b=Eb8pOmzxA7Awn+HiAWPmHoDZ9bC5ubeKi69bw1igx/2ZrRLZC29WH97MJnLFfvin5q
         FaVdlGxsvctmiJJq64cein1yuz4OOaKe3vXbL6fCDf+xyMHgoxZMTm2vgShTBA1NoUyh
         oVEBVUj00zD1Jvzz01n6H5AFt5nOLIZL9N/TxFV1GCwGt0zIdh+BM49urO6WPbd7UwtQ
         NRfLRx5TgMzhA6JsF7sAKocoSGeuQL0xnmgbZFymuFcaMRnEep2P0RTKbrVaGZkyXqSZ
         qO0iwesV32yDZ2ckatptPFzS4u/PvBfqoxIVl4018sq7nfu05kyQPKGZ2+k9Euvz0bTu
         s5RQ==
X-Gm-Message-State: AFuF++l7u3qMlB1uTufvFEEMJyeANV/3sqajFzK/i2TUhzLpr4hOW8Me
	DOwzb3nRvhSTbXe0l3WuqiHrhUdm0oVt2AzoYhkcN7g+0/I9JBFyIzT9cOAK6mexNrMh7NmzKbk
	Cey0jwvI8fJYq+b4lpocJhuR3sPtZx8X89GBE3AxHwr/ln0ZSXxZVlCVa12QyHUPUXAdNIKKUJC
	s5Igs=
X-Gm-Gg: AYBFou2C02riB+g0JP01+zvMqDfo8vmheWpuQsyLyLDXccdbyY1tnSJC2HOBI3GwEhl
	sv2Ba9IGEo9NdUQS8OGOA40Wutx19ZXopxzoo/ZYMELAto9T8Hiq1g2pxDrJwp1B/25voAJqhfl
	TWUXHsBjPyDFV4nJGmAU2lZ3yvRkdsyhN5LtMZKc35QfymMk48SLFRkgptURA7P4jwFmD34Gd8f
	lOmNiw7CjMju9RRD9rHCAgb00C8gKz1iifLrbnssD5qwxXBaH6aD667IBoFstWhfoouOiUAltPl
	T1DNpRNlwNxjaKF/ASqfURpZ0/d6OACVNWlc0IxN1IzuSpC8tB/AmNM//jJ+4q9ZEFY8SWHVA8V
	Uti7ERwu5tauMC94nUTLeP9e7Dg==
X-Received: by 2002:a17:90b:4c4a:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39b2624c32bmr10550900a91.21.1788889529121;
        Tue, 08 Sep 2026 10:45:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4a:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39b2624c32bmr10550852a91.21.1788889528598;
        Tue, 08 Sep 2026 10:45:28 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33517b57ac8sm26286483eec.28.2026.09.08.10.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:45:28 -0700 (PDT)
Date: Tue, 8 Sep 2026 23:15:22 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org, robh@kernel.org
Subject: Re: [PATCH v12 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <aqBJsv3Sz5NUci3H@hu-mdsor-hyd.qualcomm.com>
References: <20260903-lt9611c-v7-v12-0-9414d2b3bd6d@oss.qualcomm.com>
 <20260903-lt9611c-v7-v12-2-9414d2b3bd6d@oss.qualcomm.com>
 <20260902194019.89CA71F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902194019.89CA71F00A3D@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6aa049be cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=BfgJfMvSuRSZfvNRZ-sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: bGzoI0Wc2CZjNm0pcqE_80kkXMXRHOST
X-Proofpoint-ORIG-GUID: bGzoI0Wc2CZjNm0pcqE_80kkXMXRHOST
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE5MiBTYWx0ZWRfX/lt7JnJ+hJN7
 MXluuEhaLZpPziebPQWfWY5X3Wcm9A8EcTLQmEAmjySyH4JzxUYMARUyKhMiJk6uf8DIggSqeg9
 Y94zMsjfUaycCzYYNtPTfAMy+utQMXSKKFfi6Hlk49kgQo7/cZpwxiMkAJXOmB87VS8JilyjmnZ
 ir8j8kFyRuER6e/w6AdlIX5ZEyj072KK/MSP+8fkU0h+xSjdC9Xq24Y98fKEI1pCQCWpE6Yj6w/
 w3wCyYFt/ZwjJyKdIE6qKyWwNtu9Nrv4XvHfZ09F/po83jXtVatlRVe2mrakLozsU8ljUvb0M4q
 qHbKLwEQl+Ca4Bn9GNKnthK37uNlvNPEfhOptx5csaNTCAAnUxPcjG45yLMEPr19B9XBpLpSmLs
 2cCl9BTBJ8Aw6gSkhHmOpW1KgA3a58NyNySOjrssy69IgiIzwBGhRYYq2c0+O3ts+1fQXW9Ewqy
 d+YjroZgFRP2IsUtt2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE5MiBTYWx0ZWRfX0xz14o8kzYjC
 AiAoeZqgdZWhrZUYVwcLwgPy4b5yI44//1oQjV60JG3nWa9obhsZqLZYBy3k91RoBpl8Iy4xiUS
 FzNPH3RGBZA7vfqowAOlNg4Q5wmZufQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080192

On Wed, Sep 02, 2026 at 07:40:19PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Double-free of device nodes `dsi0_node` and `dsi1_node` on error path due to mixing manual `of_node_put()` with `__free(device_node)`.
> - [High] Regmap page cache becomes desynchronized after hardware resets, causing subsequent I2C operations to access the wrong registers.
> - [Medium] Mixing `__free()` scope-based cleanup with `goto`-based error handling.
> - [Medium] Bitwise operations in the IRQ handler corrupt the interrupt clear register if multiple interrupts are pending.
> - [Low] I2C device ID array is not declared const and uses positional initializers.
> --
> 
> commit 79126746072fd218bc214fab821198cac4bc10bd
> Author: Sunyun Yang <syyang@lontium.com>
> 
> drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
> 
> This commit adds a new DRM bridge driver for the Lontium LT9611C(EX/UXD)
> MIPI DSI to HDMI bridge chip. It supports configuring the hardware, handling
> interrupts, and triggering firmware upgrades over I2C.
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > new file mode 100644
> > index 0000000000000..ef1e9726fdd3c
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> [ ... ]
> > +static void lt9611c_reset(struct lt9611c *lt9611c)
> > +{
> > +	gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > +	usleep_range(10000, 12000);
> > +
> > +	gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> > +	msleep(400);
> > +}
> 
> [Severity: High]
> Does resetting the hardware here desynchronize the regmap page cache?
> 
> The physical reset via GPIO clears the chip's internal page register back
> to 0x00, but regmap's cached page selector isn't explicitly cleared. If the
> last I2C operation was on a different page (like 0xe0), subsequent writes
> might skip the page selector write because regmap thinks it is already set,
> causing those operations to mistakenly target page 0x00 instead.
Not an issue — the regmap config uses no cache type (REGCACHE_NONE by default). Regmap always performs a real hardware read
of the selector register before deciding whether to update it, so it correctly detects the page reset to 0x00 after GPIO
reset.

> 
> [ ... ]
> > +static irqreturn_t lt9611c_irq_thread_handler(int irq, void *dev_id)
> > +{
> [ ... ]
> > +	/* Clear interrupt: hardware requires two writes with delay */
> > +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & BIT(0));
> > +	usleep_range(10000, 12000);
> > +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & (~BIT(0)));
> 
> [Severity: Medium]
> Will this corrupt the clear register if multiple interrupts are pending?
> 
> By writing irq_status & (~BIT(0)) back to the hardware clear register, if
> there are other interrupts pending in irq_status (for example, bit 1 is set),
> this will mistakenly write a 1 to those other bits during the final clear 
> step for bit 0.
We only support hpd interrupt.
> 
> [ ... ]
> > +static int lt9611c_parse_dt(struct device *dev,
> > +			    struct lt9611c *lt9611c,
> > +			    struct device_node **dsi0_node,
> > +			    struct device_node **dsi1_node)
> > +{
> [ ... ]
> > +err_put_dsi1:
> > +	of_node_put(*dsi1_node);
> > +	of_node_put(*dsi0_node);
> > +	return ret;
> > +}
> [ ... ]
> > +static int lt9611c_probe(struct i2c_client *client)
> > +{
> [ ... ]
> > +	struct device_node *dsi0_node __free(device_node) = NULL;
> > +	struct device_node *dsi1_node __free(device_node) = NULL;
> [ ... ]
> > +	ret = lt9611c_parse_dt(dev, lt9611c, &dsi0_node, &dsi1_node);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to parse device tree\n");
> 
> [Severity: High]
> Can this cause a double-free of the device nodes?
> 
> The pointers dsi0_node and dsi1_node are declared with __free(device_node).
> If lt9611c_parse_dt() fails, it manually calls of_node_put() on both nodes
> but does not set the caller's pointers to NULL. When lt9611c_probe() returns
> an error here, its scope ends and the automatic cleanup will call of_node_put()
> again on the same pointers, leading to a reference count underflow.
Will fix it in v13.
> 
> [ ... ]
> > +	/* Attach primary DSI */
> > +	dsi = lt9611c_attach_dsi(lt9611c, dsi0_node);
> > +	if (IS_ERR(dsi)) {
> > +		ret = PTR_ERR(dsi);
> > +		goto err_remove_bridge;
> > +	}
> 
> [Severity: Medium]
> Does this mix scope-based cleanup with goto-based error handling?
> 
> The function declares variables with __free(device_node) at the top but uses
> goto err_remove_bridge and goto err_disable_regulators for cleanup here and
> below. The kernel cleanup subsystem prohibits mixing goto and __free() in the
> same function to avoid confusing ownership semantics and resource leaks.
Will fix it by removing __free(device_node) and using explicit of_node_put in all exit paths.
> 
> [ ... ]
> > +static struct i2c_device_id lt9611c_id[] = {
> > +	{ "lt9611c",   (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611C]   },
> > +	{ "lt9611ex",  (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611EX]  },
> > +	{ "lt9611uxd", (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611UXD] },
> > +	{ /* sentinel */ }
> > +};
> 
> [Severity: Low]
> Is this missing a const qualifier and named initializers?
> 
> The I2C subsystem dictates that initialized arrays of type struct i2c_device_id
> must be declared const and use named initializers instead of positional ones.
Added const qualifier and named initializers .name / .driver_data.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260903-lt9611c-v7-v12-0-9414d2b3bd6d@oss.qualcomm.com?part=2
