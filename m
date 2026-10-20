Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495410;
	b=VeMRuxbNlWRlWrTibF3R15ZUp6xi6ER6BWB5zGhoLjtd+F0XJk7z1K3skXxm7jvKYLAa
	 mIYGiFXDz9AOavdNKDhU7f2eiIu+kwY9ngZRfPxzgSph1jGcAJzC11QBpK4YiySenmYxp
	 SEcW0COEAg07mjfyQ9JMnVEfslFy1tGnk2VcqgqyyQWDhJGv/otHNjjuN5IJ7VNJf5Hck
	 6nXJ37Q/Q/9xx6mpCm//lop9+Fup3LJWvEgs/GBGbJI8hlD/4vdmM8QPZXYilKpggk4KJ
	 kRdRCr5lAgVQZU9ytI7iQRU1Bl0jxkH7PJm/Gf+ddsP97hEo4hAOzkmnpHyKuJ+5DgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495410;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qhh0ZV45FGIUTeIwsmsxV4mxFb/EQ7WWA7zG32iYPew=;
	b=mtaWN/6RE6/P72OykwLJzbcSol4MDJDevjAGGtiPD8cyji+5tI++PnlgLd2ZYNrBbn66
	 RYk2Vs+ZttiCsXFSKvWhUjEUGHwXS+3dR38mRwSPWhmGohbDn/ZzWtfzGbQoWmRxqoS6+
	 BNvxMWj7SlDKwzbgmwU7roXGIjU/RepGfNFJraTObWZMZhW6RWotcvsiF0Ci24QGbWSVc
	 xbuy2mFs/nbO0Qixbttkd4c7xoGZHOtt6g6OGLjJooEb6citykkBVL/W+p46BoFDeqMst
	 Az46hqyKbPEjr9SXR9efDVBuTCRbvVzbvSta+iFMjh1mFqvJleKweGILjBLWlOqDdKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B05AQ//3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SkBbK+g0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389E5606A323
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 11:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 389E5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B05AQ//3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SkBbK+g0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx7rq2524261
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 11:23:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhh0ZV45FGIUTeIwsmsxV4mxFb/EQ7WWA7zG32iYPew=; b=B05AQ//3bin4597i
	8GD/kjSrr0VfInVU74gSPlE9m04Eh9WHk19sJCGQunDEY+DJgCFZtdfgZ+SeGadw
	LXDJDBd8djPjp0Lu2UQQjst3x0OeE50hedLwWFjiR2NqOGCphCKhtIDlYJRwU51l
	R3yovryvY+oXf8J1BmPNZhz3v/rvkJm79FUqenDj6oAo5B/mxfCDZjaFwLf21Kpc
	xlCBZ1zK+oGNX60eRFdk9y7WR2MkbwS6XJT8td2yS0fXxMz+WenZDlk4dQsXWWq+
	knyXHi6yhLXXdF4PzW7OHfhQ3tCzBh0yCYpeaHGreI2MpDCJTNwkzijNqwPoSxf5
	pUKJjw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p288w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 11:23:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so6791684eec.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 04:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792495408; x=1793100208; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhh0ZV45FGIUTeIwsmsxV4mxFb/EQ7WWA7zG32iYPew=;
        b=SkBbK+g0/j+g1o/SwfWzHY4z0j9Em0bA+FAI1lCPZo/Ao2oHBOk96Y8gQS67jJ2blP
         ttkPqLCpNP0jVIqmjrKjzE4FlVHN8XCMKljMcqU4Mj9okhMEV3B8vs1kdiSkJpvnH8v/
         /XcQGTr6eLxevA6Upcr1yPnu5+RW8rWlNccST3hnNUNbpCLE7ZAeG3xgQ1zAwqb8ROtW
         Q+8ZMhwFAm3sS9uk87owkBshGYu1rxJZPiH5tuRLTj7BaTQVOGdlHC2WrCXzrdcDwlqj
         8HAzY9xwh2g8E/wB5Vd5tKdWAKw/5A+lbe/ra5lXRIP20Ko11Q0NLmzhPUBFwf+QwWpQ
         Z3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792495408; x=1793100208;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qhh0ZV45FGIUTeIwsmsxV4mxFb/EQ7WWA7zG32iYPew=;
        b=kcq5RZ/xM3NnI4ABDITtZHtIOHac4Xre1a5tSK/bXZPgQDtjwfZ7UBlpayV6SQN/9o
         COpILULQiSTaQqOwPjEgVQMWIm57urgTWaKBhLgbuEWUVYQMIgDdCGTg0OJeYRX3mLEC
         wVFdY4EAgzrpKKQl1/eG2asmamPSP0p5ktC7FXVaqwM2eN1ajlSwMNKT+PlDO3LUupxs
         0vjGsmpq4Zfqn294nzqnnLR5xTi5+Z4wyxqTb8fSrGDm7YJKKTDkegr38bi6smz64Knj
         BYjCxrXExDZYvrpCiD4JVH+YKNRJt2P+vGmp1/2cKjRluqCLtzRaNCRJb0K0RtBboSIA
         1p8g==
