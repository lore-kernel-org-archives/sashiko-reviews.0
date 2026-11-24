Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523765;
	b=H8HkmgGMmIxNcJaQXrUYgQLR2GudPR7RtLY+u8diPLB0JjSZm4368pst2LF2MHJr9orS
	 HSLOHxcEiK2qa8oMW7ttGaBB6JACf3p/UbNattgctuxgPG1BmMW/a1ziy/QGJLcCbRZKD
	 QCQqVsCXPQYGNoRFekCjFPGzcTvpe8pLMStztIg+gFKMiG40HX+XM8wyR0tNacEf7kGI4
	 hLE/BW6noac9NCpkxPRFeMVu+zH5BvYhcIHD3W4W4ifsDZ6hbwUOSeenZwM//DDE5AAgm
	 jEaxqeonqaVVhrCw/9lx0nTZwta61coo8FWsamTJOwWBgJGewc9WEsfE1EGdhNt150g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=D+M9rlByaDbbaT9zq7kzAImNLpeGnWkyEswhM9oCd88=;
	b=i+PhKMTGsazK6WBSNX/HnYu3PkbwsyMfZBFagtvmVE+x7rn4Bm13aUJPDZjZI0R+8Yi6
	 /t3ICZwIrFu2ASaYii/noQHIe5GDdjhEjd/95INwDGQlmgLAJp7igCHKg/BwlQfSZxVZa
	 09UcJbsle5hPM95hwIx4cyBwfXlJH2sImkBhwN5yrvgWH23GNEdiiY3MYGazDMiudU/tm
	 NDBnaMPkfZ6DQ89infMTqKRZJ+C+3l+gNOWpVoZ70RGs/OeMZ4ZzkpTd1jUa4k+0pQAIM
	 tFD4qGMDEdW4q6XnNFwCk+nqUxqCbZO5OnBwK0Pzs6Zj31LIL/Q4jNbz77o5KR3x9Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RLl4Uahc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EPebqucv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D545A606A330
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D545A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RLl4Uahc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EPebqucv
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuMsN3541873
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D+M9rlByaDbbaT9zq7kzAImNLpeGnWkyEswhM9oCd88=; b=RLl4Uahc1don/HYN
	Szg3CGFjyihWLYwDSuAvm4twEs8H5xariWDdPXZJjHaq6Or5R08+fjB9zeKv0gka
	sbkE5/G+Fod/rxuf4WJCxeRPC7ePMEIzHQm0plsXs88qyMJx1CwjiOelXtSd8Mrj
	wYqjSSanThgHZ3NzsK5JWGQrVJHMHR1Xq9DyU39z16Dqhph5QUeYybzmV4z8Qly4
	Xp/EhzfhkMmM0w3USAE4yDqGVd21lFYXCOYt0auXk6wRKmmWh0Zv0e1kujvW/tI2
	ikt2opTfSPjZzAcD+5XafNP3z+cZd69n45bkqVaJ7arg+akIZ1lIJG2Up4DQM0Kr
	Rm2Hag==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh9mfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:36:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386ad819860so2098819eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 04:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795523762; x=1796128562; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+M9rlByaDbbaT9zq7kzAImNLpeGnWkyEswhM9oCd88=;
        b=EPebqucvnLBhmholMwPaJmgK+FidwEAYmTz2CRDxOKFvwBUa3TmGAs3PyEHo9c/JA1
         771A6Y4j0YMP++CZyOhf7KxWoY+2IeqgDZj8JNdHwMRvzrPrpXf2J1LtnJhzvunxOIu8
         mrl3glVS3ChGPDjaLIgsu13oltijWKlFghvqehTzvxF2CcqhUNtNnOdqJnKOJsGHUGHX
         ZZ2z2BpanNQqfS0kA8FFz10xBYx+y878v+PDFvN8f1VUlXE5cM1PY2YIQWfG/kgW3Jy9
         tWNalSjSImMza/IG+/UQo+ECBmLeoUkPNR3zUhfxrEHlycP86e6BoQK3YDDqDAaZYYzv
         hK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523762; x=1796128562;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D+M9rlByaDbbaT9zq7kzAImNLpeGnWkyEswhM9oCd88=;
        b=sYoU3Y3mBpCaihvR5GojPWa89zbphT+5rjl6vmVZexEIrSK2TWaedzc+Zchjuh+7oe
         7EPG4Ks7JHH/20fZlJhrS4ODgjOIqDxgRl9TKwzog4n/wl0Qrree8wOtlXPhH5z3X1iM
         NVlMTAWDDgYkk9UU/A/gxrUI1FhrViuQbIkz/itJaNrl6JbQuA/+AzXGxO8WD8w5wFHL
         04Gq5EA9EphR4CG5YBbnK0B2wAaa3L2NEPTx4mIfDb2+dpeBPyn1gm2ROuFUvTgQ1WWT
         W9f8r81yKnIOHTNhvbcItPqQKqFASCpkiCF6xy34doFkzxZtl3GhH2ius5sTIzu1tXvZ
         F8hg==
