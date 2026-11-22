Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376008;
	b=3gdu1v6nZfDLu9Kj/o7nMHYtoTN58kagMDVAD3Rsswoam+DxsrHiM1PmQ9Ya4YF5nAAd
	 uxAcrf+uqMc733sdx1aTPWUdFBKe6zSSaPb3SapEeBWaxOL0NHMo1q2m6527L4QbW/NrT
	 YSj+z2NlsTSKc0a8CehEJV1C23NVvuqUsxTAPPAma7kr9Uh/v1KXtQRyVHp+gIg8HZHTG
	 N27VNd0eurvpFinIHowQ0Qy79oY8N94SoXY1st4ekpSZORNvOqqkbGS/barNT3oSdKnmV
	 QoSvbMri0UxUNMUm/YdmshIlApCzNtp37KnLBB57myeA3pgvGhoTxre2+oV50ux2skQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376008;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wfDQkUDoBWgh6NvrfsXrMIRUmVcfOkBtNB6Z/9Xex1E=;
	b=b9vJxegKEmd52YjFPebvBunY1NLo4YGUjnd8oWhfb0VYuW2Poi2xnnJ5zsff4dHDTQaT
	 XGrf0CfUpg69desNqCr/z8bGQRuCW/9j0Ll45vPLYp+qNJbXYWanShRxOXpeoYh8lqt4S
	 ePkC9mM2NO6j0Jcodq+zD3aBpfI36TLb7G7egfQ7aOoxzoqysGRAgZp+1Er1s3wTUh13p
	 eW+t+d7rR/Xg7oay/SHhvZzZwM5yHI1yzke1IW+37curbTg3ECQnLYT5prHOsfNLN9s6A
	 S3DQTr6Yok5VndK3Bo4ru6jsADX0FPRgez4jW63ZwQkaorOlX/u02ReWbGJFg7HkOpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WsZLgjyS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KVrZHpeq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FCA606A31A
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 19:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23FCA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WsZLgjyS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KVrZHpeq
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMIe0mV2250061
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 19:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wfDQkUDoBWgh6NvrfsXrMIRUmVcfOkBtNB6Z/9Xex1E=; b=WsZLgjySi4NZ6DM4
	C4lEyjUg9jh9P0CH7oIwb1SnQRdQl4K6etiNR13OvxYW/Kay2W0bvjmegDpGQw1g
	0LIvo1RD0RUixtrWBfGRS2ZvrmCQqvz3q8Lc2RzMzZ2iurSPlDYUs+ORgzhoZqLF
	3jMhb6nGCDV7C4RkDvhqty2hBiIIo4Mm5hzhPz+M0TQR3FnuRaM0kJzXH6JjLqRL
	buE+rSuXZ59a2i0oFPpav4P+k5xglw4xO/mh8IJYQBSeXijwo0mFq3iE5hylJ/Ve
	GuUkpCATOGu4hNkd7NuSWSXnWOjs9Zm0WlQ2iWOTjm3kL2lSONQtmF7V9q6QJfqJ
	W8fGsw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnvfgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 19:33:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-370230d93efso8616731eec.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 11:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795376006; x=1795980806; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wfDQkUDoBWgh6NvrfsXrMIRUmVcfOkBtNB6Z/9Xex1E=;
        b=KVrZHpeq9WV/wl4WZ+3DnayTPIZHApLx+7Fhe+oSx5nxhMgwWdDgjvV7n+cyoPPb2C
         +36VYrFiE1LWBXPzzWlCQXDoZ3+3crZ4EpRiJx+xla5j2Y26Z2ew2pehpe1OQHZRLUpT
         /6oxSsIkU5iv37QEkjy5vm/lEvxzRnUlSGSgHp+MqZqeQwWkNzvVkVfqlMCINyrGET26
         vrwRyr7kMHGGjURCQdq4BQqLgwj+LOxubYG07as6k/BLF4dK4IA/b4/ky6kkFfl8oItW
         m5F6jZiNC8ZbOKNP4s4dIYpwksOkmDk/r/u1HUMzpdD9V+EyDJCpMumBe6qY+fxVet3x
         Ipqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376006; x=1795980806;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wfDQkUDoBWgh6NvrfsXrMIRUmVcfOkBtNB6Z/9Xex1E=;
        b=PcGZDT2669xGvfjmn812BCmW6TmYoQbBt8PCYXW0q3FJLnt5mol/eth8yjfrvttced
         jVmM75q0sUn5sJCDVRqC2poE2cHSggEQqlMitvEZfSHDTAh76IH2tDVxswjqJjwAK6GN
         hjxpB+5tQQ2fHjXgrm+RnnExeUi1ldtzU02iZaP7APnh8GV3lOcl99Of8uMPrqvnq+eL
         bwKzQbbrDK930PnHf1wCpfwAA0k4145wp6IxNo8twknUylnAy6RpKgRU+gHBXGyKxZZI
         h3hqK2SktaGKyjhN3VZosoyXATeWz0Yhqbca/4M/3wPXk8MEzeToPlSs4/pXRoNy8pbz
         ipYA==