X-Gm-Message-State: AFq9FYLCY3Ym1N03MTJgTIxeqr0RyR4EleP5L1otCgjmiar9+ehLQ42D
	QvJ1YDOZVUh8u18OUQc/GrauPGZjIyKSXFlmo3As3G/XkUYRn6H0dN2G3duo1hzUIvvObkFIfk9
	/o5y5MEH/BQ/gt4wEIh6WeXVsxOnTmiQHk/LvcMwgIQ8i4hzDmcc/9EUCy7uMxnKF60xhiQQpS5
	/IR+Y=
X-Gm-Gg: AYBFou1KqioxjM7g1qdxjwXVtvVn9TRE85WDAJGcIde5Z9UTCULpWoLJPklUlSDyDpP
	wJmasGwRZ+XqbRkE/AfmPnuMUykYHkZCbfeiwKTwNI/QITbNf9HLdaWU1lhK5/cXtto1KR/JHLb
	MSB5TsmgIBXBzdcunYXg9gHsBe7ZaookqqtkH8Wz82+oEIQtL+LyrvpWxROKfVLb6Bv7TtGlUPu
	jD841oLOxhODnXC3zmkjG6bS9qpGNfvuoHMKmWQ7JVee62Sc/3pF7rFLgfLCkz1NwG87YxcpRpS
	yoafDnpD/q+x93AeAsbr4FRa8t57iqIM9YTEDCeOKhoQhAjVKQrB/NQfsTRnt2lZ51SPkmcYG9n
	3gsCf2CNWqpgMb+w+ixnqHWo3oA==
X-Received: by 2002:a05:693c:8092:b0:35d:8c3a:38a8 with SMTP id 5a478bee46e88-361a2942646mr16312723eec.39.1792495408282;
        Tue, 20 Oct 2026 04:23:28 -0700 (PDT)
X-Received: by 2002:a05:693c:8092:b0:35d:8c3a:38a8 with SMTP id 5a478bee46e88-361a2942646mr16312690eec.39.1792495407584;
        Tue, 20 Oct 2026 04:23:27 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm41575611eec.5.2026.10.20.04.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:23:27 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:53:21 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v17 2/2] drm/bridge: Add Lontium LT9611C(EX/UXD) MIPI DSI
 to HDMI driver
