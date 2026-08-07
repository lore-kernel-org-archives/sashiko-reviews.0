Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C806231C91
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 19:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786132086; cv=none; b=KCJTfVvSzTXNCW3W79dGzJ0f7e6sa1KF8UT3pR7AOlpRRM4RzKDzS6kgE/FlQ0fuUIexVr5YWYvq7dJm7VIgoNTq9nwHkpLz5OWYdjS5Y3dnmSU2bdLb03qjA1Ttvs9rDKqaoaqv5q+ADRMCbb7X3xR3+c5KuAI2WieFqcxTHI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786132086; c=relaxed/simple;
	bh=nvaRPCSZuo/cZ4xZu3NDvW5WaZqyP6TqhthQbkw/7Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNEeu9LEZmqyHG02R/eFEQl1ai4rQ4gNYoCxUYJ6QR9SbTdxDg2pWjmxcPPNutW9c/4se33895NMk56X96AZ258JmrjiYXz0DRIiHYEto9PWbqnmMKqDw3/SP3bii8xZsvUiJKuRBnFqfKDdxJAmRE0UIBvAM9DwZtORuAVvzso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IkVSDife; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HpzbswSJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IkVSDife";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HpzbswSJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677InGr62990624
	for <sashiko-reviews@lists.linux.dev>; Fri, 7 Aug 2026 19:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gp5yEkcIuvYje/Gtl+2S+AYczcvYVVni2PBd63AOC6k=; b=IkVSDifeHlAJCpap
	LIbqzXp6D4s4WFgmBROn2Bckq+zyAH7SrBmb8N+R4a8e4XWrlnWNNyrjHo/2r1cZ
	nW7WvQfRpYhlt2oC7UQRd+/IZWFjxy+gqOFXu5xNf0JmUYnIxAbKZ71DYNoi7Wbp
	GY9HWm0YWQrmSdQJw6+u7SGP7XOTzA+XZPao5v0QFyO4xRtFcMQ/2NSANko4Iy3t
	pksCnXNJTBr/yvLmnjfrjo0vKDszGyc3dtticXG2OQ1HJ4GddqbSCH7U4bEWdlHC
	P+o0iMBeLq3Rn49ReKwKsWQn3qodYreU/2XnvCqSrB7arxLk2TF8hQkbpnFnxEjQ
	VSFmbg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwhpy981c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 19:48:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso4566014a91.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 12:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786132083; x=1786736883; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gp5yEkcIuvYje/Gtl+2S+AYczcvYVVni2PBd63AOC6k=;
        b=HpzbswSJE/VjjAgdKnhhUaCP8VKQieh9+d+dGQqxWgqSinFijhyq5RZS0CnW2kUUvD
         IHakaBrdiC342VTRZeiuWm13K9ZaMrhMyoH4QJjRS8VnUpFw+j8gbeQfVB2pB49Fq3HW
         5QBIHxHHrAEd6MLZVIkeYzKl/OgH/9JnSROpxwQcED4bGfcp4A4PNN+5qHeCsCmeNWOZ
         UfROKCo08FAcJ0xsaAcepMkv3XQ2+zNNoIL0Mx26rRD6UvMNRlJSBhKK/6fHpb/w5b2Z
         SoH/aTO2kv74DsceXsbqxdQowH5+heVmIcUjlKEqHXK7sQ8XpB4jA5eBDBDW1tNieKjZ
         8Avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786132083; x=1786736883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gp5yEkcIuvYje/Gtl+2S+AYczcvYVVni2PBd63AOC6k=;
        b=nb/WRw10Nm6EJNPuW36KfpPHX0Fqo2fpXMqpzB8Qc6G6OGWVJCwXEHNYCC4S4M/VzM
         FG8BdTe0LLuDkS099be1Wuijto0k54uBszuJGLR3yxiEbyJUBT0CUSjaKNycCo3OYbGi
         oGD2R+guuNbAAN5/qH9CRbmumLNa8ZNjo2Ikk3XJRNPjEvAeMmuo2/auxTIiRKPxp1F7
         V+wn+alHr2q9eY8jJOIRuX87fRJLaJLQ8wz8RaQcN9GJev7om6lsms6qxSyTvBPp0S6v
         Yqcv0VEFJJZZi2AIzaAkBE7I6cDHcX3/pRgLmvGQ8DgGijjUp82CrRqUJx1Tw1PWpvZW
         Gaog==
