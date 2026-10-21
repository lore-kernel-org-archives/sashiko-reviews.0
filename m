Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583948;
	b=wlLdv6stb//PJp50QwNEtwgsCTKfvILl6JX9dhR7qkarfDco/s5v8g8Ow2Hki12lgJPf
	 WnsXxJgXR0Zq+jGB+mokWTwVTcZfAxTJebbf2leZUcPoL66D7ZjXh4Tcgi66NWtANYHfo
	 3tCGeosd/xIhV0j2UwVzBeYb5gGHgEGnoWBdhVNtL69kwPkrcCGhy5hWh741Tcn6xYJV3
	 bwEiLLDIRU924WLFCh6vZcCuOfDCvHpQkgJrLPg9WT/+JEXD5SALD6WQyrGG11PgeisQY
	 17rwbkx39U+KsazxIgZ/8SKl/+81XICIrA0VzWWidmV6SYwi0NTXov0ZyQ3h8TQhGNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583948;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8sVdcb9WOamSSxBX7E5eJsqhQ4h6DMMgPD6RZRCx7SM=;
	b=5CCnW5lGeC6rG9gpZ31yBO4dywBl4HADVSO1hxVOHOduMK+dpMCFhji1ohyXqwf3ocUb
	 KAE+1pkKs7giSjG8klss8DzlS2vduKLsbQScp2C66BwD/dyOt4xwN2Mp9S5G56Ti9jTv2
	 3/i4P+NeXxLX8f3T3Jzoq0AFiuAy0ryza4OeZVJLFit5RxZQICj5wA4mMGSnWuc9gOxwX
	 0PJzoTgVcphU7Ta5rf6a/T2kVLDJ/vPoS2p3OfmpQQJgjM10LFBju0htweZ3t6kdH2RAy
	 sJiUhTqI6gfpYm2siADGMSXTSBNtIlpsrM/z/33kz7Tc9cYoaupVdUtmJn+N42vuVsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfTav5Q6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VyliqDMi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76301606A319
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 11:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76301606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfTav5Q6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VyliqDMi
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg8kS977423
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 11:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8sVdcb9WOamSSxBX7E5eJsqhQ4h6DMMgPD6RZRCx7SM=; b=BfTav5Q6ZIKdf48c
	eN2QC3GLYvzFJN6oqbfdhXg2MkVpRsB8+vRpV55k8QkMqT1G+JA5oxXnnpIv0WXO
	wS5LCu+WXRBtF9SyiKtppPwJow/Kx4fQMoONS8t7lIBbzFV0+1jLSxKlUe46R54L
	5Db8arC7BCe7YfsLI1tYVax+WREUXh7FPKprsRdw9mjCz6Bj52Gs+CRXbQqLRblL
	r6H6zTtX3ctu3PeNetnwdMS/PAEP3XYpHuQWYf1fBOCHto7ZH7b4pE4SqMjzCA4F
	h2BV4Ektne5nRGCJ1Ce5oYM+iv8eZX/O+SuFUaFFfNNK2OoqRpeFAp3Z9SvjPmjF
	rzirxQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02ysp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 11:59:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso2735955eec.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583945; x=1793188745; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sVdcb9WOamSSxBX7E5eJsqhQ4h6DMMgPD6RZRCx7SM=;
        b=VyliqDMi/Mg5uAAmO8RSqHLhwlcyGvUPtEyODz3AtUYBFMQ5KObik80XwtWxV5JgjL
         S61v+o5Z5HYx/IdK7VpkMxu3SoyYexNR62RVm/lzVYD3ihNf4uE557NNIdIJfYSowHUh
         bgpJ7PWYPWoIBrBpPWJXo5RKX1H32emv9nwFzZmkI7xmJRYz5mtRXZXNIlDLLSRksMY2
         fURRngmfRiq5uPeTKNNtCIxmRvPxibdGKut/XMfJ4e9PhCruHceRb69V1QR/IgJesOYp
         VE346vuQ0zDmjLGVwW9zSq28MpS/sqi19xYrn5oB6p9n0XvW8oM5shWuXwxHybPN2lyv
         6h9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583945; x=1793188745;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8sVdcb9WOamSSxBX7E5eJsqhQ4h6DMMgPD6RZRCx7SM=;
        b=OjizQSsIO/BY7thRiKXritSXbCznFvYQb64WquLKOBEZOJeWirNLYOmGl7DM7oCNDc
         IXZyY9BkdCP98X6QjuSLZBtxY/QnpW8tvt01ms6tsEt4+NUgtEcYNs36/wygsb8Jra2F
         R/ALWfeR2NKbqj3wMHthVK2Zuch/vnBDhhvwS0QlvGIfbXIMfIXe7hk0WOF7EFDfZ+gp
         B7g3TZzAI44zbeqVge3vDPuZre2wdLCt+XWIdkz6BZz16tE4ldppMmaMNPZPu4HZIThs
         T+ipSLGhUv6vAt9zvUm1AX4xutNnJN54BJyLq0gIq2wPZ0yU16VL7i0sXI+syjS72A70
         J1Fw==
