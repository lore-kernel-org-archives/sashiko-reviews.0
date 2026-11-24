Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524817;
	b=fjPMbkGYKpsTwRCLHVpao40IwakziGCY/zhKKLM2ZGC3ip7bd4R13cO3Q2ogqz3H/CnO
	 XwEWzWyqRhrrVMzE8zXg18eXgcjLa4VYT3t2GsPM8JX1wPB/optGiy4RzPaRcJh36cstJ
	 oxBP6kCTRUrv1emdI9BJ/agmH5arb+j77uI5H7RD1pqsp/1S5tebO+trp7KNXwA4mWFud
	 GxFkSJq2jAaWlqiSIF/otc3WR0Pp3J3vqhe3ZJzGcSG7xJdZ2yDbjHiMVRmCKRI7ZPSbD
	 B6s2Qjp8Qg2fmsvId6ORybsMM0EidHggoEJJwdfqVtzV9gaHLmUNUVvJD8m+wzBUfuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MPxO224nq+KvKykF/wWrxYrFxgOetNz/Mb64w5OfDr8=;
	b=Ha1JMshGDtyT1/vOSnZn1TpdaANMuxxR9x9U5SrWUclJoI+3jFeCTgqNoY/41HggfEe6
	 vt5HC3fvmDakGk5PaEXlqCIzvWVRRxIl1/Jg4T75NFBtwNRI3v14vjv8xVGttxOhbyHZA
	 gP6tIR/jXVC/2cqA7aNzett+VsJvBbcCxJX2Oa9Le9XOupBxHtiDZtBsmo4fomJ9INiw+
	 xe1nbF0Tzd1xkCs0faRDdUZnjUhu1MIV8HEdmCLLKpIVCmCySz3HLil/kS2ZBEm/2WfYn
	 nrB9eakjvYUy+B8uJC6kpeolMM4ObzdS0taZNud7wBzkB2mr2Iybc08OOdzLlRKZnAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UlOUlC7i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jXiBu9xx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AED5606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AED5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UlOUlC7i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jXiBu9xx
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuaf01991518
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPxO224nq+KvKykF/wWrxYrFxgOetNz/Mb64w5OfDr8=; b=UlOUlC7i0kZZlrrz
	i4lBtntLwsPdXBH+TJ7Qz+SG0hLX5LWFKmgjV+OPTYjxMRHW0CfuBiLSm3sZ+vyp
	wgZ+OPMQqIOuDzBcwCvIa21Yz7BZZZHPIRS/LK24t8Va2lQHeiKnskUtCVXmvOlu
	HhbPCs2uvIjOfVOWt5BjjfpHLcdH/hRptwTIv0TVJe5x/ZZDnloXWpsE4CgdBwWN
	Jfq8fQSvROerrRuMdtDsQC8dce/axCO0VACrt5ViLoGQOLcI8MqOOHJZr/4O3/JW
	FWSMOgkRUcra4ObMgE+A/qGgZ70q2D8s/y2OI2oGXbW08XdwcFQLiTuLGUTbCmQB
	WoI1Ew==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6subxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:53:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386ad819860so2131188eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 04:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795524815; x=1796129615; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MPxO224nq+KvKykF/wWrxYrFxgOetNz/Mb64w5OfDr8=;
        b=jXiBu9xx/cpxDh+4KcsyNOgYam4awbqKMAI0Wlw6NG9rmmVLVuK9stdFLQCXw78jgW
         VhDKeHf3QoYPKjYT+4UFQUSpppWo+cbA1sPSVc3E77H/nY+DC54cnp+kfcyWlTqP3m5N
         GyKr5HBU4MvaFrbrc/BTS4WZpOiQIHJdg7p0jdTN+wfN1jqfqF0QEG5xmuRvsMEeNG2w
         wxquSmeG1lwtxZyFw/0LDNobq4b8wDGQX5F/q26J1S9OdwR5I+h1fVSN1YQYUXybtVQP
         rGLhxpuxnqYjI0MN2PY+5DHh7RCzX2qRXccm5JPvMtPm/74OXK3z2aIlYBr0plmzzn4C
         HTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524815; x=1796129615;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MPxO224nq+KvKykF/wWrxYrFxgOetNz/Mb64w5OfDr8=;
        b=IzkSfMJmRdxqh69Ceqb2VMomMb4UstCKGj0bi+b/+YapACPBCb+Ccc669V0slT31pq
         hcIHnk/HuXEqNjGFUKrLonaT8waSnN62BSqaQyGIrhDYeiFDRqcS1a4SP3I1c7fwAWTR
         eAz+wNag9cJ9OL0/GOHVGsYf2SzQjjcxkuQY/RyLwg7cCeeVmKXT93s02sdCuSQi9sKY
         8SCACgwVy1eT9v165H5J/F3gDA1KWZFqFsnFfI4kTzDM2CXjE2vVGMfJDtTREdGXG7cH
         qZmYKesdIHlfqnG0CIsc99pfmwzv+SuzmTRWI8bfvr1zLMdUrWOm2pfBXKjMUl0Ju+fy
         npdA==
