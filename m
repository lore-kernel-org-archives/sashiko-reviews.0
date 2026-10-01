Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3BE1F8691
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866105; cv=none; b=Sfokm9LpVCdl6aEO8hbFjZk+PuGdfjgrqtwGauqkx67yr4QXMSNQeCDSLVMz941G4joewqZb90kpStUgY9iTf961SHLZDPcNMN4tJcXO90VKfkZDRSyPQmP+Yvn6VeonSVGvRlO1rtg5fUy3bDFgfhXgc15b9QwxkVGxs+q6DR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866105; c=relaxed/simple;
	bh=FyHV6m1/EZNSXKgsHhXYskeROCY3tmOhN2JCOk0WzjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uv11lgbIAU5QDYV3uVALxQRfKWixpMBK69IKAUrVfx0PNkx1VxZBMSr0nwGAqCga+Vwf7X4W5G0gHra++TOEr1M1wi6uM9kZVPC9DZIC8vknf3tD+2LtbOLL1PIwczACVe5QSB74yAKt9j6tatp/fHCKP9LiFpj9Smd/AjBOG60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqTIDY0s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R8yJfyW+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqTIDY0s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R8yJfyW+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Dju0V1304144
	for <sashiko-reviews@lists.linux.dev>; Thu, 1 Oct 2026 14:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2KF52VAg0Bn4Q1lcMkRsMEw9QoplDZ6ZD0QBTPKprAo=; b=OqTIDY0sRff/ncXM
	5X8EZDnDIYUFw+gzjsjmnihbGkv1Sy74CpbvZS6450AyFymvtYAnEAsT4fyoQZgy
	WUL/dXW5qpIbAvXYxvMegI4mtbVCHBc00qfa3uQQ7hIVeI0U5cVwy46D0312fPif
	OAW1eaTYNW4JuWC2y0L1rlBilLgbph/a/9HxIGNHnuuRkW9aSP2gkD3Vh9ZobRXF
	oTjFO7kJhBT/h/XCkaBCbC8ThuZR1aKlIlbP1cHs0SIx+TfCYUNGQZO32i+fpnVG
	z3kyzViNsJNLpVc9b3EDOKRYvvwDAmVVADLzaUo7/NMeFSIwd1AtQkevXZgjBl9d
	PDfgFg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5c6dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 14:48:23 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc72777faa2so3982519a12.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790866103; x=1791470903; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2KF52VAg0Bn4Q1lcMkRsMEw9QoplDZ6ZD0QBTPKprAo=;
        b=R8yJfyW+Oyx/SdJ2oxO5EkGTdDWLEAU69MIvsQyKusu4dfwpWY/EOAw6ZaL7d+Hn8k
         WdOounTR1GlYwtfi5OINZCq7liyUgv4j4FAbk7pa14sM98dB08i+gRLo9V9wfmNmlO2D
         jzkr/eKwYza+6J34tG2O7EIznXVJLS65lfw83SNP05g0Y9IGzx3wfmFVlDeKlOv8lQ0j
         jaPg9IptAQ7iiZuXxjXDzOF+RQ55cUwM89xiJ7OMgLmuXQvc/ZAGX1WRjrlq6xM9HQeg
         a1EKJzjHXvZvXeDc1XejSR3KC1+wbWnKtQ6gQqBkmRqOY1OAPbjnJKOSi3zigS2WCqtk
         h8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866103; x=1791470903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2KF52VAg0Bn4Q1lcMkRsMEw9QoplDZ6ZD0QBTPKprAo=;
        b=LxPo8VmKr2I2tIFoVFFFOHA8EEcIvoTV7d9ki0p4jlzlWUCqrJ7UrRk0bOn3xvYGdb
         E6mQWjOAe9BmukAY7XonGLshuxOPg7YNhIPHdufKSpr3QAM6kg7L++MpFrQ6Xyb8pI0/
         0vbjxLOtqniOqamS1KIElzluKa2c49QVanYMnoqvgtTZ4LHz233F0dNfS95SMKrPRZVd
         NCpI/o03tUUSW27K8OZQNQVOw71fi4Z7j8HDqVim5fMl3aJbp+zqL5tH18Ckevj1bEwV
         pMe3eMVxPsM+CNA+o6l1GDSQmqKHFeaxsac6Jm9oQOWWF2Eo1KwY5Z1Tyim0DH5yEYyO
         m+rQ==
X-Gm-Message-State: AFuF++nJmZYqeNA/wh5zVpWXd6cN/rcdonKrrr2aTKW8kzbLJyN+0ThD
	6r4nCaA+MMYFvTVMsgbzzgGVGZiY1ef06EF36qOtWwOUkE2RUn3GyiXNvNVRBVOmonh5lq2ivIG
	8SgLL2AZQxuZgGDEwXfR5C+k3C5iNsE46eTIQjVOWF8AYU+bx0rcxYufyTSUfa8pFX6XIh5Py94
	7XjWo=
