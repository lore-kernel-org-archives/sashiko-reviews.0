Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555819;
	b=OC6uS2wPAdsuEEaHRmpCcMuzVOupIaAddTHmRRqCMxqv9phdyhOOEG0PM2oSh10omInM
	 NVw7UUUJ75hvSmb9woRjRUZ4D4FItdXc86Rr4fOdp2ENGPydhzw/wjCIJaljnYnS3QGZr
	 BicmsC49MHmOb9OIvhYrOq/dV1p0RCZqi9w8ML2so452WctfTPZgsGscW52BwIKMm0PmL
	 HpRWkTNH8Yh3UUbGhSRoN1kB3AgjVAGS6iZXCac38ZQO5Xg/z5vgdSXoEF5dKK947+pSP
	 /4AU5GLSlCo6i8HSauxv/S6PQu1MqTWo1yPOJ72gYSacz+w8Hv3evh0IOlqtxxHFKdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qyhZym5r7vlLk7+pIInUS9OjK0AomV6NyXnFLTBOCfE=;
	b=yK3AQ6jVgo/Vu3bljJNDbdjIX/Yhn3tKIsPC9m8Kfo0BIQpuEvPB3gSp7pPqCHX3TTXu
	 BvutDgeeEYJv/AwjtciBenU61hrvzNfdy8O75B9b7Q3q67GYhiMjPPdYriW7r7vdulyQO
	 qe79bSzzG+f8anUWS40F9vbxMQbk0syE1inAJ6iws3u3hYDGfZ9ZQ0fQ8ftRaWuDJjf+c
	 6BwB2VH/5E6oi2orjC7lDGnom+aUlVNLn7NX93QzqYimlIw5b9wD+FSn7dqlj+8PX/tUr
	 9JbUHQ0S8vUXDj8d+1FPMtXWxeW+pUnamYSJMMYLPlPIPVQaHaHzd2f3WNMS2AByDdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SCl53yVU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+3lsLUe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266F0606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 266F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SCl53yVU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+3lsLUe
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD576oI3717393
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qyhZym5r7vlLk7+pIInUS9OjK0AomV6NyXnFLTBOCfE=; b=SCl53yVU4J4+MSVT
	o/QDP6uNq8kCG/ql0UL3LtSIcnWyPYK+KAWt74V1jgvGn8bmso2b1RAf2so3Vvb7
	fCCCsQhmfwIpSYUjzKnDtYyE3AdrZ7M7SsLRlpHczmzuYuZuGxRz1sfVlHQpnuC/
	uQBJX6NW5fI8EauX6BLqazy9n26hyF77XhzDCRYoKcPQmwdkunU+vjCLXJ336U5L
	7Upkkt+AeMDJn7Jic2/v9Fs799F12tpieieJ9N0jdY175IcSzqsxJPLH1dPjStLH
	Sk4Lr+HwgzKcW6lDZnW4JiKQCncxur5yutvHh2bnXotDaR+AhtTlAlNV8Hji0ubM
	OQaTaA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhb87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 07:43:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36de26cb4b3so878189eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 23:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794555818; x=1795160618; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyhZym5r7vlLk7+pIInUS9OjK0AomV6NyXnFLTBOCfE=;
        b=W+3lsLUeYQQEj0mKgaW2nKha4q6iabKs2VKOUGBNuLob51dsP0Eb/fufwwHX5tAQ0D
         qo6bvt8y92QRsmhvd51vasv++wgZ488HjD2uUCVbz9NKsr7PzsxzBPtQBw/2M/cKNviF
         0LoQBTTL0nYy3+ibzCfGAUx02S73/0GbS51GIdhXJD/PLZ8pC4ln53lvwUdidlOVFwU1
         tmGbZzrrG9C0ZJc6YHdzizhSBLevU7q5MXIuAJFWeFJDC2UTPqJ/YFOhJuCqwl5nBSzF
         DjWOHdZJFr77i4U60DEpOPiTdLRohpIPdXv5kbI0amvn74dRUf6QWW0Bfuxbjmi128/8
         evtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555818; x=1795160618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qyhZym5r7vlLk7+pIInUS9OjK0AomV6NyXnFLTBOCfE=;
        b=yLsGCiGm4ydhaNI5oUL04I+q9A86LccfjMUkb+bxrEOHBQTdTmMpEEPUy6XAvcfbeY
         OI2KDxipldTemhSqwuRY76JjOmyu15rrPI/TlIA7CPr7LCaZv3grvIOcdXPoWP5qtTKm
         yY7VpcozwomzFvfKG2cVvnZj3IDwF/9EUGWWwv3tPRsQdref6dVzj3XMIou2UCpNpJ9l
         2lUVuu809LY4Jb9GO2WKgzw1j9LtPGVPVM8JA6S8sN/P/9Cd5V6N5xS2uVs67dZEW4O4
         Pj3cuJCoqsoQ13hOHOIL4idU5Yo0tn8CgKDGObij565TP5jxIaj+mUjOFHnJLMscTJSA
         5i2A==
X-Gm-Message-State: APuU4Z/fSq3wdioOomP5l04aMShnLM85ikfeNiAXr2pG+pGl+SBBKMDe
	z+28gXcEmisklc6csmCnfd4rjqUgc8kOd0qj9cgVVYa+L5YwxBh8cX6u+WHtQbYfJcx4FZd9bWr
	OP7XO7Gs2+RH+QFOgSg5tAcwdHqNv2RT9BgzGjHjoK5s/pzAHn1GiyLj6O/cjI/gI3cPrNFFU/E
	GfLMQ=
