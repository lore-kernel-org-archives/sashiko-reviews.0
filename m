Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E0C48C8CE
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 21:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788988097; cv=none; b=fOCnE9h/poNf6zx2ATZaKsG6btRI5vjJ5rt8E6b/uvmoDaADjrrSqen/0BnuEVIZRn7IpxsY5GRwoBNVIaMyK1OUQT8b5uPiX63hYvfhBDaj6hdoWYNBlV5KBprxmjAFP4OS5kleX5g75EunsOJR4zV/gPifIqwqaJ2JppxQ8BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788988097; c=relaxed/simple;
	bh=Co4BuMKDNcJbJfxryu291LqUTeZuoEWT5W4MxgeFnoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYtIOsjSZ7kYcYOoLNz1EpSeXE2Z/TXgld1s7Td3a9UESLGufA9oBj6uYSVD7Ma/pEelNukPjRC6wStzLRtszCrAqoWG5BNQXdVxpVqBNEmkWhvf41XDLem7d/Q2+XlxLeGsVJu3ND4bLXdfTV9eT5yypnFp2mplzAfAVc4x5uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eih6Wnpf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWhRlvz4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eih6Wnpf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWhRlvz4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689JIGeb2851407
	for <sashiko-reviews@lists.linux.dev>; Wed, 9 Sep 2026 21:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YGOr4z5VunluLH+EaYmR0ft7HmeTL6gHe7rOeRnzPdo=; b=eih6WnpftW1EBKUp
	qK7itorA1cR70xsG9XtVw2PjjHK5A2U4vI35blPhAkjzU05eyRA6F5gLFH6rp5CF
	ymspiD7eWBam+a6kT4ITEqDR5rAmFeksHkm9hyCbWRIISyuM/JB6WePnFBrlpLJk
	k78vhXyqSzlchxACbeOQGihAmNx+8P6aE3IK3YMATxUXhyUw9xsP8vzn+Ct0dfZ+
	y1iiV6iSDAaASz2ET4EKXb993+DQDI+fkCm2gxdWuMa4c7aI5id6TwLTUPQousea
	cCfOHy818OW2dpopojWztY084RysbEUDLPY5SoNwH3lpChfWH2UVdAqSepaaqEVY
	Odocfw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd0k45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 21:08:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so9728193a91.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 14:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788988093; x=1789592893; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YGOr4z5VunluLH+EaYmR0ft7HmeTL6gHe7rOeRnzPdo=;
        b=JWhRlvz4qLeJ/NEfbemp9I7B+2qsBfjkrkFvY/04pYk8Zdn+6I1jz6xBvdNm5sCjY9
         Z2xaZeKAoJdYnmHqErlF85YXix9W1Z3/N4I1VBNvnckKVidfKnz5e4u83p+MXx9Xw1At
         whA3MZRXS9/uZbk99VK7nfg/q5+NDiQyoeIsozj+Uv+ViUuw2PzyjjZgE3w3N9XQnRRR
         vnl0fStbEOPrQmK2CclHrDBw+7OXtce5vVV2sCykt4s7e/bqxCkLEs6x8o7jI0m7bWa/
         YxHH58FhiDc7/Oop0veqJ8UJSLGghv0tMrxVujGnNOXikH+vNo1NI0hkz4wTA3WwKDjz
         lErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788988093; x=1789592893;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YGOr4z5VunluLH+EaYmR0ft7HmeTL6gHe7rOeRnzPdo=;
        b=mpVJXATPJOEm+9VGiGc0AQXT6DwJ7/zYIH6e/wgnzE11JDnl0BLwEWMIlFFYUtCMb+
         wR8Y3vC1ObOiUMzwb+FW8jhJxpllW4iyYP2fjbXb0+gyuAMQvAsPn/d+aZDGqwSWI2CU
         HGwhUX2N3xL0CRqCPBHuyfeCyNqUdXiW7YrADdIg8Hm0uKrYt3qGwjiIk8nLbV1pzSiG
         K7SttZ6S3OsrRNe/BST8mtxfQ9rKQe7+WGc/+88md2cH234Rpv+56zaT7tSXgGlFwHKv
         2Sl69QiDmKJqWftTV79cKZARlCgx7Jz/9TonfYJwNHYTRxfPmpc4duWSrXDAPfP9FlDu
         09Ww==
