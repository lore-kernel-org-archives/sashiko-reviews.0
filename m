Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376228;
	b=F8hY/d6QRRbH9ggRGRhYQk7TXwFMj4nVh+wR8rfLE0fU3D5iasXf5gl7nwDAoCwD/T6f
	 r49p/YdP4Dzs6sZo2JakFeoAxlPQ5I/YCUB7emUNKkZ0nv03U8OpTQesj1qJanNI50dsL
	 a68QBWv+iTulKNGn5NhtxuzT6GujFgY0+CYR9cOuDa/kY8Y5WG4UNRxciA1oJpTy5AuIz
	 LBdA0MWNZo/EDv6nEUX27hjyJHCEk1RcH5mH1AZw7WZWUgvgIHibKkicC2MIwO1+lfubt
	 EUi2W1tb0bgYnZnKd15rpIZHsXABl3paeShw6YsmEHRiOSSnV4oiQq8+N1/I8tEf0KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AR3wxTpCn4fPZMsTPtQgVxEZ/XZfuPty0wu9tEDhxSE=;
	b=aKb/hF4JtzO4j1NXCoDk+kfvJxveTdw9CqXro6xQCNfApcM8Zr86u/Y1LfPzEu5MBc99
	 EoS39uRjdIxbne2p993XCqvNHYaQzGiJYNmm98yGheb4KkEn9q1eRkJHCUsLCexapnjH1
	 airITZDT6OzJRK6FAP1TmQE+GKFwbINDqxJLIHACnBrTd5ERh/PUZaZ6gYQaFvUTpHeVR
	 zmgYXVBIsnCpdgdIG5is6VYPMk0xO2p29a6TDUgOZyOHj+n7WpT3QZPCO4uv0KOO2NI1q
	 RDesohSA2NU8qazJOTGxg+URg1qyUMyJAkW04HZY+lC1bjdBIFaVas+B6Wk8DD+1fmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hNLd8UuV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kYIzsVpA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C66960A5BD5
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 19:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C66960A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hNLd8UuV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kYIzsVpA
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGV1sE3476840
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 19:37:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AR3wxTpCn4fPZMsTPtQgVxEZ/XZfuPty0wu9tEDhxSE=; b=hNLd8UuVn1GZNd+C
	yju+czmzGQHj7zTJaJ8M483pjlEGDtb22xI+KPlArcIu4G4Lxjd1+onlsYHMfxyg
	SFTy08ZgMYIOcxKB4UJmONtlOyi8Z3iHY5xa0l66kSZsehuDBpY/iBiOpBFXyLLY
	tWOKdfZkaamoR/3e0iGg7Zm4EdoJ1QAWQgknGv7R3+O31sx0mnEg7VFOu8pxxs9f
	os8H5We8MKwMaTx7WJVMsdmgjz/gcbA+u19cU9iJz2f6qiArlCqraBrpwsicwL1y
	rt/1lKGOMgN17FroC6B4z5kcyde9VFNZd9Q9LBTNwWcT31u6ciKAIqaIOtTrka3O
	CQsL3A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j342gm0fb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 19:37:06 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1629559c88.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 11:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376226; x=1795981026; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AR3wxTpCn4fPZMsTPtQgVxEZ/XZfuPty0wu9tEDhxSE=;
        b=kYIzsVpADARn7JZOpItY45hmuifhU1bdl/Ix8uBiFDMPOe8OHryaLyhJ1eLooN1Xbv
         auhGMTRIqAc/rqzF6nwU4YKMu+WUNwXYw8V5iZxIrpB//ZcBZOzwGUtStZN/YVBzn8vo
         jDA+o6293UcaQRA7iFURRygQo9oY7qKWhC5sroI86HJ2k6cdt3pdbxG6sL89qtm1s71V
         jStd6O/9aj+iZtEobDtzJ0sgcxpbmRF9980bYdKdReckuVPTuReqbYZQCf7dCjsLSGSI
         lZvhxKyBDDsqdE95dS0QnbfBXG+0Ddji0EkihOrc8sWFQEf2moRgkOqZ69Gos7yiGGZF
         yrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376226; x=1795981026;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AR3wxTpCn4fPZMsTPtQgVxEZ/XZfuPty0wu9tEDhxSE=;
        b=DILwrmgdIMPOFU2FhQWx0BGiNoO53mwQwUV74gZEOncnc8UHpVrwNNeqrqdiUxWawQ
         b5nkUypIuhIpAp/jA/CuhlKTUXXOOK6DOT4L73oE0KGDEsZ6lNr/FF3VWIN6etyUt1u/
         41q+JO9MQsAXuVE9WKNIOuckrIzpW2u7crZDW93n8ckea/w5L5hujA1W6kMHSuCsL6ox
         WXzM20tSlb6cWcNT7TL2RCxYmqlIokAgqS8PrJrdInusQkF7dMV3khh2f0TqNvvYscgo
         m+4pK4uKB8F9D2tSWsSCqNJlY8+4GeK5JmeMjEduvUlcdaaMhovQhd51smV3JDnxcPs7
         RASQ==
