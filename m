Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524444;
	b=qFL3vQyBogXuohJ4gXqLlTQm5k6/zccApPhYZsG5JMj4Jqe4R0TSzj2hZELZR1+O71dT
	 E3N0EqCZyNIKeN3xhme+C8Fji3VD9q0j4/LEU5gknTGMvtqe7UGVDpto+nP70aDkaoB3A
	 L3qwj3ya1B/t/caCQtd59ww1TZ9z2AG/+WKikjJrfyjoSZNu2AyRrhT6qk1WC6M6vS/6t
	 /3UxV/9rxyiQYoubVCgy1VbP8Z/BqKjKwUQ2kX5s0mQ2ByRAX6EqcW4tsUBxlssGlCrJR
	 zt8mXA7pwdvc9RPKrPN31K9Pr/OS0rD4DbXngefsxnqKAZjKTqpaHM2ecTiOsg4Zj/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=vKU1tpsRMwMDycc8EXvgkgxCWH/rHaq3p/k4nif+kDM=;
	b=tmpYXO36mX00J4U7wszrEcPvBK87RMJz91N3kjYHngzYWwrEsyHKeeYMu3eZo0uBoymV
	 BvGP06RyLozbKbsCRewLQTotNr5qLFpmGTC5V5HNPMqPV+RGJ36ZzJuAcOmFuxXbsRDze
	 22QA5Q3YjgDVB/646qrXgH381tMDV04K555PEKL9BKoBNe+pF0umlsTFh8G38qLGD/poB
	 xS3hee8b6gper9oZKIcOo8/OemjMIUo9BWAnV8zhnpNPBbAYY6q15KnuGnR7SWU/2rumU
	 erwXuhZP+gIUtMxkeQ845/kMBp2Y2gdVsYF2LOOHtu8Qv1puz5SOUcmy45eytc4hDkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cvG2vhLZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqOxvBz9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF868606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF868606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cvG2vhLZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KqOxvBz9
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuVoP1736762
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vKU1tpsRMwMDycc8EXvgkgxCWH/rHaq3p/k4nif+kDM=; b=cvG2vhLZC9vgVDUH
	cO+Ht6FXneXim+OQ2PA2Mb9hZ8QS589pppzwBCE4H28KLSoReicNgxvXfj2fQbLL
	Vi1ds6s51QQGbtFpgtuVkA96VEruk+1G+LFWAVstLa+tqf12vh+/jEigAOh00/Ja
	K+A7whkHda8D3sLctuwaFt1i9QGru1XP7WbHAR1q904CsLs0iIXcdd6NyeCg4Ps1
	CztuHNvzWBRFVBoLLo4ZnwoFDtOV7ejdj0noAhwOPqz2LE9CtcfsGTdWD5sdgsh4
	TUPhnc53ZjVEVK0HZCkvhlJI6ARNrTb61SGFVJfyilFRJAgctGTT21kIx2T9oC8s
	ieHKTw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd2reu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:47:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so5601685eec.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 04:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795524441; x=1796129241; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vKU1tpsRMwMDycc8EXvgkgxCWH/rHaq3p/k4nif+kDM=;
        b=KqOxvBz9gg1galj7jOCmyUiz0jd1z0iw6KckNi3xXQ91pT7hlXY7fuV3G/A2X7tM3l
         hFtFmp/Byo5q/NOFacZ3vekUnaM+avqZfsKnqff/9rJdSbHuSg2skc9p0eGKh01KYr09
         m5c/BcXI6q86e0BtmJ8sZW/l2xz7vvPNrZhdqa0h8TC4Ra0wfkbwC10cKB147pOsJ08F
         dwDXknvmmlzv1JIvw2aLz68TG/Mh+aLIWuwPE4jhPGa5Us+d4bAlSWR6drCMEwVpI7k7
         lkRBmsyKjqeIMiiyWIdYIEWGlYzr60mnqYXzyGs/xBTbz6c+r3Y74UwnkXIuRGqYoKNJ
         Xu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524441; x=1796129241;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vKU1tpsRMwMDycc8EXvgkgxCWH/rHaq3p/k4nif+kDM=;
        b=t/EAQ6/xcg1xLoplCh2flu9NCUJNeAG77l5SP68EZ+8PPyfHJHEO67YhGikIPbSUAR
         jE0ZpGZZyhxCPN87C5AF1vm4nH9BejpqeQYrIuhIx5p9w3YNRhYw+3ou+AWzpPHukFR2
         iNOd5FqyHut1Twp0ALQAcJsMR6r38mCmbe27W27rrTzgmE2io4k4E4qLqTAH8K5IJj8H
         4YEYQ+MdREnmi4TIMX+ppdox9G/xnCWQe+1uqLHjmtmQkT5YrUshDDAB2C4s+Ni7HJOy
         bn1Zt5nib5JXeedOpBpFE12UQd/w0h/cJd0YeH8HjfrNfIwaMUBba2MnM0bAUbB8qxMs
         uMEw==
