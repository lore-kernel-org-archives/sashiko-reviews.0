Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179559;
	b=fRFX+5QJua0M4DaNsqFJVY7tqxyYfQ1+L836eKp3+J06I/u02aS6Lrf5a0meRNMIGNzC
	 Nnyxp9U4arPtB7wek+haOpQbHd1J0JoqTPmeo9b/suZ9sMdtSk7YSGRN1TvDxCtT4obL/
	 aHC9XxuJQ7dq4sIG43cru6E/NXGQsPnEG8zahpdatOleKTsXzxLEB99RYKcr30fu5f4cp
	 lGT0+vp9d5az51iSULCExaAwqFPEqsAPcwdOOaFJhyM/sqFsMuE/XgQPr3R/sRhkj1et5
	 FmlCwx2uG+TZ0yhsKZvBAahr4n9uDWWxR5lCtho4GNNuc0wkdboPNDA6qef7jcr/v1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179559;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ljQ7TWDsmpMFEiU8pyLv6J9tWz8nv1x1LYYHIaNgcrQ=;
	b=DZMf3ZrBHtKOx2+xfAi93UUICMZAxhRfbnG6sR52Cc0CA9m2lzmsh9P2M0wg5BKNDkZx
	 D1XGSugei2zFbxUG5Rsy2k+jvqdAy/vYhH10Jpv6pMH3R1mj5hOhNlV9NBpMuigrJbTHE
	 /4kVjYmp/0uoUpJ8ZqIjtUgO+rBqBtKg0BrYP3bHL8wtgcUwXpZ6/1ygJlEP0mW2AkE1Q
	 qubzV5n2PVQOhL5kiTc/15HY5ivQi4aWUuvRuGvs4z0SyILYZT7ZK3HSSksSlKQLSLNE3
	 lA5k2YK0BAF5mijDcxO5r7tO/wC9RYgc0bMMhJ03E86xhYIFdzsUY5NKqX7Py6MaSsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X+zUxjC+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMHkVmax;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AF2606A325
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2AF2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X+zUxjC+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMHkVmax
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk0ib2155246
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ljQ7TWDsmpMFEiU8pyLv6J9tWz8nv1x1LYYHIaNgcrQ=; b=X+zUxjC+ZOBpHwt7
	ry1zTdTsCdiaudCVPib0IFZefr/MVaXsaoVj4Np40OcmsvWyLI84NpKmViz/tpsI
	4mQ4ZhmPA4G364akYg4wXIw+zT4qk1SEpvTB0Q73UjLa5MXmg/XtKESS+7XgWSK9
	bufZGclCLhEEMujKfcbl6+3j4HiNRU1mvwm9LO6bfA0NYG1w73zj+1EHsSbO7PsQ
	Sosu5jskQfx4WZQZ72Pg4WMVhTIcnaDfXSp32AKrPe3Om7pUognbbOGLmdSSnYiP
	xWz3JkfSOhY3s2YpgzBEybQ2AxPN4Pcl6UrfqnaWjl3RHgktLSaIr93u8+02yMFS
	9ZomoQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yj0pp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 12:59:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso2733313eec.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 04:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795179556; x=1795784356; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljQ7TWDsmpMFEiU8pyLv6J9tWz8nv1x1LYYHIaNgcrQ=;
        b=OMHkVmaxH1zmsZ2Pun8gmVEOiT1KG8a7sm8ztqGbpXwIIrVrSGB3yPC8jlKRxe5DNr
         8j3UUQc8yxj1lRl5gKSCyieqo/GYfmHuPSc9q7LmcymZaJu6oZ+XkK9LK2kQ6RbYe6Jd
         ChuCkhBnmo30gxmvty5vZNo13IE58tNr3isuWFxqStUZUTX4NZ+FQIoD2dDnKATGtPfu
         w7QH7tckrEQio6Iz8gu8AxOG5ZjcnaKYUFkaRnZKXG8YSprvSt3zdphqWWbzrZLFGtqn
         qKnJDubmH+d3d+J2wrPuW4Bjjwvhn/hMA3+D6RoPzeHwDY3otPqnagJuPFFEDJEAkS3I
         6rvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179556; x=1795784356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljQ7TWDsmpMFEiU8pyLv6J9tWz8nv1x1LYYHIaNgcrQ=;
        b=EjWjJJTM1onvkVPKX1Kei/kP90tIi7iTRIrSDe6xa3lm3bz5L7ltjR5LASLlVk4PT4
         t2FdEbdtcje+uzOxMCBdSvEnCq/QasMC0Q9XfMMThbqZPPVV0Hi7C8+VOPVAkH7JhuNG
         zSzWRl7c6oy+vI45D8/7Av3Km+HRn6T3wcu8Ib7Ely8mJkrLD+r8bpDcamc0DyD9zGby
         VzqlU2fqJ2fxkbRDhVWeFAT/gfwKV4r7dQVTBnK02sVrSpuxQoWZQ5ro66kvHl6R/CpN
         AC2JUEcJMZjEEYVkqZNue18eOcfrevfYbNZeWbmNocDvsNQre6m6Ex9bg1BwX2BgP3bF
         GrAA==
X-Gm-Message-State: APuU4Z9KNMBNmSyacwAG5nTr6RJNLbWb4KAcop11AptA+a3SX4xafCke
	sKLrA2P+9VNSqhBAyXR19dHhFcbxnpEEmTp/YRcxwiZ2jdLdg5lfIEauvvpJJOW6FWTybpb5HpR
	VNEvDrZEmDPAMOuECOIq/mDoLACvHPsrQl3N5Gu2XvgVSnaEZyJ6WP7KsNBq0fiep03Do0X+cjp
	CssbU=