Message-ID: <atdPKccBp6CFiTzp@hu-mdsor-hyd.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: mwVZ85NAJnL1bixu6w0drgs3fEuVWQya
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NSBTYWx0ZWRfX+rTU1SaFD2v0
 88dG1NWykdarsWZGwUxQM4Hwur6JMYF0tMArr6sEX1MKjZl1mOsFdHxgN/9oYV2aq8UlyZajCnm
 hTT78PirntoTD7bDYrtKsagHVpEAqBA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NSBTYWx0ZWRfX/yKIGeuWqfJc
 pDkHoDzlDYECUp4qi9Q3W7GtsiVaZlDpkqZTU5XdzjhrqOuDswbHi9OLOW5vnTwD/zRXNnSqqlD
 Xoy7+1TIc0QzdMp2ZDlJ6BkpJfx257Ok5MkH2qedxtQ0ZWM2yzbA6JWFoFCY3OrLWFEZRHDLASs
 O+skDv5lYoivrh1rfd41wMELAs5BmKKVoXhMopTcjAVrQKOMYpZLkQmRVg3Hnta+Pnk6JcYZuti
 +6IvKEgVTIBvVrllMV71DS5re/abbxTm7ICWWrzX56KXA5LisdzMFE1YjHmKFxaV9hVhsyE8JU9
 WapPBP5zuwD3cc1KfPfiz1n0EtvLalOkdPdFhEjkNQoTim0/Fz3kQlt/3UI1vXg24nDy5T5HDdf
 UTYfA0F1QMBrmLu5nV01UVWkR8LflhBNdKtOLU8o3ZwefwPHsGnUqR1YWkGsYJjZfctO8YcF8aO
 Vmvr7ShAmB5ClzatEng==
X-Proofpoint-GUID: mwVZ85NAJnL1bixu6w0drgs3fEuVWQya
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad74f31 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Kz8-B0t5AAAA:8
 a=JYkXmYT7k6CsIRxL8okA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200045

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
The atomic_enable hook in this kernel tree (include/drm/drm_bridge.h:339) takes a struct drm_atomic_commit *, while drm_atomic_get_new_connector_for_encoder() expects a const struct drm_atomic_commit *; therefore, the usage is correct, type-safe, and does not require any cast.
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
The LT9611C bridge does not require an atomic_disable hook for correct operation. The bridge MCU firmware manages its own state and automatically enters a low-power idle state when the DSI input clock is removed, i.e. when the upstream DSI host stops transmitting. Explicit power-down via an MCU command is therefore unnecessary and would require an additional MCU command sequence that could potentially race with DSI host shutdown.

System-level power management is handled by lt9611c_bridge_suspend(), which disables the regulators and IRQ, while display blanking/DPMS is naturally handled by the upstream DSI host stopping its output.

If a future use case requires explicit bridge shutdown between mode transitions, an atomic_disable hook can be added at that time. 
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
atomic_create_state is a valid member of struct drm_bridge_funcs in this kernel (see include/drm/drm_bridge.h:507), and drm_atomic_helper_bridge_create_state is the corresponding helper (see drivers/gpu/drm/drm_atomic_state_helper.c:909). This pattern is already used by other drivers in the same tree, such as chipone-icn6211.c. The atomic_reset hook you mentioned belongs to the older API; this driver correctly uses the newer atomic_create_state interface.
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
Will fix it
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
Will fix it
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
The driver works correctly without these fields for the following reasons:

supported_hdmi_ver - leaving this as HDMI_VERSION_UNKNOWN (0) only results in a DRM_WARN from drm_bridge_add() (drivers/gpu/drm/drm_bridge.c:464) and does not affect functionality. The only consequence is that ycbcr_420_allowed is evaluated as false, which is appropriate for this device since the LT9611C family does not support YCbCr 4:2:0 input.

supported_formats - leaving this field unset (0) also results in ycbcr_420_allowed = false. Display mode filtering is based on EDID-reported sink capabilities and does not directly depend on supported_formats. RGB modes are therefore unaffected.

max_bpc - leaving this at 0 effectively disables deep-color support, which is acceptable because the LT9611C firmware does not currently expose any mechanism for deep-color negotiation.

These fields can be populated in a follow-up once the hardware capabilities have been fully characterized, for example, whether the MCU firmware supports YCbCr output formats or deep-color modes. Until then, leaving them unset is preferable to advertising capabilities that may not actually be supported.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261008-lt9611c-v7-v17-0-1e8f5f2b2f19@oss.qualcomm.com?part=2
