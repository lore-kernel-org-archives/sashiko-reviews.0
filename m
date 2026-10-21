Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577376;
	b=sQErN3UbITIrr70cMdF1fJqN9eUt3A0pSJ9J7XaSoxXAyUFlgWy9WhJ+rrE35NeBy4gb
	 5SyfZrP+lrWtx1aAAKMiLm4K+fs5rF4IUmdo8SstH3ZqRNN8ERjXT0NFuvXm6xEhtk1BO
	 eKILna9+Mf8vSeio+k6YEyHZJ4FSc3wY9QHr3CGWj8pNnxNN/Ikc9VmiTPKpdAdPHE2GY
	 NT/niLzKkf9v5zMpOCU59tatym1alQ1QXaiLimBl+96fzw2NkX/Auy/MCD5/UqZeHB8Sc
	 awg2tlkaXMoP1Su/sKlg/I36yCwjS0EqEmqRDJYhSFyWdYlbQYLsoU1aP+AkiqZlc/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577376;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xX7w89EkaqYgsjNRtSfJ2R58JonXwvOwafkoVBNr9Wc=;
	b=T5xKmH4a+U62N/rlqIyiS5ta9rlgVAUhCRQbK7fvBIHENqsH8o+YfI/bXJQkbY5Eww/T
	 F+Krxv2oP0LWKjBBvgL7TBXpofFckiMG/UpCSL9kEJSDKzfPt1Fev0h9EjLCCjtgCxOxV
	 VhAqojSaGMps0E9BXrLUi5ltJrpwtttbIfUUgm8T/h/Iov8IvqerSjbwXAp1rXERF2Oz5
	 d2xOe9r0scIpG+wOCEABsp1lZdVgoB2+qj94JWGf04tZN1Kd3EhsexFXV3S48wmhK3ZMt
	 Gt8uPpn6cURPqVwbZFOyZsVlQDfMBMqhFVVnQYOt6+M/W4esQHlw5QnsBYVBZsVyurA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VuBnaPI0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gUP0l5mV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DFD606A328
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34DFD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VuBnaPI0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gUP0l5mV
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5XPp335069
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xX7w89EkaqYgsjNRtSfJ2R58JonXwvOwafkoVBNr9Wc=; b=VuBnaPI0CPbl/Ewm
	ui9CmMcphg4JRY61GGMhq5QiiG7poa/2e4xeNLERxfFGhgq66R36aVuK0apkS6eq
	E2vYxbrjq+vxlH7S+kIMxds+ElDQB/Efv1pnpcWgBCBorjQHvg/3H0+1ly/TGxd4
	PEM3asr+5vPiiUQbc2Xi0tSzddcexfYvgCyWY20LPxxUSIgUW15C0mPUEQ/WGbjy
	etpMd4xdiS4202CR2/cCfdoJU3q2CtrlTjEeZeNBmzbDLi7bsSMxGHygx+Dh9LT9
	ykEbYcy+QfBAPD+2DSvgeJxm9iUimpOO1q6aitxEGl/TytgzQ7DrH9ga1wJMxNb1
	Q6vlwA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj4874h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 10:09:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso887313a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 03:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577374; x=1793182174; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xX7w89EkaqYgsjNRtSfJ2R58JonXwvOwafkoVBNr9Wc=;
        b=gUP0l5mVKcp4RTQ1AWdhhYUWaMW5ozRDgItTmBBmRCTf9y0XC89NMuHxbah0S6PPD/
         n1Db8b7nQifbhrF1/YwDU6NZL3mKVeiV3p6idLRHYUQtjiebBZfNuAM/EFrj505An7Q+
         pEZM79yRxd7BzpYu6woKiKII+aJhDWsRgpKOBTtyCnixz6himx6zyiY2vwl4qqZWTmmU
         S2UCkjRHeE88gjKAgBxBHgzCDPhHEDTiXaGfiqknZ7lGlm1yb7hoE8FzBzrAxs3udqOC
         2uYEXDMQFgsfRLFnZPkUa1+yNXlFsRCecB24VVMVgiOYkbElgb4/hN6DXtRV5RDXKtb8
         7NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577374; x=1793182174;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xX7w89EkaqYgsjNRtSfJ2R58JonXwvOwafkoVBNr9Wc=;
        b=yBk2P/AjrW2CUMKSDeuqsLuYh1DzoK51a1Aq5ygLM4NBAF7Iw1PGOUOHhIr0EwhvNf
         t2QitVys0UqpOhK5V5dpyeh/dR+EKm5+luhai0hIVc3MI+TxfViQ10ZBkApq08kHeB3l
         WcsN9Mg/eBV2r1E8Aty1gup3ev2ibufHyXS32oWCIt3droxJaygAEL9ZtWfKvtX4hGLn
         /txtItm55RZCIw4xx+7ADnThJE73qnQM5gqgSIOpe1wA28/PSoRC93zHVuwa2rWAY0qG
         IRLvfqPA3BDsuYyPcR+WPb6pNKSQM89ZvQTLOAYrHiWAS/9GtHr4vPs5x0PhGtRdjB/E
         sipQ==