X-Gm-Message-State: AFuF++m4XwqwMQef49Vcok3mM/nRfQPeOCgjQJBScnEptzu3WQ8ZNrvz
	ZPuSBOdKXxduy3YD97/YGBzlsNG9Ea8i0rr3g56rT9aQdMnTiLwY4YdrRrgzNcVYejSp6braxdw
	O1toE9WremkMzCUqsDozTLuAzyAdE/J2Lr8aF8DOIJkAC1+a7LSFBduJL59PxNqWQMgKITGAtQN
	itD1c=
X-Gm-Gg: AYBFou3AiZw3lgpahuwC9DDfrK2jxrnXxWv/ey1TDqdt5mPnjKhDUDvDuqRn2AryCeg
	2vMrBTYPsbXK6vlAlTRiDQ4p5HElWiXDVlNdQiob7LxFw2vodQYmM4D+A09vgVg6YcwjL0HrM0b
	FYx4zNCfiQ64vSkyqJXIwcAvVZAEgRJK0VDTn95wFJW75/bmY4kchwzZXE/ZCXpWEl9/31G1Kz4
	sOF93sSZyuC28TPcZnO3e1cGQaq22+bXPjf37QijQzMzq8Ii6k2yxiDEsnBHcra4SowtXcYOsWs
	zeaiijXbk+zuvyQPBPadGE7RhAoj4mEHHThaInz0b1cxChOkVRpYHbpAa+hPPnZ/s4ySZMIJR1E
	FJ/GYzQ997Tv2UynBEm9GsgCs4g==
X-Received: by 2002:a17:90b:2e8c:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-39d7097de14mr4541000a91.4.1788988092652;
        Wed, 09 Sep 2026 14:08:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2e8c:b0:381:a766:efcb with SMTP id 98e67ed59e1d1-39d7097de14mr4540945a91.4.1788988092185;
        Wed, 09 Sep 2026 14:08:12 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm62231705c88.2.2026.09.09.14.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 14:08:11 -0700 (PDT)