X-Gm-Message-State: APuU4Z//Oh9BpDLGpL3Ti7JeMsbONMPf5j8pNq2ENtg3ZoQiYwZV/Lg5
	l8UHxs7GS/Gid6T9IQsASvwwTcdc9EyHX53an4xyODbp7XS+23L43tk0AJulu/4HgnonENF6F8b
	hKFyDqzxmM8LsiZmJe8MeHzaLMISd9s+hQV/cmfVqtf5uF2HiLakfHAW4zFNI1x7MTUqjb2gEEm
	4Brlw=
X-Gm-Gg: AZFdTZd7UJwwWVZKclMXkliO95NxOn851cjJj0e78tU7QGsXmuABccKX1qX0j56rKzt
	mwtNGZNHxcgIjrrRpKmvsV6YCLpBSHuDayAzgu6ZJkKFYH7syE2gjudqBin5uPACOohZCIXslmP
	i2pKgxw1cRAJECL8GT+7s6OHSlwVo+CVu5D5W3Ux5HNMRDLRR2ed5X9ZL/iGgf5p2rCWJijjKFd
	I0QvSi9YD9LXVhiMiQnpAlRoPnvmuxpTDkvohgaUYvY8tiN/8XTzChzETAURasLnFO5ZMlWKFry
	I1UwPCwSmN/aC78iL0777Tq0om9V1Yvy4RKBpYn3OuN7sDwXuI0ca6lroHiih7LzOLuTHqgntAm
	5V8uTxVf7pmWQzjQkz7EQTzpzZHdPpOy8eYdssvoBnUw2v/m848w43f3EhorCmj8z1oa7kUjFpw
	==
X-Received: by 2002:a05:7301:182f:b0:385:cf42:9b9b with SMTP id 5a478bee46e88-385cf429e7amr9674092eec.8.1795376005758;
        Sun, 22 Nov 2026 11:33:25 -0800 (PST)
X-Received: by 2002:a05:7301:182f:b0:385:cf42:9b9b with SMTP id 5a478bee46e88-385cf429e7amr9674050eec.8.1795376005141;
        Sun, 22 Nov 2026 11:33:25 -0800 (PST)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm6160806eec.18.2026.11.22.11.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:33:24 -0800 (PST)
