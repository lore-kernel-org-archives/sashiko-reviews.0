Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524628;
	b=Uy8gNYbPjqLGLkyBpPryNJrFcc/WJe/nvAzrCRhw44rFc2nWhelg4jzy8CPgYrHZH8Is
	 x8ObMQ2sxfxWzobbnmiiBzKc+qACDs5kSW8Uj0HyeRlYPlxfnJapClTCna0zHf1ewg5Nf
	 sKkcmJ6NUoy+IU9XGL6beaRboqbX5vy45qOwdFduF0XMM4ntjl4mN9mE5aETxeTcdn3/f
	 GI1DzBhS5b4+0nX3//vZn5CecZMvES7jOQL1DpV1Ku8WQrDCkoPakW+04Ho+Irk5ppcbB
	 cXIVEX2Jn0icoYkBlU3ArJvL/Pmtjdt9iwPM6JhQeaPWQ41Rwt9PSBXxTVNWA1UTwOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524628;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=S+Bu1InFLW19DgDCJwbNOXYUTACmlNtymsROLTtp7yQ=;
	b=llNDWKvpTm37sz2bxcQaq59zZ7Moifg/MW+oLO8WiNu2sbRcjSmMMcrKSC0x4f65qA4w
	 XwJl4EJy9+HhRpcZGpjo1BP0bOHts5OAz6TCwBQJlfS5dMsYTv47IG8cx9AEFLGiTQXg0
	 vG9bSwQx5PYOOEZcxswdqv/cAyl5K2KGyBa+SNtMyBCPpRgKIEDvcImQ5eCJa0ilxs7tc
	 5JPqoArAX+rpXYaz+E+9km6tHQB0HtlNsUs7OzCbnis4kpGRJew5Ju5CyvK2v1VBkGpZ3
	 qw0NzkywfWSCqwcssbn3hHUvCIkgKmfJHmrQG9vskqvO6zBbjPAN2vmq+twCgWcvYjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="l/vRLWnJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U9CP8+ZE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A418606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A418606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l/vRLWnJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U9CP8+ZE
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuJsP636655
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+Bu1InFLW19DgDCJwbNOXYUTACmlNtymsROLTtp7yQ=; b=l/vRLWnJs0JuaXCz
	Wi8PxMO2o1k5K1HMeJ+A8bpug1uc8IGZh5oi7El9UE/B3xqMFLyYVlfMXAoBBYhZ
	/IAK88MuYs4fR/fhLY4hVUCt03HUtCEhPJ+Zl9pCVcZJ3+3asBQI7EdOITd0RwXq
	nL141PicfrhKoTGEv+H1/LVrWIxhz5TvE0/mHPoomj0dG5C3Z/snm7kHM+scHruo
	dFtfPUxS9al0CY2j2eCOrRYzf9W0mt7nQ8JMLLeMW1A4Ky4ha10ZUaWo9O5ZK2bL
	ayYqVhuN3n/EG3l6dHppCN3x4OK3/Q6A1z24jLv4yWmZo2jELKBwclV9yyKMR6wX
	LM83gA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rphr24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:50:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so3554296eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 04:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795524626; x=1796129426; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S+Bu1InFLW19DgDCJwbNOXYUTACmlNtymsROLTtp7yQ=;
        b=U9CP8+ZEMSpBn42PEfZTJRb9EhlZOb1pS2MkhhaD7eKhApRZIoKuE14bC+QbYhVdJB
         TWM6srJ482ZBgOBLlDoVpXejR4vYHQy6pexVzUym+ZGOECNaE2zM9VnNUWY8rmIV5ljt
         j5oIz6VWaGftv2YCUK61ZpbRd/TfhovOmT+5tpWy3nC0lAEXdUYHzsExItk0BERXNO04
         C+j+ulkh/591lD1c7sWFpTE4MydI6G/4iIsn1QAXWJXFOXItXB3MKHkZGUKhzmlAgDEN
         aGbYJX0g26UWW03g96hRL3Be2nSG2rwNbOnmmq+7DVhWaYXz8Kpv3pYyQas28g0DeBy+
         fHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524626; x=1796129426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S+Bu1InFLW19DgDCJwbNOXYUTACmlNtymsROLTtp7yQ=;
        b=eT0YkmRaCq6le1KjQEA3EYCtUIb/WkQE8EnIIw7uV21Equa4nuEvWAcf5I+X294+oa
         jMQ8hZY/OxaLaX25ZKACO2QXxdjs4e/Mbuj2g8RYUCwIbAqPSoa4zECUB8IdFFIItNjt
         eQtkvb7jDJVeAOqBvTQOwSATTjkHBVHb2hKwE90ppn8EOSGoS4uLHa1mk7EM2aT2puQY
         5zIm9c+koANgcmPpGT2+UORU6kxu2k8z+P1BFWMJaX2r7LnATgIIpZr+Ik9YIT0toogB
         +Uu4m2JlWnTITFiKVazckZFfV3rwtcdE4sfxFthAHZp05jQzaemygodU6f10rke0nHo/
         EvIQ==