X-Gm-Message-State: AOJu0YyYb4i9RGToucQZ1Gsur6ju+sIoVBibgbd0vcT2TvI8iWSxxLgt
	1llLeW6U9DdNuHxwFSk2WRCDopMyHjsKC8iz+7sfdTSUeF/BR1Jcl7eZy5Pv8jnk+UFzUeE47Ye
	BSnq9POnY+z49pofzB5vjxkvk7V7ORWtgBtd+J6Bo/J+01zVQrhcLi5SZVsNi+gk2//RdUYB8Xw
	e9fMw=
X-Gm-Gg: AR+sD1116NFrUhLPc1hj96RJrKmHKJVtGFJFs5onHmGyAJfc/QlcAw6Z+rdNOw0mtRQ
	HExg0Ez7+IwYfhooo9p47TxPrdXWROWEO9cyjkIiBf9M/k8SC44GVdlh3cHQPERf0KG6XbRxAcd
	fZx/nZZP9A14WVdBjJOJNwmDqPuRU4+UM8KKm8rtbhjusRqoDxPZh+4NgE8Nu0gu0jg//1gSVwg
	JDIWXz8R75X288LPzh3JqR/DmS1SWseQ4miSnTjt64NSlfBiMm+pcS4gJuNRdJjghgKVxzUK+VO
	cc5W+7b3+aiWjdf1mqqehf9Ur0uYtqLOpeJUsqwcyMwnJhhhhnZeHmB03jXb6bJgEbD6L/gPlH0
	wuFipILUteAvBfhxhAn0h/J/xsQ==
X-Received: by 2002:a17:90b:4ace:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-3928246545amr2090936a91.20.1786132082609;
        Fri, 07 Aug 2026 12:48:02 -0700 (PDT)
X-Received: by 2002:a17:90b:4ace:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-3928246545amr2090882a91.20.1786132081982;
        Fri, 07 Aug 2026 12:48:01 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a706fsm10454089eec.8.2026.08.07.12.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 12:48:01 -0700 (PDT)
Date: Sat, 8 Aug 2026 01:17:56 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v9 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <anY2bFDCvN+J9Wgq@hu-mdsor-hyd.qualcomm.com>
References: <20260804-lt9611c-v7-v9-0-3423a76856d3@oss.qualcomm.com>
 <20260804-lt9611c-v7-v9-2-3423a76856d3@oss.qualcomm.com>
 <20260804125938.DCD6A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260804125938.DCD6A1F000E9@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=Cb44Irrl c=1 sm=1 tr=0 ts=6a763673 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=Gew5hmu5R9XjSDW7IewA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-GUID: 5z88PutBrh1vDXf2itO3lPsrroWQNq_2
X-Proofpoint-ORIG-GUID: 5z88PutBrh1vDXf2itO3lPsrroWQNq_2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE1NCBTYWx0ZWRfX3jpMbeyqplLZ
 /LQBmtO55w99ufXSCxT34d1q0DBhb7GewNZNlxUpc6eJrjYNHHJbJbiECakcnkGTXO13aH5MedM
 v9XG3MVKnBMe/EE2t/tIaZvrms6fv/0XJAbw11Jtiv6KoFMunlT+kBUp87QWuBpcn+62dcq30z5
 Ine/iKL9rOYJAu9XaR2cu8+V17XjC6Xb9tSM03U3RzC/YGEFZuxXZebQy5YG/3lrrWSKdtBTJwT
 iKAJqt0xKPtAqsAGVk3MCtzLl2ZmLlN+W8wTd1Q7AIQnMPLMdxhaVrB4wtvTA2iZqh35cUairmD
 zYrqeEvG9NA3bxHOn+u6wcBT6e79WskWLwXyn1veurOz+o/gCKHOShS32UM02p1ms2s67bh2v3v
 mRGr7MXvziP34uLtgmitIC8JcxsSBqDt5MtvfYL4ZHj9EdeklfArQz2GYMQ0OoljxIYwH/eYM9m
 pURzthz8AaPXYoktNkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE1NCBTYWx0ZWRfX8zRb5hRmLgrm
 06znejKB8q5Ieq+TqCYwulrTaJpSFIqQQ0P8RRHDMaBnmqfzaWv8caaDmQtFX5cuxBmxitMrfuo
 YPwC0I2P7T/0vpzpGzuekuCZypZFu8Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070154

