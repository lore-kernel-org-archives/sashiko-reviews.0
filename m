Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F974963D1
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789471327; cv=none; b=VOUfETPvY/GlXcPatH4WaIkko5dCP1l7DipruC+o1VvcsIjD2W7VPPC2sanHXmpMNdB1x3cN5GXQxvtmZeafvHRbKg6qEX+8BfFi4DuO9qo8z6y3h+AVToRJv5Yy2xCXOyMZWpfMmfrUDjz8XJFx42dliGtfqe8/PQYhfEx0KMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789471327; c=relaxed/simple;
	bh=2No5mlpVwB4AdjtOOu0CWZ2jHtiVobkOSNzvHZ2+PWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEl44u8JvVAFxr0YdbId79ijF7QQQVWFWotLwCZrXTx1PssSBtTzN6TFcI0GKPYH9kECV4XOsi0bK/LVj4Ny/5SQicF41sfSyszyNey8g+9lr/vTq2yrcSnXLYrB3Eg8rNB/UrWWxvQ4FFmgKatI3ker9PkkilwNp6lGMRzVS7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnSJ95et; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dzYtC+Jl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnSJ95et";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dzYtC+Jl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gxSo3415566
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 11:22:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xulq/000/ULLchJIOg/N1wH/ItWptfBKc1m2CXViGcY=; b=CnSJ95etg13x7wJZ
	X57qFMZAtjLfNbLRotEQKqUUXnXWDLevJUW4el1TB/2Ia/dW0DFg5MR+V5uO7BUD
	3nN2CrP52hnvHWSz6alG8LV3gLO64CwCyuP3oGIcbMHBKGrVsKm7QrBBVJ6k3p4W
	eK5mAoWss3S3hKlHKDwHiQ59Y79hqfinK3IsQxdb5IMcIYDcaWR++lDgFhkNYOaH
	zYSQzL4uDsXXMu0fvpNMAJeReFxQq7J2t6f30ZL7ZK57YjQt8Kt/Nh5cPVwcqz0E
	ATh5AqeXwKKX6mN0MJi+bEJdRCbhxYyPvVzUDd3aS5C6XTvUSSzUl9nea/1tm3vk
	R3YzOQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc0h7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 11:22:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so7535906a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 04:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789471320; x=1790076120; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xulq/000/ULLchJIOg/N1wH/ItWptfBKc1m2CXViGcY=;
        b=dzYtC+Jl3egvjaBMhiDUmfrEAjsQ+Mq5KA5PMCHqwTS2IXEA4xPEkhEo7ICvSBxleE
         0ppSbtB4fGljAjGo+P7SBJdMdSJGSEY595x15adpkAgyQriTQ9je2Oy+khIZozuF64mz
         g//kW0no23H75kaRqYLbkB4Xn/Y28dVtYfdgqzwwclMonJKu1ABKokrn8SauEPHC4cJB
         P6qnicvLAZ26mQx4wSsgdpHndyKVX2KcXqkJqK44rs2Vxf2SubtWzve3u+lqB8BTy9Kc
         TixY1c3m0ddpDjdcSDWXOOUyf/WFM8Nx3kmVfDL2NDQ5bM1dYI630/T83zpYbOFC7Zvt
         1vPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789471320; x=1790076120;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xulq/000/ULLchJIOg/N1wH/ItWptfBKc1m2CXViGcY=;
        b=op6221zpR4lCwGJD2n6g6bPuVzuI8ATRwLbOJLwCgL50gCmCZbWyweBtJ7Gc9b0+mB
         jxBudpTevcppZRLTjb6ZYCypMYyrTc8Pl3WvCE73cUPik4hFpn/tE8A2TozkLH4VQBDX
         mwXyl+3TIW3X7L/DHGWuzAnnfm+l0OkiLPq3KRjHUn4csv6e85C9bq+cAfhFpWde4ivj
         WUYDZyV2/jYFcgRIk2OMEf5gA0OOegzGFYT7Ak4XVr2F6yW20UhuvpNTN9Q5Fo4pom+X
         B966ftOmP+vcK+cnU4kDWDuVnEKvLSCX2WUelsmleSAwTBdCtU6IvAjXOc8v+HHV0/xA
         giYA==