X-Gm-Message-State: APuU4Z85alMigCv9qR7x6Ng0xjeJlRnkJwcQNsAa+ro/+UsimN/4pbqR
	OMj9e3mxBZhz9FrawfrYFMQVEr8V7fSmATML0Wp2X7by4ddrOLUivGOjnyA8kb7kTZ8sHnw84q0
	2cd8SF6vn2sBxp8jbZ0ZdjWSS9X5LEwDqfM22WdKoLu7BTj82UScgapgaAtEy6mCMl33b9wd2yl
	8CPsk=
X-Gm-Gg: AZFdTZdnFYWtvd1nNqtwkKovmJkMiEQ4xhW0VZtbwPCSo4rOcLiwYr/yBXdj6h/1z4k
	FRo6sl1VFQngqJI/qJBxlp4OYWnfad8voT13COGOHRXt6A5/Q1r8PRNiFdTeFXyy1XuLi6ScN/S
	EY/A0pDwke6IGz4WbwTEEXNnSu2Zuw4TRZ2KF1TQUriN/alVkGkpyTJltGNrQhD3wSJBFE2cX0R
	U6eKz7V6Yb+segkaG1wyKMtGVNjmeJ0Wu15fp+WM4JD45yf4rHKygf3so51de0vZF2cjl20OAOe
	rQ8p8RvncApS51xm18HKO59zOiL5p4nSWvmEq9YrbHKhXq/3BC4yPNcySjM58gSebiiiw6APcL7
	rD3iSTl+FOmB0ye2+fkzjTYxvQ5Rex6M6x7rQ/LsC7LpvyGaZiay9qkrUWR6d1nWhWz1JYaBDqX
	0w
X-Received: by 2002:a05:7301:dd86:b0:351:2958:1740 with SMTP id 5a478bee46e88-3856fb641famr14864670eec.37.1795524625986;
        Tue, 24 Nov 2026 04:50:25 -0800 (PST)
X-Received: by 2002:a05:7301:dd86:b0:351:2958:1740 with SMTP id 5a478bee46e88-3856fb641famr14864633eec.37.1795524625111;
        Tue, 24 Nov 2026 04:50:25 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm56119313eec.4.2026.11.24.04.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:50:24 -0800 (PST)
Date: Tue, 24 Nov 2026 18:20:19 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org
Subject: Re: [PATCH v3 5/9] media: venus: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261124125019.m5nksa3n7pk2pg36@hu-mojha-hyd.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
 <20261116162148.2864501-6-mukesh.ojha@oss.qualcomm.com>
 <sashiko-outbox-219164@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-219164@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0OSBTYWx0ZWRfX2xsOWbWvkjOH
 hmUXMYqXXce1ppb1FpjSJsw3K3eue0ULYAo86dxsWA8/g0PIdJp+CIcvsJ5FbFNJfVUHKHsy4rk
 Lt5xYtBqQjdF3cm4FEKDCoPcqaKEg/30kQZyQcLh6JNpqYZ59BkOENMvKF5s07P5Sdk3lkEwCnG
 Xzm0iQOysfTNBVUSKinoG7a7xNLwXw4H7WXMZmL3F1j1VZu2HwF6XRZvEjuvMt98VuuPnmdgs6f
 dI8l7EGXDwDtQ6jNTRaHAztGNcN8qj7jDbAB8zD+NZD2pSAm4vGfghhi3YOMySqQ7yzzS8guVkx
 DQWPpD0ZXQABQlo/3uqHRjXuAET0KjrToIgTsNN83MmeG+0MIpaLf+4l8QV35V3qj/3cz+IlN37
 eugFhp4xeX6y6FIo5UlH5S5D+hS2Em2TxRjv9+b83e259I8+zu82h5NHd9AbGTIqjrpZMRJwggb
 Xjoq5lAvqQ5C+W4xiEQ==