On Tue, Aug 04, 2026 at 12:59:38PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential issue(s) to consider:
> - [High] Missing `disable_irq()` before `cancel_work_sync()` in `lt9611c_remove()` causes a use-after-free when `devm` frees the device context.
> - [High] Bridge is left registered and accessible to DRM core while its power regulators are disabled during module unload.
> - [High] Unconditional dereference of `cdata` returned by `i2c_get_match_data()` without checking for NULL.
> - [Medium] Incorrect interrupt clearing sequence in `lt9611c_irq_thread_handler()` can permanently suppress other pending interrupts.
> - [Medium] The return value of `devm_drm_bridge_add()` is ignored, which can lead to silent probe failures.
> - [Medium] Firmware upgrade via sysfs silently resets the bridge hardware, breaking active DRM display state.
> - [Medium] The IRQ handler incorrectly returns `IRQ_HANDLED` when the interrupt was not generated by this device.
> - [Medium] The return value of `read_poll_timeout` is ignored during flash block erase, which can lead to firmware corruption.
> --
> 
> --- Patch [2]: [PATCH v9 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver ---
> commit 6e88557e672677022a4675c645ef3cbef1ee7ce0
> Author: Sunyun Yang <syyang@lontium.com>
> Subject: drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
> 
> This commit introduces a DRM bridge driver for the Lontium LT9611C,
> LT9611EX, and LT9611UXD DSI-to-HDMI chips. It handles configuration over I2C,
> video timing setup, audio infoframe handling, and firmware upgrades.
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > new file mode 100644
> > index 0000000000000..f5af2856ce00b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> [ ... ]
> > +static void lt9611c_block_erase(struct lt9611c *lt9611c)
> > +{
> > +	unsigned int block_num;
> > +	unsigned int flash_status = 0;
> > +	u32 flash_addr = 0;
> > +
> > +	for (block_num = 0; block_num < 2; block_num++) {
> > +		flash_addr = block_num * 0x008000;
> > +		lt9611c_erase_op(lt9611c, flash_addr);
> > +		msleep(100);
> > +		read_poll_timeout(read_flash_reg_status, flash_status,
> > +				  !(flash_status & 0x01),
> > +				  50 * USEC_PER_MSEC, 2500 * USEC_PER_MSEC,
> > +				  false, lt9611c);
> 
> [Severity: Medium]
> Is it safe to ignore the return value of read_poll_timeout() here?
Added the check here.
> 
> If the hardware fails to erase the flash within the timeout, the driver
> will proceed to lt9611c_write_data() anyway. This would cause it to write
> new firmware data over un-erased or partially erased flash pages,
> potentially corrupting the device firmware permanently.
> 
> [ ... ]
> > +static int lt9611c_firmware_upgrade(struct lt9611c *lt9611c)
> > +{
> [ ... ]
> > +	ret = lt9611c_write_crc(lt9611c, fw_crc, FW_SIZE - 1);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to write firmware crc\n");
> > +		goto out_unlock;
> > +	}
> > +
> > +	lt9611c_reset(lt9611c);
> > +	ret = lt9611c_upgrade_result(lt9611c, fw_crc);
> 
> [Severity: Medium]
> Could this reset break the active DRM display state?
> 
> When userspace writes to the firmware sysfs attribute, this function
> resets the bridge chip without notifying the DRM subsystem. This wipes all
> video timings and configurations, meaning an active display pipeline will
> go blank and become desynchronized from the DRM state.
No, it is needed. Added warn lof for this.
> 
> [ ... ]
> > +static irqreturn_t lt9611c_irq_thread_handler(int irq, void *dev_id)
> > +{
> > +	struct lt9611c *lt9611c = dev_id;
> > +	struct device *dev = lt9611c->dev;
> > +	int ret;
> > +	unsigned int irq_status;
> > +
> > +	guard(mutex)(&lt9611c->mcu_lock);
> > +
> > +	ret = regmap_read(lt9611c->regmap, 0xe084, &irq_status);
> > +	if (ret) {
> > +		dev_err(dev, "failed to read irq status: %d\n", ret);
> > +		return IRQ_HANDLED;
> > +	}
> > +
> > +	if (!(irq_status & BIT(0)))
> > +		return IRQ_HANDLED;
> 
> [Severity: Medium]
> Should this early return use IRQ_NONE instead?
Yes, fixed this in v10.
> 
> Returning IRQ_HANDLED when the interrupt does not belong to this device
> defeats the kernel's spurious interrupt detection mechanism. If the IRQ
> line becomes noisy or stuck, the kernel will falsely assume this driver
> handled it and will not disable the line, potentially causing an interrupt
> storm that freezes the system.
> 
> > +
> > +	/*Clear interrupt: hardware requires two writes with delay*/
> > +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & BIT(0));
> > +	usleep_range(10000, 12000);
> > +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & (~BIT(0)));
> 
> [Severity: Medium]
> Could this interrupt clearing sequence accidentally suppress other pending
> interrupts?
As shared earlier only 1 interrupt is there.
> 
> If multiple interrupts were pending (for example, bit 1 is also set in
> irq_status), the second write outputs a 1 for those other bits because of
> the bitwise inversion logic. If the hardware clears interrupts via a
> pulse mechanism, those other bits are left stuck at 1 and are never written
> back to 0. This would break the clearing mechanism for any interrupt
> other than the primary bit.
> 
> [ ... ]
> > +static int lt9611c_probe(struct i2c_client *client)
> > +{
> > +	struct lt9611c *lt9611c;
> > +	struct device *dev = &client->dev;
> > +	bool fw_updated = false;
> > +	int ret;
> > +
> > +	crc8_populate_msb(lt9611c_crc8_table, LT9611C_CRC_POLYNOMIAL);
> > +
> > +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> > +		return dev_err_probe(dev, -ENODEV, "device doesn't support I2C\n");
> > +
> > +	lt9611c = devm_drm_bridge_alloc(dev, struct lt9611c, bridge, &lt9611c_bridge_funcs);
> > +	if (IS_ERR(lt9611c))
> > +		return dev_err_probe(dev, PTR_ERR(lt9611c), "drm bridge alloc failed.\n");
> > +
> > +	lt9611c->dev = dev;
> > +	lt9611c->client = client;
> > +	const struct lt9611c_chip_data *cdata = i2c_get_match_data(client);
> > +
> > +	lt9611c->chip_type = cdata->chip_type;
> 
> [Severity: High]
> Can cdata be NULL here?
Yes check is added in v10.
> 
> When the device is instantiated via the sysfs bind attribute or new_device
> without a valid match table entry (e.g., matching by driver name fallback),
> i2c_get_match_data() will return NULL. Dereferencing cdata immediately
> would result in a NULL pointer dereference and a kernel panic.
> 
> [ ... ]
> > +	devm_drm_bridge_add(dev, &lt9611c->bridge);
> > +
> > +	enable_irq(client->irq);
> > +
> > +	return 0;
> 
> [Severity: Medium]
> Is there a missing error check for devm_drm_bridge_add()?
Added the check.
> 
> Since devm_drm_bridge_add() can return an error code like -ENOMEM,
> ignoring it allows the driver to probe successfully without registering the
> bridge. This leaves a dysfunctional driver bound to the device, silently
> consuming resources.
> 
> [ ... ]
> > +static void lt9611c_remove(struct i2c_client *client)
> > +{
> > +	struct lt9611c *lt9611c = i2c_get_clientdata(client);
> > +
> > +	cancel_work_sync(&lt9611c->work);
> 
> [Severity: High]
> Could this lead to a use-after-free since the IRQ is not disabled before
> cancelling the work?
Fixed this in v10.
> 
> The IRQ was requested with devm_request_threaded_irq, meaning it remains
> active until devres cleanup, which happens after lt9611c_remove() returns.
> An interrupt firing right after cancel_work_sync() completes will invoke
> the threaded handler, which calls schedule_work(&lt9611c->work). When
> devres frees the lt9611c structure, the newly queued work isn't cancelled,
> causing the workqueue to eventually execute lt9611c_hpd_work on freed memory.
> 
> > +	regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> 
> [Severity: High]
> Does this prematurely power down the chip while the bridge is still active?
Fixed this in v10.
> 
> Because the bridge was registered with devm_drm_bridge_add(), the DRM core
> will only unregister it during devres teardown, which runs after this
> remove function completes. By manually disabling the regulators here, there
> is a window where the bridge is globally visible and can receive DRM calls
> (such as a detect call from userspace polling), but the hardware is powered
> off. This can cause I2C timeouts or bus lockups during module unload.
> 
> > +	of_node_put(lt9611c->dsi1_node);
> > +	of_node_put(lt9611c->dsi0_node);
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260804-lt9611c-v7-v9-0-3423a76856d3@oss.qualcomm.com?part=2