X-Gm-Message-State: AFuF++mZhnSuyP4wOhsqQP/DDFYszD6vbGuz9GJJ1RwMy2VepynfsCTM
	dfWLHew5PUb/G+A4fLX7jOmsNeX6YCnkglAgPCAWF0QVFr6TjZ4ZSRjTyPmx+NenPviT+XexIs5
	5v7GPyQqQ2a/XGs5T13/xN1QI1tdqovL5CaB6nWNA7teK9QPi/z6JD08sXyluvX4cZjvBltAUK4
	liFOs=
X-Gm-Gg: AYBFou1PbB+StK4MOyY+BQ3RML0t4D6jJHtZeSd9/GjsE3wYtJasWPGJw9DPCZ2C/2p
	FDgm6FGOBuooUUDzDRknVNkvPuFK2KGKPr6rOJfH7nXE6mByiwYYNpGog5C7mqkuOokWzWi2xcV
	1oAz/TMwP3NwlAye7oRJ34ZvsWLFba6sqK2p75YpfXSOoky9yQxD15mCU/fDl131OnttLSXeDdT
	v9S3oLedUiKJsy8sOZMIyD4Nol4BoZS0ujYyHip5JIZPhcFAMb8DUUUUhuBzDd6ZA7Djw6F4/0x
	YHvFUTj0Im77g75F8D1o0hoSqx7glYwiStjcknb9Vb8gCmN0lauVi8C8iMs/+W5kWgbgaI2yfQ6
	GumUN9d25ooOfGJs/FUG/2uHYgA==
X-Received: by 2002:a17:90b:1c83:b0:39e:27e:21b3 with SMTP id 98e67ed59e1d1-39e027e229fmr5444520a91.9.1789471320103;
        Tue, 15 Sep 2026 04:22:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1c83:b0:39e:27e:21b3 with SMTP id 98e67ed59e1d1-39e027e229fmr5444461a91.9.1789471319539;
        Tue, 15 Sep 2026 04:21:59 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf31c1sm34002659eec.1.2026.09.15.04.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:21:59 -0700 (PDT)
Date: Tue, 15 Sep 2026 16:51:53 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v14 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <aqkqUY4BfXo2HuGT@hu-mdsor-hyd.qualcomm.com>
References: <20260913-lt9611c-v7-v14-0-534b43a07662@oss.qualcomm.com>
 <20260913-lt9611c-v7-v14-2-534b43a07662@oss.qualcomm.com>
 <20260912215110.11BDF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260912215110.11BDF1F000FF@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: Xgdbh2vau44KaU5dc6P3s5GkKMhjRKQU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE2NCBTYWx0ZWRfX8X+60Dok4pL0
 hhSPCNQEkPNk8kG2DZKYsutmkGN7cCO7mZLDkV9pyeDu6GSyzJlN+mi+5H0tFTSpCXRQoVjs8KN
 TJrAuadJ/PRDJPwfjoDpIcjjPpHhkTo=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa92a58 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=36FZGce6BDuSa-RBUaEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE2NCBTYWx0ZWRfX/lDcO6IWQUnP
 Kwp9FClOPS57r7sNVpAHdw6bpZcaSzeMQ3Ve0da/W7mkmDmDUFMWQuWxX+g+WjWdSaTLGX2lfD9
 ZbtpzNgSetR+RTWVV3u8bbezKgCm5gSUCrxacbVuTIo3HjYKwdsvNy6sG4PZx2qEVRdiDhwGHhJ
 rMFA/1iVHGbHtbuoKJ7tV+O+snieHMfUKSBT7ERB0kya6HDqY7EhaRBXLK//Mq20xCXmXSmfDQ1
 Bmla9YwoIVKHr0mEcObFcf1lurE0dDnrMM7v+2rwjvoVXfMHhO1+xZfUrnG0EB9oLwyxj8Fs8Mi
 YMdtm+Ri+9JtCdmazC1LtiK6cKjIpc8S+PvOEWtd38kIuNIqU6qKkE0fYgzuqLy7u/JfEYhh8qv
 Axnujc/YJn4PKrS3a/IZf54pDlpQSPHWIKk1e44kz0I9ITMhgMKrFGC+x54oVamvLH1qNWX8ztk
 i+2WDbpQWdMKHjGlTLg==