X-Gm-Gg: AZFdTZcnrVjSBYJJ/1FXxxYfNeYxeWf0AkfWKnpifTrDeYhJhzMDccCv87Xqg37WX1p
	2CWx5CRdu1kraya2z9qngcA/b9WpgpmhT5aUGqeX17a196faK085Leqj29wUEwZpnVedbb4SO/b
	q9H3M7Zvoxp8T/UhpPlmzIpHxlnOEmUzeP6E0pAkxvdqRxRKHsT5HzOa89/UsBjI1576yC8UBrv
	XnrcFu0CJmEarfbQaKp6ZXMLpFAQurnX2oF5Sv1OwBgIEuNrobSeOjEohXq7knNPE486xFgUJCR
	wskehNgXik4AvJRKK/dPdP6LWdcARV6PnwrDiLRfW/5m7MQYWqmgWB4kqMeyBZi9ELYtwsrCA4e
	ty1Vi3sI+7SkRvrx4Zf1hz2xgekaX79prXhNKrgSRYRXwc471Z4i+PFfuI6UoPgYNxeRrnD6Wek
	JD
X-Received: by 2002:a05:693c:87c1:10b0:384:4451:f6d with SMTP id 5a478bee46e88-3856e947af8mr2734853eec.11.1795179556263;
        Fri, 20 Nov 2026 04:59:16 -0800 (PST)
X-Received: by 2002:a05:693c:87c1:10b0:384:4451:f6d with SMTP id 5a478bee46e88-3856e947af8mr2734839eec.11.1795179555873;
        Fri, 20 Nov 2026 04:59:15 -0800 (PST)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm7801022eec.16.2026.11.20.04.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 04:59:15 -0800 (PST)
Message-ID: <439d7620-b701-428c-96e1-7b017b16ba07@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:29:12 +0530
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
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for
 remoteproc SMMU mappings
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
 <20261119-shikra-el2-v6-5-0e91a1467e79@oss.qualcomm.com>
 <sashiko-outbox-223064@kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-223064@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b004425 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AWZr7nFnjNTLzfHANTgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MSBTYWx0ZWRfX/yGpTUawPWqr
 ktwXG1EeM0bWtSC6Anh4XPyil74Ew9Ou69H7yOXpqjJlpBHq7LEm0Qi60op6oAcz7GctlgH6/h6
 9pC7jXUG/1/nqmH0tdbMN+CMw0oCmCPt9GqHGODABM+sVvs/s2f4drF6rZrIND3/6y1SY6aqc6w
 RiPwxXKw5WJhNktoTgNNut9RrnCmmhisxdMmOR35dcjr2rYBBuE2OVc3B7mxcqJiJRSdKxHbiIb
 BnYPXr50rxi7L6l6HQw87z7+D3OpqJs9vgvo7vVPal3toYVJoUeuAbFAV8/SWmZjUx5TxQz7hdg
 6XzpPx8gNTm/dLu3TrkEUnM683C2P68+bm8102pQhmAij3lDzHRUNJDJx0zP19GNjDFq0VzIqAJ
 e7bB4YkY6SiK8dHz1qDXWLFd6AfGDBgSR7ObPGGa9RAUfR31v7aCUb5huGTT5O0dMsOAago1hb5
 KOWTfxMnUalHZCHy/hA==
X-Proofpoint-GUID: JiucSL5WA5ex_Uzqhn_b5KtNSzf6F4VI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MSBTYWx0ZWRfX+NL48rc4omMk
 kRNf4Y81U9YScb2OSUhRtB4HxAnE7dYjiU3+Q9ACnDyU25EH07cP80Obr3TIcALuSkU6j2NsfMY
 hbduKRvEa8GhVIUrpaLSyAhpKUqZV+s=
X-Proofpoint-ORIG-GUID: JiucSL5WA5ex_Uzqhn_b5KtNSzf6F4VI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200051

On 11/19/2026 5:21 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] arm64: dts: qcom: commit message mentions Shikra and omits
>    disabled nodes
> --
>
> commit 4293b12aa38fd366536aa13846bd84f70cea3ea7
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
>> arm64: dts: qcom: sm8750: Add EL2 overlay for remoteproc SMMU mappings
>>
>> SM8750 board boot Linux under the Gunyah hypervisor, with Linux running
>> at EL1. Linux can also be booted directly at EL2 on these devices.
>>
>> For EL2 boot, describe the IOMMU streams used by the remote processor
>> firmware in the DeviceTree consumed by Linux.
>>
>> Add an EL2-specific DT overlay and apply it to the Shikra IoT variants
>> to produce -el2.dtb artifacts alongside the standard DTBs.
>>
>> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> [Severity: Low]
> This isn't a bug, but the commit message mentions applying the overlay to
> the Shikra IoT variants, whereas arch/arm64/boot/dts/qcom/Makefile applies
> sm8750-el2.dtbo to sm8750-mtp.dtb to build sm8750-mtp-el2.dtb.  In addition,
> the subject and changelog only mention the remoteproc SMMU mappings, while
> arch/arm64/boot/dts/qcom/sm8750-el2.dtso also disables gpu_zap_shader and
> iris.

Right, the commit message was carried over from the Shikra patch and 
does not match this overlay.
Will update commit message to address this.

Thanks
Komal