X-Gm-Message-State: APuU4Z+Fz3aTQiERQgEzda2uNn+UTWhOyQxhZhgDYvI3JE1LETaT/Dht
	MAIbtFtI/PMZb3pfpJJYm4lG5fWxqwNJnPuqV2haC99HPX30yrgYI4trRjqhJzOYFqsxRZXK4R4
	Z2LDQ4lt3g7LKAOBHbb8wfFPUEKq2nx7+4HmDDYenkoYpcJVhN6sJ2Fff2frAI75NIgmqSPlEG7
	INyP0=
X-Gm-Gg: AZFdTZcSBCVYbYj7ofR6b2ZitU6OKnco5QV5NDz1zV8AjgyPsGZOBKITHa9fa94fZ9F
	WPLyi4AIHSocPmUuTSJZj74ushXRJI4NqP5s/xwr02vEPzLV6WilgRq//04B2h3Wy5pUJgg/9AI
	gPUPcbStEOWb1Ycc5SvWpqPV9e9qep73KQ6UXamO9y+k2+xaQNBVNMDHl1pQaSz8GVfj4QIl+Kj
	Dbq1hoodIjApm08zuJ6GXsSqkmOWne/f0kBU/wc7AxNrj0Kg7ClAyP5IKb941JYgqYRbFjrwWuB
	T05Y9iDFZmpccaFCk25M+UIHrqJ5P0ddLkEnVvSqcoM8moxd16x/vQU9YrXOg8wTrAWs5gFdSpa
	Eb81puhFSpqcVrST+/bMLw3OzHyTg1BJD83A++pAcqIyvx4Et5EjnRPnUY1tWtn4XzZzarvAKPm
	c=
X-Received: by 2002:a05:7022:2209:b0:1b2:43ac:d3a3 with SMTP id a92af1059eb24-1b5568b9e59mr12369984c88.24.1795376226073;
        Sun, 22 Nov 2026 11:37:06 -0800 (PST)
X-Received: by 2002:a05:7022:2209:b0:1b2:43ac:d3a3 with SMTP id a92af1059eb24-1b5568b9e59mr12369954c88.24.1795376225433;
        Sun, 22 Nov 2026 11:37:05 -0800 (PST)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm36391893c88.9.2026.11.22.11.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:37:05 -0800 (PST)
Date: Mon, 23 Nov 2026 01:07:00 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v18 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <awNEXKZ4PcBlFZ6t@hu-mdsor-hyd.qualcomm.com>
References: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
 <20261021-lt9611c-v7-v18-2-4978b94896f1@oss.qualcomm.com>
 <sashiko-outbox-179959@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-179959@kernel.org>