X-Proofpoint-GUID: Xgdbh2vau44KaU5dc6P3s5GkKMhjRKQU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150164

On Sat, Sep 12, 2026 at 09:51:09PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] The driver fails to invoke the DRM HDMI state helper to flush infoframes to the hardware during a modeset.
> - [High] Missing polling for flash page program completion before writing the next page.
> - [High] Hardware reset causes silent desynchronization of the regmap page selector cache, leading to corrupt I2C accesses.
> - [High] Incorrect interrupt clear sequence inadvertently asserts clear signals for other pending interrupts.
> - [Medium] The bridge driver completely omits an `atomic_disable` (or `disable`) callback, preventing the hardware from being powered down during DPMS off.
> - [Low] Data race when accessing `lt9611c->fw_version` concurrently.
> --
> 
> commit 00cae86a0097b37f64f26f28bf0a922224a6461d
> Author: Sunyun Yang <syyang@lontium.com>
> 
> drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
> 
> This commit introduces a DRM bridge driver for the Lontium LT9611C(EX/UXD)
> MIPI DSI to HDMI converter chips. The driver supports single or dual MIPI DSI
> inputs, I2S/SPDIF audio, and handles HDMI infoframes alongside I2C-based
> firmware flashing and power management.
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > new file mode 100644
> > index 0000000000000..fbd6209287998
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> [ ... ]
> > +static int lt9611c_write_data(struct lt9611c *lt9611c, const struct firmware *fw, size_t addr)
> > +{
> [ ... ]
> > +		for (unsigned int i = 0; i < LT_PAGE_SIZE; i++) {
> > +			size_t index = num * LT_PAGE_SIZE + i;
> > +			u8 value = (index < size) ? data[index] : 0xff;
> > +			int ret;
> > +
> > +			ret = regmap_write(lt9611c->regmap, 0xe059, value);
> > +			if (ret < 0) {
> > +				dev_err(dev, "write error at page %u, index %u\n", num, i);
> > +				return ret;
> > +			}
> > +		}
> > +
> > +		lt9611c_wren(lt9611c);
> > +		lt9611c_sram_to_flash(lt9611c, addr);
> > +
> > +		addr += LT_PAGE_SIZE;
> > +	}
> > +
> > +	lt9611c_wrdi(lt9611c);
> 
> [Severity: High]
> Does this sequence overwrite the SRAM buffer over I2C while the internal SPI
> flash controller is still programming the previous page? It appears there is no
> delay or polling for the flash program command to complete before looping back
> to write the next page's data to SRAM, which might silently corrupt the flashed
> firmware.
Will be fixed in next version.
> 
> [ ... ]
> > +static int lt9611c_firmware_upgrade(struct lt9611c *lt9611c)
> > +{
> [ ... ]
> > +	ret = lt9611c_write_data(lt9611c, fw, 0);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to write firmware data\n");
> > +		goto out_unlock;
> > +	}
> > +
> > +	ret = lt9611c_write_crc(lt9611c, fw_crc, FW_SIZE - 1);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to write firmware crc\n");
> > +		goto out_unlock;
> > +	}
> > +
> > +	lt9611c_reset(lt9611c);
> > +	ret = lt9611c_upgrade_result(lt9611c, fw_crc);
> 
> [Severity: High]
> Could the hard reset immediately following the CRC flash write command abort the
> final write while it is still in-flight? Polling for completion before resetting
> might be necessary here as well.
Will be fixed in next version.
> 
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
> Will the physical reset clear the chip's internal page register back to 0
> without updating the regmap cache? Regmap's internal cache of the page
> selector could become desynchronized, causing subsequent register accesses to
> skip setting the page if it matches the cached value, but occurring on the
> wrong hardware page. This would affect accesses in probe, firmware_upgrade,
> and bridge_resume.
The driver uses REGCACHE_NONE (no cache_type set in regmap_config). With this mode, _regmap_update_bits always performs a real I2C read of the selector register before writing it — there is no cached page state that can become stale. After GPIO reset the chip reverts the page register to 0x00, and regmap reads that back on the next access, correctly detecting the change and re-issuing the page selector write as needed.
> 
> [ ... ]
> > +static irqreturn_t lt9611c_irq_thread_handler(int irq, void *dev_id)
> > +{
> [ ... ]
> > +	if (!(irq_status & BIT(0)))
> > +		return IRQ_NONE;
> > +
> > +	/* Clear interrupt: hardware requires two writes with delay */
> > +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & BIT(0));
> > +	usleep_range(10000, 12000);
> > +	regmap_write(lt9611c->regmap, 0xe0df, irq_status & (~BIT(0)));
> 
> [Severity: High]
> Is the second regmap_write unintentionally asserting clear signals for other
> pending interrupts? If other interrupts are pending (for example, BIT(1) is set
> in irq_status), irq_status & (~BIT(0)) will write a 1 to those bits in the
> clear register. This might permanently assert their clear signals without ever
> deasserting them.
Only one HPD interrupt is there.
> 
> [ ... ]
> > +static void lt9611c_bridge_atomic_enable(struct drm_bridge *bridge,
> > +					 struct drm_atomic_commit *state)
> > +{
> [ ... ]
> > +	mode = &crtc_state->adjusted_mode;
> > +
> > +	lt9611c_video_setup(lt9611c, mode);
> > +}
> 
> [Severity: High]
> Should this enable path invoke drm_atomic_helper_connector_hdmi_update_infoframes
> to flush the infoframes to the hardware? Without this call, it seems the
> registered infoframe callbacks are never triggered, preventing AVI and other
> infoframes from being transmitted during a modeset.
Will be fixed in next version.
> 
> [ ... ]
> > +static const struct drm_bridge_funcs lt9611c_bridge_funcs = {
> > +	.attach = lt9611c_bridge_attach,
> > +	.detect = lt9611c_bridge_detect,
> > +	.edid_read = lt9611c_bridge_edid_read,
> > +	.atomic_enable = lt9611c_bridge_atomic_enable,
> > +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> > +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_create_state = drm_atomic_helper_bridge_create_state,
> 
> [Severity: Medium]
> Is the omission of an atomic_disable (or disable) callback intentional? It
> appears this leaves the bridge permanently active and internal PHYs powered
> even when the display pipeline is blanked or during DPMS off.
The chip does support power management via the existing suspend/resume
callbacks which disable the regulators and assert reset.
> 
> [ ... ]
> > +static ssize_t firmware_store(struct device *dev, struct device_attribute *attr,
> > +				      const char *buf, size_t len)
> > +{
> [ ... ]
> > +	lt9611c_lock(lt9611c);
> > +	lt9611c->fw_version = lt9611c_read_version(lt9611c);
> > +	lt9611c_unlock(lt9611c);
> [ ... ]
> > +	return len;
> > +}
> > +
> > +static ssize_t firmware_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +
> > +	return sysfs_emit(buf, "0x%04x\n", lt9611c->fw_version);
> > +}
> 
> [Severity: Low]
> Could this result in a data race on lt9611c->fw_version? The variable is written
> under lt9611c_lock in firmware_store(), but it is read here in firmware_show()
> without any locking.
Will be fixed in next version.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260913-lt9611c-v7-v14-0-534b43a07662@oss.qualcomm.com?part=2