X-Gm-Message-State: AFq9FYL38Traw+eIamjkYiaOV8hO1KxE1Xt/97Ghx68/9hNT+BIGHb6T
	sXObdk9Im0Ftoyqrq9NKv7fW2YuCeQFDvjcTKrYBPchRBMm7yHuwzYZ5y+O8zaSf89wutejxHCO
	xDJvUlUSe2uO/nP/pyGpQXWz/zoIPTVYYH7S0CfVy0KCk0C/mqe1uzjnq+x1zpzDMdPLW0vh3Xo
	OQeII=
X-Gm-Gg: AYBFou1VmYN+WXDwyGX4XpQvaAGy7uUNDOWY5GRK26MTa1gbdTRAkcifBAIqMESGBZA
	wPutBD6H76ZjPzULZ8Udzwny+eF/IDuASddMTmh9TX3YTkShBIjrNMNc8wB2V9HJqCBirYVReYo
	KyIsYP9szOESxHfy40js1mF6zBj+dCfv7IUbF8wNeLQ6hOQGPNB4T+6ogrAMRL/jANW2GgHXh2i
	CPeluVqgFOUFhmgK8PsgOQycsMLeVGc1vfwlYRj6feqpD4ZmCerFEPkl0LO5RxvqrVv4eeSnl8J
	D0tpFLcjnxxBCmTXUanSoAk+8uKnXOHjRxlvHKg6eSLuy+Fr7INnBarzu+TvVJHeb0HArRw/Ivx
	9Sx++TomRDahz7IXXvS0GBeX+m58OCNj+GQ==
X-Received: by 2002:a17:90b:5806:b0:3ab:5832:727d with SMTP id 98e67ed59e1d1-3ad86f28451mr1324861a91.35.1792577374350;
        Wed, 21 Oct 2026 03:09:34 -0700 (PDT)
X-Received: by 2002:a17:90b:5806:b0:3ab:5832:727d with SMTP id 98e67ed59e1d1-3ad86f28451mr1324843a91.35.1792577373707;
        Wed, 21 Oct 2026 03:09:33 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6a859bad0sm627534a12.9.2026.10.21.03.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:09:33 -0700 (PDT)
Message-ID: <99df2266-677a-4d38-ab6d-e89f22c472c1@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:39:30 +0530
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
Subject: Re: [PATCH ath-next v2 08/17] wifi: ath12k: Add hif operation support
 for QCN6432
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-8-f510c33bfcf5@oss.qualcomm.com>
 <sashiko-outbox-173697@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-173697@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VdIyx2hTfR8APpOHypRq8MWiQo5LCCwx
X-Proofpoint-GUID: VdIyx2hTfR8APpOHypRq8MWiQo5LCCwx
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad88f5f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=dyD3vpXHCcajTuVPfTYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX4dmGVePE1snZ
 yOS1vrH4Pfp0kJAhMmzIR7vKBMVU4FyN5KsxwGAk1j3F33nh7jP7r/LsZfc6P4JsiX3RtRUTIUo
 SsyGrLp5NaGArq8QVA3SZdlXaqJx/DNdzJDgouKHdsl+iJlT99l2SubngYX58TnqDWQGzSoz9aO
 g3NDsUTc53jhQ+BIJ4YKda7N2ohjz3sOoG2bJPAaeap9fRKtUbLOZIAbBzn53z6ysXWKkmgsOSo
 Ler1tf1S3Ow47G91brVcvXH5YjiTlzwt3iAW5spjyTtwwvFDu69eP2R28WodE0k0oEKcum8oyzr
 1dllaOoh5eXooNE5L8SmvWTTZF11LdHhHwORArkKYQaNJVMgsWpJuXAEUvh5Mm0L9OsuD8OAceS
 JJ9827y+xUZ/7ekpiveUBoLddNA8YKGPW8Lr4lnzqw95WcdTOWF+g4HL9BmV9pLfREcRcshJO5P
 2C8OvFes+Zd8VXsZ/zg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX1eiXVcGASTRI
 6M2kTYod9TnchCrnbyg4pZGcMVEJ38j1fsag4BxqrEH6C5+OoRba5Wb5NQYJYtfM3SCHOnYOloY
 wFk30PdKqh8wYFwhnuezmRcmyNKG6mM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040