Date: Mon, 23 Nov 2026 01:03:19 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v17 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <awNDf00s/ZUYtnnZ@hu-mdsor-hyd.qualcomm.com>
References: <20261008-lt9611c-v7-v17-0-1e8f5f2b2f19@oss.qualcomm.com>
 <20261008-lt9611c-v7-v17-2-1e8f5f2b2f19@oss.qualcomm.com>
 <sashiko-outbox-163341@kernel.org>
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
In-Reply-To: <sashiko-outbox-163341@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NyBTYWx0ZWRfX/Uux09uVu5vk
 oVvuwlaUE2sJuWlC52pafQp6mTYYas/kGm1+Z/UEKZXqFSjQgrKa1+fO2f/OmEc5K763bzyplOH
 nKVtqbaipFOo702MnfspXSbvBzxm5NYVfJkmqsi7/5t0MRvIudnsUXbwxiOTXdmFI0HJA/0rmKd
 MGtAwbzIZ/tyK5yJV2uE5fI67P5l2rALE2Nl9E5p+jNnEtc08OzBSiXOR8lM48SITtypca8drwH
 HOIRto5041I5OnumkD55RmqD/n3AZ3DzDxaaR28cTTm4JH6VbjY/vQfNbqR/PBrNBnr+bBVU5kv
 pQ/Pa+FVEkFn2iidgw8dJGOrVPvzv4qFjUKRnSYqP/zRCgfd/f3T7wLOR/VzGVx9mpd8Jz6lkH6
 o7ixUntn1iq0d4jmq5PKyOkWkEKrYLNDzCFiDu4O+Sh35f7LRt1R3xA3m/KZzhTbM1tcpRah+o5
 r0YPgMTQT3BEDQ+s2OA==
X-Proofpoint-ORIG-GUID: yI-wvXM-yUGXbKI2SjpVP5ULis90zVT1
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b034386 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=kDMPUpoz_E6gDt0g-SwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NyBTYWx0ZWRfX7egbSRCZHEvG
 qL/ytbEbKaCp0TBdviP9X66dEi80RFetuEHeGlUT3ZYxf7gP825niktFt13CsYyrrH0nxGUg47V
 g/HzIgC8CrV3vjhVeZsFoUKGglfJ8f4=
X-Proofpoint-GUID: yI-wvXM-yUGXbKI2SjpVP5ULis90zVT1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220077