X-Authority-Analysis: v=2.4 cv=H+5OUOYi c=1 sm=1 tr=0 ts=6b034463 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=IY4m9wzs8ccATqxbe_oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: CbjSkRGiNmQRmGXjrj2rPk5c-bEgTCKl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX3UjvpyO3DLlg
 aopfNioBKM5G0wozq0kqiwJArGqE8SVkbRMLDmiOyosI5V2Qb5oc2UpMHcr7IR6eQKU8gwcoWMe
 OrrE+DEVcUGM9VEWiFsUoslL70RxOEc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OCBTYWx0ZWRfX+p6/wh/wkQbM
 CiZk6bEmUJDnrBcbIfnuLhCPC8blxvH9iu4LcUj90buxTkG30x1wBEuuLE4/D4C1h5PniPko+3U
 Sw9H5QtR3z1pgu9Rv2DE92PRlWOplKUE9fSMFdHPaA7ffWo7kRxuEa+A5aS+ZcAKkwrdOKtReyr
 vj52YJCfQ8SR9WqTNnHPzp2Pr6Ij3o6FDFJVonTufWBEdZvhbryfwh5jBkKpi1AlpkbCpS9D7AP
 HGwqOo5mb5ALMgc3dH4fwA4a9E8S5sdpZkl32NECFmeyGc/CwlZTW97hb6JSruOtLEb99iGDC/U
 WzrHopOukuNapERMwIX9M9lsSMkplUqfpgOqFLcQ+zccfupSBhA0wz2yWQNrSrh8cx7wdluin20
 nj2oKVPWDPrmeYTo3UMQWlBG/yd8au4eGNJQPHD/963UdfHBSaF2DAsndZZxuV2ynZWMuzUz9fX
 TJ1TlnKAyoxa9iJQHZQ==
X-Proofpoint-GUID: CbjSkRGiNmQRmGXjrj2rPk5c-bEgTCKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220078