X-Gm-Message-State: AFq9FYKoqdOuN3b2aR2hMLs9sOaZEG+CYja9bz50qsQWXckVklcRufsq
	F/T8C6ODrTSgtvEfudV2VLrFhiskrmBzG5AxpLCHMUR78eGtcwovqWp7afbNEtxZL3IbBFne1wJ
	Xdg7tkp5Zm9WuiKTAhKPwAIgqMLf/wBvVfNgNzHzmDHPcYcwRGQugmECELuuIS8GBWGs7dYvRtC
	qbZaA=
X-Gm-Gg: AYBFou0D43V8Mlk7TrrWRx46h4oQxhG3EOVzwC01TiwDWr/9ZDuZxvqas/zGSaMgBom
	BGn1iwNSkhwWKfBEjIsUpJMM/mQYlTQiGKm3olvehBwBAyYs0o4KDBGas6GHRjUso0iM2miXNTu
	3ODDdQPFBCrrPyNIRvOOz+rdhQB2Si4jyx+3jv0KsehB3Nu31DtRA6ACShhQYYr/36uDY7x0UEt
	fSIZodrTDXVYG0+k+0BXkCZCIuKKL2CTgtnXlTpT40q9lnlZ15bmG7Ce0J5xSIs/Kh15qnif787
	4Wj+KmhmqiCjINslaB311ZF7OmGHiJN5Ozbbg/arGoIC9SknUsSER9Y2cFnUjJsHMl+qNGyfa/s
	pZ9krvCVyKAXbxM6kGBqdymrbKulKm3zt
X-Received: by 2002:a05:701b:4189:20b0:15e:12b6:7365 with SMTP id a92af1059eb24-190a1194331mr2367323c88.2.1792583944553;
        Wed, 21 Oct 2026 04:59:04 -0700 (PDT)
X-Received: by 2002:a05:701b:4189:20b0:15e:12b6:7365 with SMTP id a92af1059eb24-190a1194331mr2367302c88.2.1792583943897;
        Wed, 21 Oct 2026 04:59:03 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180b9esm8969327c88.4.2026.10.21.04.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:59:03 -0700 (PDT)
Message-ID: <80d3e29c-b46f-4250-9408-d4fffaabb987@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:28:59 +0530
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] edac: qcom: add LCP/SRP DDR DRAM ECC support for
 Shikra
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-3-aba3cfcfbac9@oss.qualcomm.com>
 <sashiko-outbox-171516@kernel.org>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-171516@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8a909 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aujk0-q522kD59K_cGUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX3M4a1CpM6iZ4
 qL2+ns74lLympZb+UfMu7IImTlige5qo0vl0h64AjP5uVgDuFYt83dwOtrQhz/xtWylACocaSHe
 MYdCTvh8ld52FEbLxJPTkQDsq/33yc9KHsDlwdeX722oi+xJoNtGkUItmvySss3uopAgKEcWpiD
 L4qhHfjltzNYqZglWaaieaP7sJ3jGZpl+F6f6xMeLqx4jE8qqHw9Qq8uPBEHAwuSARSxPpePYol
 javMOkn+y+6O0UYCSIF44Nz1gCX6it/tlHHTvr9eupqB4BBbN103mxlkrcv37VfLz+c7fRq2qh9
 cu9S/D48G8QTqGMvXQrVfDX8Uj8oeWNU9inBXStnnkEJOxFPeXdkdmc6rGP7TTirc4SRB1HT/rR
 tC9iatl0QdeOkZlTY4Ush9XlURf4TKn2vTDlm25tW3PqFpqBFPkzUXca6iUD7DOshn+kpD2fQhQ
 LEtG//EIMs8OI+Trn3w==
X-Proofpoint-ORIG-GUID: VKuEyZXxORrxfugvL6-NB5VZsAi3E_ED
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NyBTYWx0ZWRfX3iWv9AP/TIrY
 f4v9E5Vqlo453BsP3DsYwNJCRyivrcECThoaCH/ObWoXX5uGcuhExAdQv+McDU92RiAyw19oT76
 p2bjzupUsouN3vAMMLeUqJEE0R/V+EY=