X-Gm-Message-State: APuU4Z/rrdgKeWRtdH7CGrLgc7LCm/c+0WDY+Qbx+X51ms4U6f/3oGGc
	dyxbyU56AiKhFHugkLuBq+NsACyzsgsMQihhGTtCAZduGy68+yW+S91GOrlIPxTmvXU3k6Xtsla
	i+zauNki9aTlGsIqXZ7zZI/xsB6i5BIIA460qCDIcX6Fv8BqO1zoS/NQJM5beOeb8XFI0Akj+g7
	ES5pw=
X-Gm-Gg: AZFdTZdoxTjLYgIPJV1q0MLfZEUeFayKYOyaLgFIUp1w6Qu541YNp8gFLDWu3J7TWkJ
	yt9plbyte+iHFrDjU+mPBk1GAETDB1XNSAZcaJOaIAOqLNw5KxVoRjNDeZvBfQHwrJKzFU1Ydpn
	rE6umobRtLkhfz4+2cW7G0zcFK3El2GbH2xIO1+yHE/GTOk7vJiv4eSA5w2sx1NkKJ2y5QJPTTQ
	UJ9QnURwncVw8itrEuZxhpQFsA5Y47sn8wDipZfPWX2swruL91rbPpkHejhcg+D5lZLxeLkL+uZ
	bzMvB6k9/Kv121tJbG0YcGNoVEJrhWUf18L6KDHMBgDA+AwSa4htngQ0P7r93ekqd5JSX4NLQdN
	/FPST5GMNulHpfprUL57UkKbgYJni0ggMEDaA53N4S1ABEIyy6fLVuHTwJ0AXBIkftyz2+z3e0Y
	nv
X-Received: by 2002:a05:7301:d81c:b0:386:b7d2:a279 with SMTP id 5a478bee46e88-386b7d2aba6mr4555364eec.34.1795524441004;
        Tue, 24 Nov 2026 04:47:21 -0800 (PST)
X-Received: by 2002:a05:7301:d81c:b0:386:b7d2:a279 with SMTP id 5a478bee46e88-386b7d2aba6mr4555342eec.34.1795524440228;
        Tue, 24 Nov 2026 04:47:20 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm39935434eec.8.2026.11.24.04.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:47:19 -0800 (PST)
Date: Tue, 24 Nov 2026 18:17:15 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org
Subject: Re: [PATCH v3 4/9] media: iris: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261124124715.ickywmxur7c5bmrv@hu-mojha-hyd.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
 <20261116162148.2864501-5-mukesh.ojha@oss.qualcomm.com>
 <sashiko-outbox-219163@kernel.org>
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
In-Reply-To: <sashiko-outbox-219163@kernel.org>
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b05875a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=vQny4cqFthsH--JnnNkA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0OSBTYWx0ZWRfXyrKoZTDxTnmV
 qjavFbXQvfZbjEX0K26Igb5j2LSgjFSXyW/srvW9WHNRTJ2IdaDkpnsDZUHwCAiU67L2W95U9Yw
 wO3n6BlJHl0XvMGYSo5kXMZyENeB4RrvMgZA2rytNhaooJf/Dpi51idmPvAsiMqjlS2SeeoLc+d
 UMpUaMKLjfD3JUsnoF/uIkP7AJiBOV2RkrAARIcdEFY5bSCpwfHA0EUz5o8T+OnR01UmHxbya0C
 UJEmpPX+ktsHU90/6+2TiSd9FuIhujWrjzKKHjNM8BxJDGjmqO0cgxtj+j82zZErpyM7zZcRylQ
 9a3bI/2Z2CGsEucWYhNZ3P/hFt1Z3dCh8VDTsgUJZ8/bmkxY78RR+6cehMcY7Aqg7WCUJojESMu
 daRTc8sIMr1N5l6QtQRx1d8nxpa3KZTrmdCg6HXb2Ujg5WZp+Ug7v2kRLpUA7DLo0BjMCwmadsF
 d6uMY3EThiLVGhFHDgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0OSBTYWx0ZWRfXxBHW9cu45qfU
 fN+2IRr+EpLlnugh+Iz6uJGGGm99RUhCz+1E+0N6iVmnyPDFxoY4Hc2MC8DUl6L1LNTQ8W+i4uU
 EG513JMj9juEKieWQKkwEanRr2teGm4=
X-Proofpoint-ORIG-GUID: ZddWZVLO2cKBIUwAaCi2hDw8znKaqgLQ
X-Proofpoint-GUID: ZddWZVLO2cKBIUwAaCi2hDw8znKaqgLQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240049