X-Gm-Message-State: APuU4Z/MdtsRqjYcDhtr+cigSwHaBOpicuQedHhiDQy7+W+PAXbPtkBP
	2sdeCBK/F0dKhieS/VUHdauUP5NXgq0gO0RQES6t9wwg/4LxWFn1cUk69ZdSlEAs1GyZ46LY4Lm
	T/jhMj/gztx5J8ppZv0aDS5lmYN4Bl+ezqOCoCkp9Hytma5KEdFXJulHtEP3trZJR2T/ozaChLm
	ZolTI=
X-Gm-Gg: AZFdTZfVHdYECdBl5v5MvFw7UMUYFUs+r/sZM6axwCG7O9MkcGQALxG1z8OEPREoLH6
	7EOvvIbJT/FKhzdiC2UYl6OQIf00onXnuGASyK5eYOVMk0FcYXlwg2JVWL1poltMVC0FcB7nCHL
	qVpsvKQMlXburst0it4oF9JT67X62k5emBlNw/eHC9WTTAFjVhobOpdF6ba3eutaa+PyWiw4hN/
	jvowovwTLO4hLSmoyVyvVGf2KvTzvTidCn+0AjvqwIaVu3et0SqgbYpJ+54sUzH7HT3ODjci6Om
	E/tPRcstaK2WGsJhMqbEu4bXzaCW4q31T2PJsnaQ5w286e8Z+e3VboHmx0SKnNjEClzAfd2uLwu
	jvHIWQT8dhOPIrJKeVh2zjU03iU8oIhJjXxIX//sgsRx6zXtVAvMhA40l4+8r4D4t8/J6Nui7sb
	Cb
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr8892947eec.31.1795523762208;
        Tue, 24 Nov 2026 04:36:02 -0800 (PST)
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr8892918eec.31.1795523761411;
        Tue, 24 Nov 2026 04:36:01 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm56005126eec.4.2026.11.24.04.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:36:00 -0800 (PST)
Date: Tue, 24 Nov 2026 18:05:56 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org
Subject: Re: [PATCH v3 3/9] drm/msm/adreno: migrate zap shader loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261124123556.ymiwo3sygd6pqu2a@hu-mojha-hyd.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
 <20261116162148.2864501-4-mukesh.ojha@oss.qualcomm.com>
 <sashiko-outbox-219162@kernel.org>
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
In-Reply-To: <sashiko-outbox-219162@kernel.org>
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b0584b3 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=550VJpOQ4KLBjvVCYQEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0OSBTYWx0ZWRfX+1q+zsqxuej4
 d/lwungAUO9ZAjdJ/1hEX8QF8pdPVMeWO/nvEVmSNXZPPrzq6bCJiHEQWoVbK1bTALSB0BjT7lI
 eCYKHideBD8Cc6GyES01HbozIysq94M=
X-Proofpoint-GUID: V6iFgzLOAKc9UfBwJwNlYbOsBTJr7tZg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0OSBTYWx0ZWRfX89sSCZmimYrn
 lBQnK8vvkzcrlm2J6B3FsqsuZ3CTYl8ZczCqkuscDO+aSOPa9qjk6r0XkO54H1k4c2f9/Dcm+xK
 d2o6ZQeLijrPUtZmK7r941G4M4fBW061Y2ZsUBGjDqHS1kzo7OMbhBLHGinMqB/uKakeZVzFjdt
 mORhLZni2mdnL3h/2NYxuHUmH2i+u67PXspsVbO3JzZmmQrAg+0kUsd6MZZAyROiUOUZLcG+4MK
 HCU2RXEmi/ougsI8hMnupUqGNbcd2wCjob5InSTaXKIpZNTuA0h0cvLNk/sz8+yhA3461I05RtE
 YmfK6ARXOmQ1lxVbFtOMScT2ZCWctsnQ9x8zjiVKVbn9qVxmtaip/dG5rkdRG9mqbRN8PCDC/Qs
 oHsVJfhGaB0YUeHCISOs/Y09npDgvZ4dsXtDHAVhE8cP1WKUHNi/ikliLFn96USbARD/jFrS5DH
 X+gXa+PjLO4PnaXKRzA==