X-Proofpoint-GUID: 16dVUUf2-hciCpIynckmd9g11bPsgb_T
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b058813 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=1BlexpJj4gX76_l8dI0A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0OSBTYWx0ZWRfX2EAj+Nm3/M+3
 XaeCz8W9DUO1Bad8SPCqEGOl6WLliCvGD0re+7bM3iXjD4ZZqnOOGYphdPoW0NPkyb5/Bmof/Ww
 kXqwPGxkh29hmPXP5aSESM/3ahhDL0w=
X-Proofpoint-ORIG-GUID: 16dVUUf2-hciCpIynckmd9g11bPsgb_T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240049

On Tue, Nov 17, 2026 at 04:24:11PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] media: venus: PAS metadata buffer leak in venus_load_fw() and
>   venus_boot()
> --
> 
> commit 197c5c883871fbbcc35bb55913a4e0eb4bf2cd11
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> media: venus: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
> 
> This commit embeds a struct qcom_pas_context in struct video_firmware and
> switches the TrustZone firmware loading path in venus_load_fw() and
> venus_boot() to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset().
> 
> > diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> > index 3a38ff985822f..704343e241dc6 100644
> > --- a/drivers/media/platform/qcom/venus/firmware.c
> > +++ b/drivers/media/platform/qcom/venus/firmware.c
> > @@ -117,21 +117,22 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
> >  		goto err_release_fw;
> >  	}
> >  
> > -	mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
> > -	if (!mem_va) {
> > -		dev_err(dev, "unable to map memory region %pa size %#zx\n", mem_phys, *mem_size);
> > -		ret = -ENOMEM;
> > -		goto err_release_fw;
> > -	}
> > -
> > -	if (core->use_tz)
> > -		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
> > -				    mem_va, *mem_phys, *mem_size, NULL);
> > -	else
> > +	if (core->use_tz) {
> > +		qcom_pas_context_init(&core->fw.pas_ctx, dev, VENUS_PAS_ID,
> > +				      *mem_phys, *mem_size);
> > +		ret = qcom_mdt_pas_load(&core->fw.pas_ctx, mdt, fwname, NULL);
> > +	} else {
> > +		mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
> > +		if (!mem_va) {
> > +			dev_err(dev, "unable to map memory region %pa size %#zx\n",
> > +				mem_phys, *mem_size);
> > +			ret = -ENOMEM;
> > +			goto err_release_fw;
> > +		}
> >  		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
> >  					    *mem_phys, *mem_size, NULL);
> > -
> > -	memunmap(mem_va);
> > +		memunmap(mem_va);
> > +	}
> >  err_release_fw:
> >  	release_firmware(mdt);
> >  	return ret;
> > @@ -237,7 +238,7 @@ int venus_boot(struct venus_core *core)
> >  	core->fw.mem_phys = mem_phys;
> >  
> >  	if (core->use_tz)
> > -		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
> > +		ret = qcom_pas_prepare_and_auth_reset(&core->fw.pas_ctx);
> >  	else
> >  		ret = venus_boot_no_tz(core, mem_phys, mem_size);
> 
> [Severity: Medium]
> As reported by Konrad Dybcio on v1 [1], does this leak the PAS metadata
> buffer in core->fw.pas_ctx.ptr?
> 
> Unlike qcom_mdt_load(), which passes a NULL context to
> qcom_pas_init_image() so the metadata buffer is freed immediately,
> qcom_mdt_pas_load() passes &core->fw.pas_ctx, causing
> qcom_pas_init_image() to retain the metadata allocation in
> core->fw.pas_ctx.ptr until qcom_pas_metadata_release() is called.
> Nothing calls qcom_pas_metadata_release(&core->fw.pas_ctx) after
> qcom_pas_prepare_and_auth_reset() or if qcom_mdt_pas_load() fails after
> qcom_pas_init_image() succeeds, and subsequent recovery boots via
> venus_sys_error_handler() -> venus_boot() overwrite core->fw.pas_ctx in
> qcom_pas_context_init().

No harm.

Change to avoid leakage https://lore.kernel.org/all/20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com/
is present in linux-next which takes care of this.

> 
> [1] https://lore.kernel.org/r/ce3f58f7-f500-49f8-89cd-611d8e1ac6ac@oss.qualcomm.com
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com?part=5

-- 
-Mukesh Ojha