X-Gm-Gg: AYBFou3NyovNMclCMYHEISgMErHWc830Ic55LN6g3nj+GHKFEyytC0C7j0ul/vXPxcy
	VGsFnuzXBMgiUZdwuAvdNajsHmfT/8+ep4TkePokebPNp+uudone2okp15d0r8COvMh/VLizPFA
	Ozrr76s1T40I3QyNln2+WrX+eqZKrgLNd6x4BLWZtZBV/jr1n4UfWGrn+7GmcBJuDDNSFerX8SS
	YluaYYMI5H/pgYjregEJqHL0EO+/Ojj/R1PeWWPaRnoMg4W3eMo2kea07e8mPFwKkSYVyz1PCNB
	O1LuDNBR3d7djej8LhCPQ5yeThAMs+0o2GsJRzKyX6Hu0LXBYMT84H8/c/JWzej4hx6F7X/t3uB
	wwdWupOJlwpkVozXqELVF6lUUG95M+ngR8bdfsfOvkJ/H3pTdbdxlsDBWt0ChOdfiMsxT7DJD6w
	I=
X-Received: by 2002:a05:7300:b284:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37966e3abf5mr1789753eec.10.1794555817501;
        Thu, 12 Nov 2026 23:43:37 -0800 (PST)
X-Received: by 2002:a05:7300:b284:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37966e3abf5mr1789720eec.10.1794555816714;
        Thu, 12 Nov 2026 23:43:36 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm4641162eec.10.2026.11.12.23.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:43:36 -0800 (PST)
Date: Fri, 13 Nov 2026 13:13:31 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/8] media: venus: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <20261113074331.4vkjhcqzu3vqpyt5@hu-mojha-hyd.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-5-mukesh.ojha@oss.qualcomm.com>
 <20260926155935.250F71F000FF@smtp.kernel.org>
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
In-Reply-To: <20260926155935.250F71F000FF@smtp.kernel.org>
X-Proofpoint-GUID: UbvMitYsa6sAMHl3E3o0oqmnuy8u0fQz
X-Proofpoint-ORIG-GUID: UbvMitYsa6sAMHl3E3o0oqmnuy8u0fQz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMCBTYWx0ZWRfX5oLHXnIkihBF
 OKADxb3PgbSbF6wH1BKS6YkLP/QG4joxLSCsVz3hOaxUQbRU2+zWOFsQWDwOKrLFlgGxkgVL0Ea
 gi2IYo3XlHEjxIWXI2jfUt9FNzcMuuLw2CE6ARDXPkNHs7sv1CuKPlD75aQ4Dc8StvY+eEf1/uH
 FlH/mD9jWeXPiSfzGi61yNSW8tbGJ4GLZ1LGWXskUGnUbkiajPY7hmL8UCMltoH/8ft0eU8o/nb
 8EelUVAar6qSzqglpTG1L71DV0Xqpc+emgvi88NZnxA3eaR3lY9RMb77bgthuou8+v93/QUZiZa
 HzCaQtGEHaZkh3x1LamHevn4owatp3i5qmM6Q7mBNtc9CWZnbvpXFrwo2TMNRaHWkt6jCKvUXY3
 0+WTOOekiwT5H18dVZanbksWFFu5RQ4Wg08n6e87/srw2MRHdWPRG0a2ryrkRQPgv1sgvyxmybA
 W3qHODtHYjE8acIQZCg==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6bfaa cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Pjq1V1fNRajfxtsVpAsA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMCBTYWx0ZWRfX4asWdBQBFUpz
 mpX60dYtguC+PXj/WWrDb+71ANlOvOnf9AFtuMmOSvnnQ0V1q+lqlbkfM2mzjmLtEImBP7q0s88
 /7ndUIRsT4jldyLr1Q6Q6KSrDUHllqM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130030

On Sat, Sep 26, 2026 at 03:59:34PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] media: venus: devm_ allocation in venus_load_fw() causes leak on error recovery
> --
> 
> commit 8d4223f26ac66cddad9e1923272c5c9297949631
> Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> media: venus: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
> 
> This commit migrates the firmware loading for the TrustZone path to use the
> new PAS context allocation and loading functions. It threads the PAS context
> from venus_load_fw() through to venus_boot() where authentication occurs.
> 
> > diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> > index 3a38ff985822f..4ea4c7769ac3d 100644
> > --- a/drivers/media/platform/qcom/venus/firmware.c
> > +++ b/drivers/media/platform/qcom/venus/firmware.c
> 
> [ ... ]
> 
> > @@ -117,21 +116,19 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
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
> > -		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
> > +	if (core->use_tz) {
> > +		core->fw.pas_ctx = devm_qcom_pas_context_alloc(dev, VENUS_PAS_ID,
> > +							       *mem_phys, *mem_size);
> 
> [Severity: High]
> Does this devm allocation leak memory during firmware error recovery?
> 
> Looking at the firmware recovery path, when a firmware crash occurs,
> venus_sys_error_handler() repeatedly invokes venus_boot(), which then calls
> venus_load_fw().
> 
> Because devm_qcom_pas_context_alloc() attaches the allocation to the device's
> lifecycle, it is only freed when the device is unbound. Each recovery cycle
> will allocate a new PAS context and overwrite core->fw.pas_ctx without freeing
> the previous one. This could lead to unbounded memory consumption and an OOM
> crash if an attacker or stream continuously triggers firmware crashes.


same as iris driver, placement of devm_qcom_pas_context_alloc()
need to be changed.

> 
> > +		if (IS_ERR(core->fw.pas_ctx)) {
> > +			ret = PTR_ERR(core->fw.pas_ctx);
> > +			core->fw.pas_ctx = NULL;
> > +			goto err_release_fw;
> > +		}
> > +		ret = qcom_mdt_pas_load(core->fw.pas_ctx, mdt, fwname, NULL);
> > +	} else {
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com?part=4

-- 
-Mukesh Ojha