On 10/16/2026 9:16 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] net: ath12k: unconfigured dynamic window in pcic read32/write32 causes out-of-bounds MMIO
> - [High] wifi: ath12k: use-after-free in timer callback ath12k_ce_rx_replenish_retry()
> --
> 
> commit d724e1834e7dbd2c47e113791169e389fe945179
> Author: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> wifi: ath12k: Add hif operation support for QCN6432
> 
> This commit adds HIF operations for the QCN6432 Wi-Fi driver by reusing
> existing methods from IPQ5332 and QCN9274 where applicable. It implements
> QCN6432-specific operations in a new pcic.c file.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
>> new file mode 100644
>> index 0000000000000..e3c8476af459c
>> --- /dev/null
>> +++ b/drivers/net/wireless/ath/ath12k/pcic.c
> 
> [ ... ]
> 
>> +void ath12k_pcic_stop(struct ath12k_base *ab)
>> +{
>> +	ath12k_pci_ce_irq_disable_sync(ab);
>> +	timer_delete_sync(&ab->rx_replenish_retry);
>> +	ath12k_ce_cleanup_pipes(ab);
>> +}
> 
> [Severity: High]
> Is there a mechanism preventing ab->rx_replenish_retry from re-arming itself
> here?
> 
> If ath12k_pcic_stop() executes while the timer callback
> ath12k_ce_rx_replenish_retry() is running concurrently, timer_delete_sync()
> will wait. However, the callback invokes ath12k_ce_rx_post_buf(), which blindly
> re-arms the timer on allocation failures (-ENOMEM):
> 
> drivers/net/wireless/ath/ath12k/ce.c:ath12k_ce_rx_post_buf() {
>     ...
>     ret = ath12k_ce_rx_post_pipe(pipe);
>     if (ret) {
>         if (ret == -ENOSPC)
>             continue;
>         ...
>         mod_timer(&ab->rx_replenish_retry, ...);
>         return;
>     }
> }
> 
> Could this cause the timer to be re-enqueued after timer_delete_sync()
> unblocks, leading to a use-after-free regression when the timer fires after the
> structures are freed?
> 

The CE IRQs are disabled and synchronized before timer_delete_sync() is called.
This ensures that no new CE IRQ processing can trigger RX replenishment during
shutdown. timer_delete_sync() also waits for any currently running timer callback
to complete before the CE pipes are cleaned up.

> [ ... ]
> 
>> +u32 ath12k_pcic_read32(struct ath12k_base *ab, u32 offset)
>> +{
>> +	u32 window_start;
>> +
>> +	if (offset < WINDOW_START)
>> +		return readl_relaxed(ab->mem + offset);
>> +
>> +	window_start = ath12k_pcic_get_window_start(ab, offset);
>> +	return readl_relaxed(ab->mem + window_start + (offset & WINDOW_RANGE_MASK));
>> +}
> 
> [Severity: Critical]
> Does this read from an unconfigured dynamic window?
> 
> When offset does not fall into the statically mapped UMAC or CE ranges,
> ath12k_pcic_get_window_start() returns the fallback dynamic window address
> (WINDOW_START, which is Window 1).
> 
> However, unlike the cmem accessors or the PCI equivalent (ath12k_pci_read32)
> which explicitly lock and program Window 1 to the high bits of the target
> offset, this function skips configuration entirely and blindly performs the
> read.
> 
> Could this result in out-of-bounds MMIO reads, directing the read to whatever
> physical memory address the dynamic window was previously configured to map?
> 

This should not happen for QCN6432, as it uses the CMEM read/write operations for
accesses to windows that are not statically mapped. These accesses do not use this
function.

>> +
>> +void ath12k_pcic_write32(struct ath12k_base *ab, u32 offset, u32 value)
>> +{
>> +	u32 window_start;
>> +
>> +	if (offset < WINDOW_START) {
>> +		writel_relaxed(value, ab->mem + offset);
>> +		return;
>> +	}
>> +
>> +	window_start = ath12k_pcic_get_window_start(ab, offset);
>> +	writel_relaxed(value, ab->mem + window_start + (offset & WINDOW_RANGE_MASK));
>> +}
> 
> [Severity: Critical]
> Similarly, does this write to the dynamic window without first programming the
> hardware register to map the target offset?
> 
> Like the read path above, ath12k_pcic_write32() uses the dynamic window without
> calling a window selection function such as ath12k_pcic_select_static_window().
> 
> Will this regression corrupt memory or hardware state by writing to a previously
> configured but currently unrelated memory address?
> 

same explanation as above.