X-Gm-Message-State: APuU4Z8eOlMRYESOqNZS2iC4xCn+CfpZRJb6Fl59pSNJjehT89MAL4YM
	F6Lsg3RsqhgCUBhedQgS0EHsnYc9ER0oKTXeGAKSsWHVD/IGsB9FmRo6Ph+HKTpukZf7/byVA4n
	kaIVXRdy7G5P9NY9U3EY/6i8lwjbdqqg7R5c9nGjJs5FuB9wT4nhUqt9VSNHSIm8o3yVuUnNSSa
	t+xx0=
X-Gm-Gg: AZFdTZc1q7by/Fz331x9tWBIKpAvkJdnyzTm1Bl4m5JZpjeOkg5Ai/sGIYYBv0xBMPu
	IZEBiq2iffiPW5rjBhIQi1bq306sfP43Ys8pl1o2CYnLuVmgpY8DUthqjXREpxWUXWUFGdAhPYb
	KeWQv6Lif5KCtqcGL4nwgD662kW/I0fbKM8IgttO+0T/+GNSNoWQCOB38QsTV8Wqm/J5xMv+p7V
	Z0eMv8X3gHNvxIMwEDyibv6P7L2NoZUs51IEM3Q3MYNCX6lxL1LyXhghAKu4QLG3pQvhpHk3mdd
	c4sF7j1VuBW+pfE8hePC/qgPCi61U7fpk9zydsRYrzfpVHPzOzQxgzsvlEa3JyAS40Gh7cGyQpw
	WLxkBd/oEyDJL8nWymfHEN1KDTFMG2HOZuK/zGDlWensdL8wUm2fatMvtkSaOODXOJCNRqpMF3t
	vx
X-Received: by 2002:a05:701b:450b:10b0:1b2:4e2e:d95a with SMTP id a92af1059eb24-1b55e06c4d7mr13012998c88.2.1795524815023;
        Tue, 24 Nov 2026 04:53:35 -0800 (PST)
X-Received: by 2002:a05:701b:450b:10b0:1b2:4e2e:d95a with SMTP id a92af1059eb24-1b55e06c4d7mr13012974c88.2.1795524814348;
        Tue, 24 Nov 2026 04:53:34 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm39113721c88.5.2026.11.24.04.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:53:33 -0800 (PST)
Date: Tue, 24 Nov 2026 18:23:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, media-ci@linuxtv.org
Subject: Re: [PATCH v3 7/9] wifi: ath12k: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261124125329.7ppdthiyk3qj5azh@hu-mojha-hyd.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
 <20261116162148.2864501-8-mukesh.ojha@oss.qualcomm.com>
 <sashiko-outbox-219166@kernel.org>
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
In-Reply-To: <sashiko-outbox-219166@kernel.org>
X-Proofpoint-GUID: h1KZwEJCvVh8loKJt3DpRplR7Cls4v8w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MCBTYWx0ZWRfX3Dj+tGPkFtqz
 Rg/bAaFT1In8utK5BeNadnsWOLXO40f1An8de0bZwgZ+QXEOihrzan5yRC+vbGwzybgSx8BJEYk
 SlAC3icDJLWe1Db+18iI2b02PKJ02J0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MCBTYWx0ZWRfX/P6w4Pyiwdh9
 hkEwHpwE7PanVp5nKkUIfgFkjS7g2q2NosAwSjBeY7ZNbaDWkLBLj0Bn3iVnf/uOt/Rs8JHmaWd
 qIpvwo0QT5Crk3C/S9+TcsSqdLLsB1uDq78ZTJm6EglUhA3mOCA6LjcCvf5sZdSLbMz7cQLyKfo
 BXvcOfX+oGHIaxdAxGIMNta72st3UjIUmtufkedo09VzYSMvNJE6roPnXpZ5Pxu6J87RZhRqyQk
 riVYkE08qE+TsI8aXkMV/CvqaJy2lMpxsw8pnBcDUab08yNG0EyShhW4U+2UDvxa6Sna3pUVdeE
 OLVODF7Lcc1QPlU1qmksXWbIanLhk4RzsyoBEXfiwMc7ZxtQdmWsauvZkBEUAf6xukaQeUwvTD5
 onMYm/pQtQT9JCkPJU/Zexs+uVUNjIla+WuU6RNjKfA/9aqScwb2nz1C+ndcmqYgU9JhU1UqDyf
 a29hORk0Eb9ofqs/OIA==
X-Proofpoint-ORIG-GUID: h1KZwEJCvVh8loKJt3DpRplR7Cls4v8w
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b0588d0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c92rfblmAAAA:8 a=nHrPeFJmhnP_XD_Sg_IA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240050