X-Gm-Gg: AYBFou3El45JVrRRWB1/mbvlu7Tdbs0XCUqx4fPmzwtZ9yBSCy3o2rAzPgYhpynhIMU
	TL5ESMpitZkLeHq1He67NeMOybQRGgwPcqLiG5s2D8mYNpyrnGuYnjqhY3Pi136BRkbcanCEMMt
	lqD27h4ikdi/rG3qiZ8clTQ5g2y8qjumcHGZffFgpsJMo9HaLZgOFmSTu19nJgOAMe0TJ3XCwue
	oHMPJEYiWLo4rVFqkANuEWADxmdwJJxu2REFYo3nT901k2XoIn5JrNz327myHc6kWtq0mj4pKwZ
	uheaxqbM6ev5VYR6HKJxwCKsqlQ9dwv7bBRGx2HZEXhTMWbgXGy3Wv05b3JJS45MPo+cKhyadPi
	gG0GMDdo/5w0m5JPhc7hknk/6q2jW91uhXIYS
X-Received: by 2002:a05:6a20:d791:b0:3de:14ad:ae8a with SMTP id adf61e73a8af0-3de9e6e8391mr4704648637.16.1790866102476;
        Thu, 01 Oct 2026 07:48:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:d791:b0:3de:14ad:ae8a with SMTP id adf61e73a8af0-3de9e6e8391mr4704629637.16.1790866101886;
        Thu, 01 Oct 2026 07:48:21 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e539b9d2sm1653364a12.4.2026.10.01.07.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 07:48:21 -0700 (PDT)
Message-ID: <b5b4dc98-7c46-4482-ac6a-dc3f042d3947@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 20:18:18 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
 <20260920-qcom-bam-dmux-vmid-ext-v2-2-ef5ca2178378@oss.qualcomm.com>
 <20260921030315.BDF9B1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20260921030315.BDF9B1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1OCBTYWx0ZWRfXz2ZFJZIAt6wz
 EnQtsLWPrtNYe9vvBPsUlqTjdWttH1YXwHSMaQJMaSC+PZVJ7r1TVEDlJ4u/QTzyN8QBh/9i79C
 2XRyiF9DrW0r45rVhBFR9qhRAe0TXH6NdBttCDb1MqaxZUWEYvKy9JlVnc9E5MP1tiF9Kea1f0O
 lwL+S4bba+8Ia6xq86r+OmVkoI2pFHjXbxlUERvnYpkMJZQY0GzEIB57sxdEsI954w8KofyOlG8
 uPkMIaYYCsMrKY2K0C9RhYmpCJVQsI0r8GbtUnb0it7bVbnzPQDMEWlZo1yJCq8tVO1+rsLDVDX
 vN2Lif/RTbMT4FAqgECfB5S4rPvsdsTg2vpKm26Ja8bHsH7YYnW+ERAyL7u9SvjYHvK7hEsic1Q
 8iwSqyCZjl7TbsCvMnOMceMdZDXAfRDofDo2kQW2noJrLxjJM6ydwaCTevFO8/D8QbxHlxbzO4Y
 wy6DjX9iRJvoh/N/cLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1OCBTYWx0ZWRfX3KO9gs97Xtvd
 d7w2HUUSWP/ikFqE5ltBjXGvos3wNM6Y+5HAeM/Qz8i9Cm1tr6FF1OiSRr7dC2TZbeLflmUOEfE
 iz2+uhARInStp2zEEu1leAiZmhAGrHQ=
X-Proofpoint-ORIG-GUID: C1K13Nq30jWDWZdWmZDfVO81j3wLSh0a
X-Proofpoint-GUID: C1K13Nq30jWDWZdWmZDfVO81j3wLSh0a
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe72b7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yF5iw_r-_bYeXxWltswA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010058


On 21-09-2026 08:33 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] wwan: qcom_bam_dmux: probe error path reclaims DMA pool before disabling IRQ
> --
>
> commit 4ad4e0793e663284df130f5d11d5a4f0bb1754cc
> Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>
> net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
>
> This commit introduces restricted DMA pool support to the BAM-DMUX WWAN
> network driver for Qualcomm SoCs. It assigns the pool to local and remote
> execution environments during probe and reclaims it on driver removal
> or probe failure.
>
>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
>> index cc6ace8d64371..c81e668d4e961 100644
>> --- a/drivers/net/wwan/qcom_bam_dmux.c
>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> [ ... ]
>
>> @@ -845,6 +938,7 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   err_disable_pm:
>>   	pm_runtime_disable(dev);
>>   	pm_runtime_dont_use_autosuspend(dev);
>> +	bam_dmux_reclaim_dma_pool(dmux);
>>   	return ret;
>>   }
> [Severity: High]
> Could reclaiming the DMA pool here lead to an XPU violation and resource
> leak if an interrupt fires concurrently?
>
> If probe fails late (for example, if irq_get_irqchip_state() returns an
> error), the code jumps to the err_disable_pm label. At this point, the
> pc_irq has already been requested via devm_request_threaded_irq() and
> is active.
>
> If the remote processor triggers this interrupt, the threaded handler
> (bam_dmux_pc_irq) could be executing bam_dmux_power_on() while we are
> calling bam_dmux_reclaim_dma_pool().
>
> This concurrent execution would cause the DMA pool to be reclaimed
> while the BAM DMA controller is actively using it, resulting in a system
> crash. Furthermore, when devres eventually frees the IRQ, any DMA
> channels or mappings allocated by the racing handler would leak because
> bam_dmux_power_off() is not called in this error path.

Makes sense. I plan to reuse bam_dmux_remove() for this, which disables the IRQ
and releases the DMA channels, mappings and any registered netdevs before
reclaiming the pool, in the same order as a regular remove. I will test
this and include it in the next revision.

Thanks,
Vishnu