On Tue, Nov 17, 2026 at 04:24:10PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] media: iris: missing qcom_pas_metadata_release() in
>   iris_fw_load()
> - [Medium] media: iris: unzeroed carveout memory scanned by
>   iris_detect_firmware()
> - [Low] media: iris: missing kernel-doc entry for pas_ctx in struct
>   iris_core
> --
> 
> commit 06c574841baf80a5b2f096e918c8cad3e79ad9f0
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> media: iris: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
> 
> This commit embeds a struct qcom_pas_context in struct iris_core and
> migrates Iris firmware loading from qcom_mdt_load() and
> qcom_pas_auth_and_reset() to qcom_mdt_pas_load() and
> qcom_pas_prepare_and_auth_reset().
> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> > index 3e4cf652bf39a..ac73bda072f85 100644
> > --- a/drivers/media/platform/qcom/iris/iris_core.h
> > +++ b/drivers/media/platform/qcom/iris/iris_core.h
> [ ... ]
> > @@ -129,6 +130,7 @@ struct iris_core {
> >  	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
> >  	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
> >  	struct dma_iova_state			*iova_state;
> > +	struct qcom_pas_context			pas_ctx;
> >  };
> 
> [Severity: Low]
> struct iris_core has a kernel-doc comment block describing its members, so
> adding pas_ctx without an @pas_ctx entry will trigger a kernel-doc warning.

Ack.

> 
> > diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> > index 21f57d37da187..b701a7f43514b 100644
> > --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> > +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > @@ -201,21 +201,20 @@ static int iris_load_fw_to_memory(struct iris_core *core)
> >  		goto err_release_fw;
> >  	}
> >  
> > -	mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> > -	if (!mem_virt) {
> > -		ret = -ENOMEM;
> > -		goto err_release_fw;
> > -	}
> > -
> > -	memset(mem_virt, 0, res_size);
> > -
> > -	ret = qcom_mdt_load(dev, firmware, fw_name,
> > -			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
> > +	qcom_pas_context_init(&core->pas_ctx, dev, IRIS_PAS_ID, mem_phys,
> > +			      res_size);
> > +
> > +	ret = qcom_mdt_pas_load(&core->pas_ctx, firmware, fw_name, NULL);
> > +	if (!ret) {
> > +		mem_virt = memremap(mem_phys, res_size, MEMREMAP_WC);
> > +		if (!mem_virt) {
> > +			ret = -ENOMEM;
> > +			goto err_release_fw;
> > +		}
> >  
> > -	if (!ret)
> >  		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
> > -
> > -	memunmap(mem_virt);
> > +		memunmap(mem_virt);
> > +	}
> 
> [Severity: Medium]
> Can removing memset(mem_virt, 0, res_size) cause iris_detect_firmware() to
> scan uninitialized carveout memory?
> 
> qcom_mdt_pas_load() -> qcom_mdt_load_no_init() only populates individual
> PT_LOAD segments and their BSS tails, leaving inter-segment gaps and the
> trailing [fw_size, res_size) region untouched.  When iris_detect_firmware()
> subsequently scans all res_size bytes via iris_detect_gen2_from_fwdata() on
> a dual-generation platform with a firmware-name override, stale data in the
> unwritten carveout (for example after a warm reboot or prior Gen2 load) can
> cause a smaller Gen1 firmware image to be misclassified as Gen2.
> 

I could restore it, if it is required.


> [ ... ]
> 
> > @@ -233,7 +232,7 @@ int iris_fw_load(struct iris_core *core)
> >  		return ret;
> >  	}
> >  
> > -	ret = qcom_pas_auth_and_reset(IRIS_PAS_ID);
> > +	ret = qcom_pas_prepare_and_auth_reset(&core->pas_ctx);
> >  	if (ret)  {
> >  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
> >  		return ret;
> 
> [Severity: High]
> As reported by Konrad Dybcio on v1 [1], does this leak the PAS metadata
> buffer stored in core->pas_ctx.ptr?
> 
> Unlike qcom_mdt_load(), which passes a NULL context to
> __qcom_mdt_pas_init(), qcom_mdt_pas_load() passes &core->pas_ctx to
> qcom_pas_init_image(), which retains the allocated DMA or TEE metadata
> buffer in core->pas_ctx.ptr:
> 
> drivers/firmware/qcom/qcom_scm.c:qcom_scm_pas_init_image() {
> 	...
> 	if (ret < 0 || !ctx) {
> 		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
> 	} else if (ctx) {
> 		ctx->ptr = mdata_buf;
> 		ctx->phys = mdata_phys;
> 		ctx->size = size;
> 	}
> 	...
> }
> 
> Neither qcom_pas_prepare_and_auth_reset() nor iris_firmware.c calls
> qcom_pas_metadata_release(&core->pas_ctx), so the metadata buffer is leaked
> on every firmware load (and overwritten when qcom_pas_context_init() zeroes
> core->pas_ctx on subsequent loads or error recovery).
> 

There is no more leakage as it is using stack variable and
qcom_pas_metadata_release() call happen internal to
qcom_mdt_pas_load(). So, no issue.



> [1] https://lore.kernel.org/r/ce3f58f7-f500-49f8-89cd-611d8e1ac6ac@oss.qualcomm.com
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com?part=4

-- 
-Mukesh Ojha