X-Proofpoint-GUID: VKuEyZXxORrxfugvL6-NB5VZsAi3E_ED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210047



On 14-10-2026 21:39, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] edac: qcom: UAF in llcc_lcp_ecc_irq_handler due to devm_request_irq lifecycle mismatch
The identical race exists for the pre-existing ecc_irq INT mode path
which also uses devm_request_irq() with edev_ctl as dev_id. Fixing
only lcp_irq would create an asymmetry; a correct fix requires
converting both IRQs to non-devm with explicit free_irq() before
edac_device_free_ctl_info() in the remove path. That is a pre-existing
driver-wide concern and is out of scope for this series.

> - [Medium] edac: LCP/SRP handlers discard hardware ECC counts, causing under-reporting
Good catch — this one is new and valid. Switched to
edac_device_handle_ue_count(db_cnt) and
edac_device_handle_ce_count(sb_cnt) to propagate the hardware-provided
aggregated counts rather than hardcoding 1. The existing
llcc_ecc_irq_handler correctly uses count=1 since it fires per-event.

> - [Medium] edac: qcom: data race in EDAC counters due to concurrent IRQs
The plain-increment counters in edac_device_handle_ue_count() and
edac_device_handle_ce_count() are a pre-existing EDAC subsystem design
that affects all edac_device drivers, not specific to this patch. Out
of scope for this series.