Date: Thu, 10 Sep 2026 02:38:06 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robh@kernel.org
Subject: Re: [PATCH v13 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <aqHKtvuWZCQTDnux@hu-mdsor-hyd.qualcomm.com>
References: <20260909-lt9611c-v7-v13-0-aec234483725@oss.qualcomm.com>
 <20260909-lt9611c-v7-v13-2-aec234483725@oss.qualcomm.com>
 <20260909095358.41EBC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909095358.41EBC1F00A3D@smtp.kernel.org>
X-Proofpoint-GUID: aikYHNiOIg8JSwUiGBFVPj2RnwNmhL0T
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa1cabd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=DJsLk9TwWp4BRhIVdl4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: aikYHNiOIg8JSwUiGBFVPj2RnwNmhL0T
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIzNiBTYWx0ZWRfXxMss28LzsRhb
 vw67QxJDNU0W0tIFVUbqSQIrqrBGyFKuMculA4SRJf9LTVTu8hDdZ+vzAxe4dKxdgUsPqMVIl+M
 dBMetyMZANpmEB//jeHX/8fLT3BgpwA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIzNiBTYWx0ZWRfXwFykoEHo+8zA
 x8isgVflZL26LfIdmCxkBXu9cvPBYW8VjNjXck2xoavt9+oXWBpruCpJB80OlJy1upVGrBWBmRu
 cKsKhti4gKAinaAF75SlNTXDrp9kgRnpLzU+Y3aFhMbHUrnax7xa1S+OvC16x6VOFx+85IErfMP
 JS+NSrpoPdUsNF4+DwnMU8fsJRe2EY6i19aLAt3ABeQzy+yGQu5BPu/mTHzPMyPnDMGm1VnxHxW
 owEyirTGvobYCRz/XC7oUHrTEbw99RLHKOIp5Ig+QJeuH3ErI7Spsw/wbftGRdSKWJEB6YL0w4B
 PrHKrwr0mUtU1h6op8kzIve7+x3DpZGWrd/QygJ26m6NvOjwl4wKWM7/dzAm5Jv27ZWQAsmW5qU
 rmWt3llB0fiNcJlTSznFI5lwsz1/m/NdxbTKoZgusE/EMz/K2CDZfJhgUMYAAVhQ+n5FWUVxzmQ
 jGPHWzMjAbZ03y14uoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090236

On Wed, Sep 09, 2026 at 09:53:57AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Hardware reset causes regmap's page selector cache to become desynchronized, leading to register accesses on the wrong page.
Same as the earlier lt9611c_reset question — win_page is a local variable recomputed from the target register address on
every access, not stored persistently in the regmap struct. With REGCACHE_NONE, _regmap_update_bits always performs a real
hardware read of the selector register before writing it. After GPIO reset the chip reverts to page 0x00, regmap reads that
back and re-issues the page selector write before accessing 0xe021. No desynchronization is possible.

> - [Medium] Memory leak of device tree node references on probe error paths.
This can be fixed with small change in v14 with any other comment if
there.
> --
> 
> commit 8472ac6fb646e6b178a64a965210c4a862f133a2
> Author: Sunyun Yang <syyang@lontium.com>
> 
> drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
> 
> This commit introduces a new DRM bridge driver for the Lontium 
> LT9611C(EX/UXD) DSI to HDMI chip. It handles chip initialization, EDID 
> reading, firmware upgrading, and audio infoframe setup.
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> [ ... ]
> > +static int lt9611c_probe(struct i2c_client *client)
> > +{
> [ ... ]
> > +	ret = lt9611c_parse_dt(dev, lt9611c, &dsi0_node, &dsi1_node);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to parse device tree\n");
> > +
> > +	lt9611c->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(lt9611c->reset_gpio)) {
> > +		ret = PTR_ERR(lt9611c->reset_gpio);
> > +		return ret;
> > +	}
> 
> [Severity: Medium]
> Does this error path leak the device tree node references? The call to
> lt9611c_parse_dt() acquires remote endpoint nodes for dsi0_node and
> dsi1_node, but returning directly here skips dropping those references with
> of_node_put(). Should this jump to an error cleanup label instead?
> 
> > +
> > +	ret = lt9611c_regulator_init(lt9611c);
> > +	if (ret < 0)
> > +		return ret;
> 
> [Severity: Medium]
> Similarly, could this return statement leak the same device tree node
> references from lt9611c_parse_dt() if regulator initialization fails?
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
> [Severity: High]
> Can this cause regmap's page selector cache to become desynchronized?
> 
> The lt9611c_firmware_upgrade() function writes to page 0xe0 earlier, then
> lt9611c_reset() toggles the reset GPIO. This reverts the chip's internal
> page register to its default (0x00), but the regmap core's internal state
> caches the window as still being at 0xe0.
> 
> When lt9611c_upgrade_result() immediately attempts to read from 0xe021,
> will regmap skip writing the page selector and accidentally read from
> page 0x00 instead, causing the upgrade verification to fail?
> 
> [ ... ]
> > +static int lt9611c_bridge_resume(struct device *dev)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	ret = regulator_bulk_enable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> > +	if (ret) {
> > +		dev_err(lt9611c->dev, "regulator bulk enable failed.\n");
> > +		return ret;
> > +	}
> > +	lt9611c_reset(lt9611c);
> > +	enable_irq(lt9611c->client->irq);
> > +
> > +	return ret;
> > +}
> 
> [Severity: High]
> Does this reset during resume also desynchronize the regmap cache for any
> subsequent display setup or HPD detect reads?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260909-lt9611c-v7-v13-0-aec234483725@oss.qualcomm.com?part=2