On Wed, Oct 07, 2026 at 08:32:56PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [Critical] drm: build failure due to non-existent .atomic_create_state hook in drm_bridge_funcs
> - [Critical] drm: type mismatch and memory corruption in atomic_enable hook signature
> - [High] drm: missing mandatory initialization for HDMI bridge operations
> - [High] sysfs: NULL pointer dereference in firmware attributes due to registration race
> - [Medium] drm/bridge: missing atomic_disable leaves LT9611C hardware powered on
> --
> 
> commit 0482492a2bb6e8ef5381a82384662e6858358155
> Author: Sunyun Yang <syyang@lontium.com>
> 
> drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI to HDMI driver
> 
> This commit adds support for the Lontium LT9611C series MIPI DSI to HDMI
> bridge chip. It supports configuring single or dual port DSI inputs and
> provides HDMI output functionality along with audio and sysfs firmware
> update support.
> 
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt9611c.c b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> > new file mode 100644
> > index 0000000000000..6082c89b388bf
> > --- /dev/null
> > +++ b/drivers/gpu/drm/bridge/lontium-lt9611c.c
> [ ... ]
> > +static void lt9611c_bridge_atomic_enable(struct drm_bridge *bridge,
> > +					 struct drm_atomic_commit *state)
> > +{
> > +	struct lt9611c *lt9611c = bridge_to_lt9611c(bridge);
> > +	struct drm_connector *connector;
> > +	struct drm_connector_state *conn_state;
> > +	struct drm_crtc_state *crtc_state;
> > +	struct drm_display_mode *mode;
> > +	int ret;
> > +
> > +	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
> 
> [Severity: Critical]
> Does the signature of this atomic_enable hook match what the DRM core expects?
> 
> The atomic_enable hook in drm_bridge_funcs expects the second argument to be
> a struct drm_bridge_state pointer for the old bridge state. Treating this
> argument as the top-level struct drm_atomic_commit pointer and passing it to
> drm_atomic_get_new_connector_for_encoder() casts the bridge state to a commit
> state, which can cause out-of-bounds memory access when dereferencing the
> state arrays.
Will be fixed in next version
> 
> [ ... ]
> > +static const struct drm_bridge_funcs lt9611c_bridge_funcs = {
> > +	.attach = lt9611c_bridge_attach,
> > +	.detect = lt9611c_bridge_detect,
> > +	.edid_read = lt9611c_bridge_edid_read,
> > +	.atomic_enable = lt9611c_bridge_atomic_enable,
> > +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 
> [Severity: Medium]
> Is an atomic_disable hook needed here to properly power down the bridge?
> 
> The driver implements atomic_enable to set up video timings and dual DSI
> ports, but lacks a corresponding atomic_disable. During display blanking
> or system DPMS off, the hardware might remain active, wasting power or
> potentially locking up when the upstream DSI host stops its clock.
> 
> > +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > +	.atomic_create_state = drm_atomic_helper_bridge_create_state,
> 
> [Severity: Critical]
> Does this compile against the current drm_bridge_funcs definition?
> 
> The struct drm_bridge_funcs does not contain an atomic_create_state member,
> and the assigned helper drm_atomic_helper_bridge_create_state does not exist.
> The correct hook for resetting bridge state is atomic_reset, pointing to
> drm_atomic_helper_bridge_reset. Without a valid reset hook, atomic state
> allocation for the bridge will fail.
> 
> [ ... ]
Will be fixed in next version
> > +static ssize_t firmware_store(struct device *dev, struct device_attribute *attr,
> > +				      const char *buf, size_t len)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +	int ret;
> > +
> > +	dev_warn(dev, "starting firmware upgrade — display will be disrupted\n");
> > +
> > +	ret = lt9611c_firmware_upgrade(lt9611c);
> 
> [Severity: High]
> Can lt9611c be NULL here if the sysfs file is accessed before probe completes?
> 
> The sysfs group is registered via lt9611c_driver.driver.dev_groups, which
> means the files are created by the driver core before probe runs. If userspace
> accesses this before i2c_set_clientdata() is called, dev_get_drvdata(dev)
> will return NULL, causing an immediate crash when it is passed to
> lt9611c_firmware_upgrade().
> 
Will be fixed in next version
> [ ... ]
> > +static ssize_t firmware_show(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +	struct lt9611c *lt9611c = dev_get_drvdata(dev);
> > +
> > +	return sysfs_emit(buf, "0x%04x\n", READ_ONCE(lt9611c->fw_version));
> > +}
> 
> [Severity: High]
> Similar to firmware_store, this will dereference a NULL lt9611c pointer if
> the sysfs attribute is read before the client data is set in probe, or if
> probe fails.
> 
Will be fixed in next version
> [ ... ]
> > +	lt9611c->bridge.of_node = client->dev.of_node;
> > +	lt9611c->bridge.ops = DRM_BRIDGE_OP_DETECT |
> > +			DRM_BRIDGE_OP_EDID |
> > +			DRM_BRIDGE_OP_HPD |
> > +			DRM_BRIDGE_OP_HDMI |
> > +			DRM_BRIDGE_OP_HDMI_AUDIO;
> > +	lt9611c->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
> 
> [Severity: High]
> Since this driver sets the DRM_BRIDGE_OP_HDMI flag, does it also need to
> initialize supported_hdmi_ver, supported_formats, and max_bpc?
> 
> When DRM_BRIDGE_OP_HDMI is set, leaving these uninitialized (zero) causes
> drm_bridge_add() to log a warning for an unknown HDMI version. The HDMI state
> helpers will also reject display modes because no valid color formats or
> depths are advertised, which prevents display modesetting.
> 
Will be fixed in next version
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261008-lt9611c-v7-v17-0-1e8f5f2b2f19@oss.qualcomm.com?part=2