On Tue, Nov 17, 2026 at 04:24:12PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] wifi: ath12k: PAS metadata leak in ath12k_ahb_power_up() and
>   shared FW load
> --
> 
> commit dad01e3cbb75f83eee2677fffc757868fad930d0
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
> 
> This commit replaces qcom_mdt_load() and qcom_pas_auth_and_reset() in
> ath12k_ahb_power_up() and ath12k_ahb_load_auth_shared_fw() with
> qcom_pas_context_init(), qcom_mdt_pas_load(), and
> qcom_pas_prepare_and_auth_reset().
> 
> > diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
> > index 2c55aae06dd06..355f1f5509975 100644
> > --- a/drivers/net/wireless/ath/ath12k/ahb.c
> > +++ b/drivers/net/wireless/ath/ath12k/ahb.c
> > @@ -411,6 +411,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
> >  	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
> >  	char fw_name[ATH12K_USERPD_FW_NAME_LEN];
> >  	char fw2_name[ATH12K_USERPD_FW_NAME_LEN];
> > +	struct qcom_pas_context ctx;
> >  	struct device *dev = ab->dev;
> >  	const struct firmware *fw, *fw2;
> >  	unsigned long time_left;
> > @@ -444,14 +445,15 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
> >  		ATH12K_AHB_UPD_SWID;
> >  
> >  	/* Load FW image to a reserved memory location */
> > -	if (ab_ahb->scm_auth_enabled)
> > -		ret = qcom_mdt_load(dev, fw, fw_name, pasid, rproc_info->mem_region,
> > -				    rproc_info->mem_phys, rproc_info->mem_size,
> > -				    NULL);
> > -	else
> > +	if (ab_ahb->scm_auth_enabled) {
> > +		qcom_pas_context_init(&ctx, dev, pasid,
> > +				      rproc_info->mem_phys, rproc_info->mem_size);
> > +		ret = qcom_mdt_pas_load(&ctx, fw, fw_name, NULL);
> > +	} else {
> >  		ret = qcom_mdt_load_no_init(dev, fw, fw_name, rproc_info->mem_region,
> >  					    rproc_info->mem_phys, rproc_info->mem_size,
> >  					    NULL);
> > +	}
> >  	if (ret) {
> >  		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
> >  		goto err_fw;
> > @@ -485,7 +487,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
> >  
> >  	if (ab_ahb->scm_auth_enabled) {
> >  		/* Authenticate FW image using peripheral ID */
> > -		ret = qcom_pas_auth_and_reset(pasid);
> > +		ret = qcom_pas_prepare_and_auth_reset(&ctx);
> >  		if (ret) {
> >  			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
> >  			goto err_fw2;
> > @@ -1023,6 +1025,7 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
> >  					  struct ath12k_ahb_rproc_info *rproc_info,
> >  					  const char *fw_name, u32 pasid)
> >  {
> > +	struct qcom_pas_context ctx;
> >  	int ret;
> >  
> >  	const struct firmware *fw __free(firmware) = NULL;
> > @@ -1041,14 +1044,16 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
> >  	ath12k_dbg(ab, ATH12K_DBG_AHB, "loading firmware %s, size %zd\n", fw_name,
> >  		   fw->size);
> >  
> > -	ret = qcom_mdt_load(ab->dev, fw, fw_name, pasid, rproc_info->mem_region,
> > -			    rproc_info->mem_phys, rproc_info->mem_size, NULL);
> > +	qcom_pas_context_init(&ctx, ab->dev, pasid,
> > +			      rproc_info->mem_phys, rproc_info->mem_size);
> > +
> > +	ret = qcom_mdt_pas_load(&ctx, fw, fw_name, NULL);
> >  	if (ret) {
> >  		ath12k_err(ab, "failed to load RO firmware %s: %d\n", fw_name, ret);
> >  		return ret;
> >  	}
> >  
> > -	ret = qcom_pas_auth_and_reset(pasid);
> > +	ret = qcom_pas_prepare_and_auth_reset(&ctx);
> >  	if (ret)
> >  		ath12k_err(ab, "failed to authenticate and boot shared firmware: %d\n",
> >  			   ret);
> 
> [Severity: High]
> Does this leak the PAS metadata buffer stored in ctx.ptr in both
> ath12k_ahb_power_up() and ath12k_ahb_load_auth_shared_fw()?
> 
> Previously, qcom_mdt_load() passed a NULL context pointer to
> __qcom_mdt_pas_init() -> qcom_pas_init_image(), which caused the backend
> to free the metadata buffer immediately.  qcom_mdt_pas_load() instead
> passes &ctx to qcom_pas_init_image(), which retains the allocated
> metadata buffer in ctx.ptr:
> 
> drivers/firmware/qcom/qcom_scm.c:qcom_scm_pas_init_image() {
>     ...
> 	if (ret < 0 || !ctx) {
> 		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
> 	} else if (ctx) {
> 		ctx->ptr = mdata_buf;
> 		ctx->phys = mdata_phys;
> 		ctx->size = size;
> 	}
>     ...
> }
> 
> Neither qcom_mdt_pas_load() nor qcom_pas_prepare_and_auth_reset() frees
> this allocation, so ctx goes out of scope and leaks the metadata memory
> on every firmware load and error unwind path unless
> qcom_pas_metadata_release(&ctx) is called.


change https://lore.kernel.org/all/20260925165231.10722-1-mukesh.ojha@oss.qualcomm.com/
takes care of this is present in linux-next.
Please check the commit before trying to raise this point.


> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com?part=7

-- 
-Mukesh Ojha