X-Proofpoint-ORIG-GUID: V6iFgzLOAKc9UfBwJwNlYbOsBTJr7tZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240049

On Tue, Nov 17, 2026 at 04:24:10PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] drm/msm/adreno: missing qcom_pas_metadata_release() in
>   zap_shader_load_mdt()
> --
> 
> commit d13b2477d9bf69676164fdb8068bcf949f328d1e
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
> 
> This commit replaces qcom_mdt_load() and qcom_pas_auth_and_reset() in
> zap_shader_load_mdt() with qcom_mdt_pas_load() and
> qcom_pas_prepare_and_auth_reset() using a stack-allocated
> struct qcom_pas_context.
> 
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index dadfe4c694384..12e35841763d8 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -34,11 +34,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> >  	struct device *dev = &gpu->pdev->dev;
> >  	const struct firmware *fw;
> >  	const char *signed_fwname = NULL;
> > +	struct qcom_pas_context ctx;
> >  	struct device_node *np;
> >  	struct resource r;
> >  	phys_addr_t mem_phys;
> >  	ssize_t mem_size;
> > -	void *mem_region = NULL;
> >  	int ret;
> >  
> >  	if (!IS_ENABLED(CONFIG_ARCH_QCOM)) {
> > @@ -121,39 +121,32 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> >  		goto out;
> >  	}
> >  
> > -	/* Allocate memory for the firmware image */
> > -	mem_region = memremap(mem_phys, mem_size,  MEMREMAP_WC);
> > -	if (!mem_region) {
> > -		ret = -ENOMEM;
> > -		goto out;
> > -	}
> > +	qcom_pas_context_init(&ctx, dev, pasid, mem_phys, mem_size);
> >  
> >  	/*
> >  	 * Load the rest of the MDT
> >  	 *
> >  	 * Note that we could be dealing with two different paths, since
> >  	 * with upstream linux-firmware it would be in a qcom/ subdir..
> > -	 * adreno_request_fw() handles this, but qcom_mdt_load() does
> > +	 * adreno_request_fw() handles this, but qcom_mdt_pas_load() does
> >  	 * not.  But since we've already gotten through adreno_request_fw()
> >  	 * we know which of the two cases it is:
> >  	 */
> >  	if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
> > -		ret = qcom_mdt_load(dev, fw, fwname, pasid,
> > -				mem_region, mem_phys, mem_size, NULL);
> > +		ret = qcom_mdt_pas_load(&ctx, fw, fwname, NULL);
> >  	} else {
> >  		char *newname;
> >  
> >  		newname = kasprintf(GFP_KERNEL, "qcom/%s", fwname);
> >  
> > -		ret = qcom_mdt_load(dev, fw, newname, pasid,
> > -				mem_region, mem_phys, mem_size, NULL);
> > +		ret = qcom_mdt_pas_load(&ctx, fw, newname, NULL);
> >  		kfree(newname);
> >  	}
> >  	if (ret)
> >  		goto out;
> >  
> >  	/* Send the image to the secure world */
> > -	ret = qcom_pas_auth_and_reset(pasid);
> > +	ret = qcom_pas_prepare_and_auth_reset(&ctx);
> >  
> >  	/*
> >  	 * If the pas call returns -EOPNOTSUPP we assume that this target
> > @@ -165,9 +158,6 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> >  		DRM_DEV_ERROR(dev, "Unable to authorize the image\n");
> >  
> >  out:
> > -	if (mem_region)
> > -		memunmap(mem_region);
> > -
> >  	release_firmware(fw);
> >  
> >  	return ret;
> 
> [Severity: High]
> Does zap_shader_load_mdt() leak the PAS metadata buffer stored in ctx.ptr?
> 
> Previously, qcom_mdt_load() passed a NULL struct qcom_pas_context to
> __qcom_mdt_pas_init(), which caused qcom_scm_pas_init_image() and
> qcom_pas_tee_init_image() to free the metadata buffer immediately.
> Passing non-NULL &ctx via qcom_mdt_pas_load() retains the metadata
> allocation in ctx.ptr, which is leaked when ctx goes out of scope unless
> qcom_pas_metadata_release(&ctx) is called before returning.  Note that
> 2aa8fafc08e7 ("firmware: qcom: pas: Make MDT buffer retention explicit")
> changes qcom_pas_init_image() to release metadata unless keep_mdt_buf is
> set, but that commit is not present in this tree.


Yes, that  commit is present in the next; so no issue.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com?part=3

-- 
-Mukesh Ojha