> --
> 
> commit 943c843f6548de65b2dfbf919c2a617470e1b5e9
> Author: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
> 
> edac: qcom: add LCP/SRP DDR DRAM ECC support for Shikra
> 
> Add qcom_llcc_lcp_setup() to enable LCP/SRP interrupt routing when
> firmware has not pre-configured it, and llcc_lcp_ecc_irq_handler() to
> report per-bank correctable and uncorrectable DDR DRAM ECC errors.
> 
>> diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
>> index f3da9385ca0d8..b4f7b2493650c 100644
>> --- a/drivers/edac/qcom_edac.c
>> +++ b/drivers/edac/qcom_edac.c
> 
> [ ... ]
> 
>> @@ -334,6 +366,92 @@ static void llcc_ecc_check(struct edac_device_ctl_info *edev_ctl)
>>  	llcc_ecc_irq_handler(0, edev_ctl);
>>  }
>>  
>> +/*
>> + * Handler for the optional LCP/SRP DDR DRAM ECC interrupt
>> + * (ddrss_apps_interrupt[1]).  The LCP/SRP registers live in each LLCC
>> + * instance's address space, so iterate over all banks and read status
>> + * per-instance.  Broadcast-write the clear after the full loop, mirroring
>> + * the TRP/DRP handler pattern.
>> + */
>> +static irqreturn_t llcc_lcp_ecc_irq_handler(int irq, void *edev_ctl)
>> +{
>> +	struct edac_device_ctl_info *edac_dev_ctl = edev_ctl;
>> +	struct llcc_drv_data *drv = edac_dev_ctl->dev->platform_data;
>> +	const struct llcc_edac_reg_offset *reg = drv->edac_reg_offset;
>> +	irqreturn_t irq_rc = IRQ_NONE;
>> +	u32 intr_status, err_status, clr_reg;
>> +	int i, ret;
>> +
>> +	/* Iterate over banks: LCP/SRP status registers are per-LLCC instance */
>> +	for (i = 0; i < drv->num_banks; i++) {
>> +		ret = regmap_read(drv->regmaps[i], reg->lcp_srp_interrupt_status,
>> +				  &intr_status);
>> +		if (ret)
>> +			continue;
>> +
>> +		intr_status &= LCP_SB_ECC_ERROR | LCP_DB_ECC_ERROR;
>> +		if (!intr_status)
>> +			continue;
>> +
>> +		irq_rc = IRQ_HANDLED;
>> +
>> +		ret = regmap_read(drv->regmaps[i], reg->lcp_srp_ecc_error_status1,
>> +				  &err_status);
>> +		if (ret) {
>> +			edac_printk(KERN_ERR, EDAC_LLCC,
>> +				    "LCP/SRP error status read failed for bank%u: %d\n",
>> +				    i, ret);
>> +			continue;
>> +		}
>> +
>> +		if (intr_status & LCP_DB_ECC_ERROR) {
>> +			u32 db_cnt = FIELD_GET(LCP_DB_ERR_COUNT_MASK, err_status);
>> +
>> +			edac_printk(KERN_CRIT, EDAC_LLCC,
>> +				    "LCP/SRP DDR DRAM Double-bit ECC error in bank%u: count=%u status=0x%08x\n",
>> +				    i, db_cnt, err_status);
>> +			edac_device_handle_ue(edac_dev_ctl, 0, i,
>> +					      "LCP/SRP DDR DRAM uncorrectable error");
> 
> [Severity: Medium]
> Since db_cnt contains the exact number of double-bit errors, should this
> code use edac_device_handle_ue_count(edac_dev_ctl, db_cnt, ...) instead?
> 
> The edac_device_handle_ue() wrapper hardcodes an error count of 1, which will
> discard the hardware-provided count and lead to under-reporting if the
> aggregated count is greater than 1.
> 
> [Severity: Medium]
> Additionally, since edac_device_handle_ue() performs non-atomic increments on
> the EDAC core counters, is a lock needed here?
> 
> The ecc_irq and lcp_irq are independent hardware interrupts. If their handlers
> (llcc_ecc_irq_handler and llcc_lcp_ecc_irq_handler) run concurrently on
> different CPUs, it could result in a data race on the shared edev_ctl
> statistics.
> 
>> +		}
>> +
>> +		if (intr_status & LCP_SB_ECC_ERROR) {
>> +			u32 sb_cnt = FIELD_GET(LCP_SB_ERR_COUNT_MASK, err_status);
>> +
>> +			edac_printk(KERN_WARNING, EDAC_LLCC,
>> +				    "LCP/SRP DDR DRAM Single-bit ECC error in bank%u: count=%u status=0x%08x\n",
>> +				    i, sb_cnt, err_status);
>> +			edac_device_handle_ce(edac_dev_ctl, 0, i,
>> +					      "LCP/SRP DDR DRAM correctable error");
> 
> [Severity: Medium]
> Similarly, should this use edac_device_handle_ce_count(edac_dev_ctl, sb_cnt, ...)
> to propagate the actual hardware count instead of defaulting to 1?
> 
>> +		}
>> +	}
> 
> [ ... ]
> 
>> @@ -386,6 +506,33 @@ static int qcom_llcc_edac_probe(struct platform_device *pdev)
>>  		return rc;
>>  	}
>>  
>> +	/*
>> +	 * Set up LCP/SRP DDR DRAM ECC after the EDAC device is published.
>> +	 * Skip hardware routing setup if firmware already configured IRQ
>> +	 * propagation (irq_configured); only request the IRQ handler.
>> +	 * Guard on a non-zero lcp_srp_interrupt_enable offset to confirm
>> +	 * this LLCC variant actually has an LCP/SRP block.
>> +	 */
>> +	if (llcc_driv_data->lcp_irq > 0 &&
>> +	    llcc_driv_data->edac_reg_offset->lcp_srp_interrupt_enable) {
>> +		if (!llcc_driv_data->ecc_irq_configured) {
>> +			rc = qcom_llcc_lcp_setup(llcc_driv_data,
>> +						 llcc_driv_data->bcast_regmap);
>> +			if (rc) {
>> +				dev_warn(dev, "LCP/SRP interrupt setup failed: %d\n", rc);
>> +				goto lcp_done;
>> +			}
>> +		}
>> +		rc = devm_request_irq(dev, llcc_driv_data->lcp_irq,
>> +				      llcc_lcp_ecc_irq_handler,
>> +				      0, "llcc_lcp_ecc", edev_ctl);
> 
> [Severity: High]
> Does the use of devm_request_irq() here create a use-after-free risk during
> device removal?
> 
> If the device is unbound, the remove callback (qcom_llcc_edac_remove) explicitly
> frees the edev_ctl structure via edac_device_free_ctl_info(). However, because
> the IRQ is registered with devm_request_irq(), free_irq() isn't called until
> devres teardown, which happens after the remove callback completes.
> 
> If the LCP ECC interrupt fires in this window, llcc_lcp_ecc_irq_handler() will
> dereference a freed edev_ctl pointer.
> 
>> +		if (rc)
>> +			dev_warn(dev,
>> +				 "failed to request LCP ECC irq %d: %d, DDR DRAM ECC reporting disabled\n",
>> +				 llcc_driv_data->lcp_irq, rc);
>> +	}
>> +lcp_done:
>> +	rc = 0;
>>  	platform_set_drvdata(pdev, edev_ctl);
>>  
>>  	return rc;
> 

Thanks & regards,
Mohammed Faiyaz