On Wed, Oct 21, 2026 at 08:23:47AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [Medium] drm/bridge: lt9611c: negative errno stored in fw_version corrupts firmware_show()
> - [Medium] drm/bridge: lt9611c: unlocked reset and power control in PM callbacks
> - [Low] drm/bridge: lt9611c: unused function warnings when CONFIG_PM_SLEEP=n
> - [Low] drm/bridge: lt9611c: missing MODULE_DEVICE_TABLE() for lt9611c_id
> - [Low] drm/bridge: lt9611c: unlocked reset of hdmi_connected after bridge attach
> --
> 
> commit 990744b0d700fbd77a4343ac0bdea653a817a6ce
> Author: Sunyun Yang <syyang@lontium.com>
> 
> drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
> 
> This commit adds a DRM bridge driver for the Lontium LT9611C, LT9611EX, and
> LT9611UXD MIPI DSI to HDMI bridge chips. It supports EDID reading, HPD
> detection, HDMI audio over I2S, dual-DSI mode, and firmware upgrades via
> sysfs.
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > new file mode 100644
> > index 0000000000000..8fc86c0732122
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > @@ -0,0 +1,1361 @@
> 
> [ ... ]
> 
> > +static ssize_t firmware_store(struct device *dev, struct device_attribute *attr,
> > +				      const char *buf, size_t len)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	if (!lt9611c)
> > +		return -ENODEV;
> > +
> > +	dev_warn(dev, "starting firmware upgrade — display will be disrupted\n");
> > +
> > +	ret = lt9611c_firmware_upgrade(lt9611c);
> > +	if (ret < 0) {
> > +		dev_err(dev, "upgrade failure\n");
> > +		return ret;
> > +	}
> > +
> > +	lt9611c_lock(lt9611c);
> > +	WRITE_ONCE(lt9611c->fw_version, lt9611c_read_version(lt9611c));
> > +	lt9611c_unlock(lt9611c);
> > +
> > +	if (READ_ONCE(lt9611c->fw_version) < 0)
> > +		dev_warn(dev, "upgrade succeeded but failed to read new fw version\n");
> > +	else
> > +		dev_info(dev, "firmware upgrade succeeded, version: 0x%04x\n",
> > +			 READ_ONCE(lt9611c->fw_version));
> > +
> > +	return len;
> > +}
> > +
> > +static ssize_t firmware_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +
> > +	if (!lt9611c)
> > +		return -ENODEV;
> > +
> > +	return sysfs_emit(buf, "0x%04x\n", READ_ONCE(lt9611c->fw_version));
> > +}
> 
> [Severity: Medium]
> In drivers/gpu/drm/bridge/lontium-lt9611c.c, what happens in firmware_show()
> if reading the version fails after a firmware upgrade in firmware_store()?
> 
> When regmap_write() or regmap_bulk_read() fails inside lt9611c_read_version(),
> it returns a negative errno that firmware_store() writes directly into
> lt9611c->fw_version via WRITE_ONCE().
> 
> Subsequent reads of the sysfs firmware attribute will then format that
> negative errno with "0x%04x" in firmware_show(), emitting a sign-extended
> 32-bit hex error code (such as 0xfffffffb) to userspace instead of a 16-bit
> firmware version or an error return.
> 
> Should firmware_store() only update lt9611c->fw_version when
> lt9611c_read_version() succeeds, or should firmware_show() check for a
> negative lt9611c->fw_version before formatting it?
Will be fixed in next version
> 
> [ ... ]
> 
> > +static int lt9611c_probe(struct i2c_client *client)
> > +{
> 
> [ ... ]
> 
> > +	drm_bridge_add(&lt9611c->bridge);
> > +
> > +	/* Attach primary DSI */
> > +	dsi = lt9611c_attach_dsi(lt9611c, dsi0_node);
> > +	if (IS_ERR(dsi)) {
> > +		ret = PTR_ERR(dsi);
> > +		goto err_remove_bridge;
> > +	}
> > +
> > +	/* Attach secondary DSI, if specified */
> > +	if (dsi1_node) {
> > +		dsi = lt9611c_attach_dsi(lt9611c, dsi1_node);
> > +		if (IS_ERR(dsi)) {
> > +			ret = PTR_ERR(dsi);
> > +			goto err_remove_bridge;
> > +		}
> > +	}
> > +
> > +	lt9611c->hdmi_connected = false;
> > +	enable_irq(client->irq);
> 
> [Severity: Low]
> In lt9611c_probe() in drivers/gpu/drm/bridge/lontium-lt9611c.c, can setting
> lt9611c->hdmi_connected = false here race with lt9611c_bridge_detect()?
> 
> Once drm_bridge_add() and lt9611c_attach_dsi() have been called, the DSI host
> can bind the DRM device and run initial connector detection, which invokes
> lt9611c_bridge_detect() and updates lt9611c->hdmi_connected under
> lt9611c->mcu_lock:
Will be fixed in next version
> 
> 	guard(mutex)(&lt9611c->mcu_lock);
> 
> 	ret = lt9611c_read_write_flow(lt9611c, &cmd, &rsp);
> 	if (ret)
> 		dev_err(dev, "failed to read HPD status (err=%d)\n", ret);
> 	else
> 		connected = (hpd_status == 0x02);
> 
> 	lt9611c->hdmi_connected = connected;
> 
> Writing lt9611c->hdmi_connected = false in lt9611c_probe() without holding
> lt9611c->mcu_lock after the bridge is attached can clobber the detected state
> (and lt9611c is already zero-initialized by devm_drm_bridge_alloc()). Could
> this assignment be dropped or moved before drm_bridge_add()?
> 
> [ ... ]
Will be fixed in next version
> 
> > +static int lt9611c_bridge_suspend(struct device *dev)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	disable_irq(lt9611c->client->irq);
> > +	cancel_work_sync(&lt9611c->work);
> > +
> > +	gpiod_set_value_cansleep(lt9611c->reset_gpio, 1);
> > +
> > +	ret = regulator_bulk_disable(ARRAY_SIZE(lt9611c->supplies), lt9611c->supplies);
> > +	if (ret) {
> > +		dev_err(lt9611c->dev, "regulator bulk disable failed.\n");
> > +		gpiod_set_value_cansleep(lt9611c->reset_gpio, 0);
> > +		msleep(400);
> > +		enable_irq(lt9611c->client->irq);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
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
> [Severity: Medium]
> In drivers/gpu/drm/bridge/lontium-lt9611c.c, should lt9611c_bridge_suspend()
> and lt9611c_bridge_resume() hold lt9611c->mcu_lock while asserting reset_gpio,
> toggling the regulators, and running lt9611c_reset()?
> 
> During system suspend and resume, disable_irq() and cancel_work_sync() only
> stop the HPD interrupt and lt9611c->work. Because fw_devlink relaxes
> bidirectional OF-graph links and there is no PM device link ordering this I2C
> client against the DRM master device or audio codec, bridge callbacks such as
> lt9611c_bridge_detect(), lt9611c_bridge_edid_read(),
> lt9611c_bridge_atomic_enable(), or lt9611c_hdmi_audio_prepare() can run
> concurrently.
> 
> Those callbacks serialize hardware access with lt9611c->mcu_lock, whereas
> lt9611c_bridge_suspend() and lt9611c_bridge_resume() assert reset_gpio,
> disable/enable the vcc and vdd supplies, and run the 400ms reset sequence
> without acquiring lt9611c->mcu_lock, which could reset or power down the chip
> mid-transaction in lt9611c_read_write_flow().
Will be fixed in next version
> 
> > +
> > +static const struct dev_pm_ops lt9611c_bridge_pm_ops = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(lt9611c_bridge_suspend,
> > +				lt9611c_bridge_resume)
> > +};
> > +
> > +static const struct i2c_device_id lt9611c_id[] = {
> > +	{ .name = "lt9611c",   .driver_data = (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611C]   },
> > +	{ .name = "lt9611ex",  .driver_data = (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611EX]  },
> > +	{ .name = "lt9611uxd", .driver_data = (kernel_ulong_t)&lt9611c_chip_data[CHIP_LT9611UXD] },
> > +	{ /* sentinel */ }
> > +};
> 
> [Severity: Low]
> In drivers/gpu/drm/bridge/lontium-lt9611c.c, is MODULE_DEVICE_TABLE(i2c,
> lt9611c_id) missing after lt9611c_id?
> 
> Without MODULE_DEVICE_TABLE(i2c, lt9611c_id), building the driver as a module
> (CONFIG_DRM_LONTIUM_LT9611C=m) omits the i2c:lt9611c, i2c:lt9611ex, and
> i2c:lt9611uxd modalias entries from modules.alias, preventing automatic module
> loading when devices are instantiated via I2C device IDs.
Will be fixed in next version
> 
> > +
> > +static const struct of_device_id lt9611c_match_table[] = {
> > +	{ .compatible = "lontium,lt9611c",   .data = &lt9611c_chip_data[CHIP_LT9611C]   },
> > +	{ .compatible = "lontium,lt9611ex",  .data = &lt9611c_chip_data[CHIP_LT9611EX]  },
> > +	{ .compatible = "lontium,lt9611uxd", .data = &lt9611c_chip_data[CHIP_LT9611UXD] },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, lt9611c_match_table);
> > +
> > +static struct i2c_driver lt9611c_driver = {
> > +	.driver = {
> > +		.name = "lt9611c",
> > +		.of_match_table = lt9611c_match_table,
> > +		.pm = &lt9611c_bridge_pm_ops,
> > +		.dev_groups = lt9611c_attr_groups,
> > +	},
> 
> [Severity: Low]
> In drivers/gpu/drm/bridge/lontium-lt9611c.c, will building with
> CONFIG_PM_SLEEP=n trigger unused-function warnings for
> lt9611c_bridge_suspend() and lt9611c_bridge_resume()?
> 
> SET_SYSTEM_SLEEP_PM_OPS() expands to nothing when CONFIG_PM_SLEEP is disabled,
> leaving both static functions unreferenced without __maybe_unused annotations.
> 
> Could this use DEFINE_SIMPLE_DEV_PM_OPS(lt9611c_bridge_pm_ops,
> lt9611c_bridge_suspend, lt9611c_bridge_resume) (or SYSTEM_SLEEP_PM_OPS())
> along with pm_sleep_ptr(&lt9611c_bridge_pm_ops) on .pm so the compiler can
> dead-code eliminate the callbacks and dev_pm_ops structure when
> CONFIG_PM_SLEEP=n?
Will be fixed in next version
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com?part=2
