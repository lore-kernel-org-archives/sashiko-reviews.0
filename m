Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564826;
	b=3FtU8buYuyLH0Xfwz/QSX0NM8usW6mNNp4ydD5/kCgJpZ07kQ5Er0gv3sITLsXxtWJL0
	 ywWMpjAm5tfGoI605md3Yxji7DObuQpzaXy1spd0OvZzLNc2NSfExwdeMckUkpF0etrtq
	 8etyscoZAPuNJ56XjKAuqSBPAK4VWCw5EM9sbsGSi/4Me3e/zHf7jeGJ8SRDxUU7j6nvh
	 4M19slX/vJ/r8EMp24u1fiIxPeFj60bz+yEIkhTGwu0FrldLbzbQ2uR8mdN7uLsienFLA
	 RmI5PE5iu5RQzggd0KVWeW6dN14r0sWTNBJA83QCAjlMNPYT322Z8timiA49aUuhGug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564826;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=utB722pG4aKnLgm1naB0eRVd3F+Nmy4KeTzvcR2uhpE=;
	b=fvDV3xDSgAD+r0Sq6apZTzrcV7sCh/OAp3SrtNQccxDj2i9Sv7z2bhiKxC024eFLdFDF
	 ECV9M2caQo26SYcYmBjsZZ2t60APm+6tBi2cdPVNwu6NwpoHn7yZJxwhAiEUAshMkx+oF
	 JPAb+YM2lqwV3AzZGosGca9EACQD1GIB/P+VfpwZB+YI5cR12CpDZIFdOb3PJq61pU40w
	 SCWmATxIocycqPdv5iB7xcvenTHIiWXBpq9RR1cqMBC52e6OaZuIF284T4QMBccJV+SwW
	 uLTumGyuMNh7QETl3r0rbEH70VA4Bg641cl3cOM5+fhUGfBmG5Y9WM12idrNpT8fGfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lO6BK1wQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eVib9UVm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD27606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 06:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BD27606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lO6BK1wQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eVib9UVm
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L6UsTD3979071
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 06:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	utB722pG4aKnLgm1naB0eRVd3F+Nmy4KeTzvcR2uhpE=; b=lO6BK1wQKiqdV5i/
	zQAoWoJtXWRPGU5Ektk0E8e8/1DZaRYp9Cuqq3Fzlf13OxQX7+vIgKo7k8T2C8Ax
	BAmY6OPZmTWLlulKpPnuWjg6XX5mokYwZXGvhLxqZ7xDr1cpkyza728WHuJU+EfP
	KHCVVzmaB8sk7jDnY3QsD5G7nWIrELxjb3qixf3zoP/e6z3S1kPNkihtKXdsp/kq
	IsHiy5K74XSiHCIq5sAzDBNRkn6UMvZMkmF7AgPEJHN2PQdD0d3PTdgEccmHvbiK
	OcOL7tPEaCQZulRJiWy6B+qw7HS0S7JjfUY0KTw7zstVG5RURDd4ZL2HK77Izxkh
	V7iENQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r1fec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 06:40:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a086f5d91aso488883b3a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 23:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564824; x=1793169624; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utB722pG4aKnLgm1naB0eRVd3F+Nmy4KeTzvcR2uhpE=;
        b=eVib9UVmtbkL74HeXCe2PdXvz/DyMQx9rsOE54aua2BiUaQLl7wV2SexoJKykDGimY
         S3Yi1sIk13BCkTH2DQZusl33lF2gE6nTemn3VexloZlT6k4ZBhwhPcizfeTeKI2PEBI+
         VJBMprs+UDsMONRZxA2PSHnA1z7C0sI0sdQFS77w79lr+HgUDxs8ZgvKi9Q49gf3luQ4
         Iq04EHyvXpWUWkTnu5YL+JYv/J0ZiOweb/ppQIqOzqNwbg+eU5t331iUpVG0pdc0zMIA
         fxceeFd89Npj7Rt2xXFHnbqkM9/NwLCdLtUpybftro2Blpvrybj+CSulmZ52i7zaO1ZK
         ZsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564824; x=1793169624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utB722pG4aKnLgm1naB0eRVd3F+Nmy4KeTzvcR2uhpE=;
        b=StpMLm1+miDghd3YEoVlRdTSKDi2+NUrKElA1S0ooU+4pw2C1bRpyb+yXx6RR4GRzl
         TMZipjRRK8GMQeaekC9AL40kSaDYHeo+TgClnIy6pZivvIP9wt6jNntt+qRXS2MVgGMO
         qndCzvauyhzV7E24VEoTJOfWty9Q2x4cyDDzQ2icOyp8dnL3Zg+oVYjw3wlAwdFsnbHA
         WCjWkEqpFx+e6+5z29JJRa2nyRxx8cUgUdwSVMlYrXv1LU+7iuAWr/JGhOVvxcfH7Fdp
         N/RMd73YerojE9iJqmaZ8MIYNQD997lQm6SuLr3uUe/frClHXgCQ0f06S6WDzoxe4XCQ
         esaA==
X-Gm-Message-State: AFq9FYLjBxplMWASx7dGpGJ14zLO5rZ2+weJwCj6XuSeXFQJISbhkWb8
	9zMfeSNCg/Ry1luxsgcbeHrnbH6spywhAv2835d8gKazP2t1YtcvkjEHUKPNMsiQbVBHs6n7p8H
	Cb9m2LNwuvbJGBOqQLBujfHITw/o4Iy1f7wEgHL0tnPilDOR+wb7c/GrM1pk5Mflqp8s1DH2oHu
	YGJxY=
X-Gm-Gg: AYBFou2IjraEMhmBsxv5tMZ5JG5l0lENO55OeLZJd6nSn8KQGlstaNdl7g1XxSbvQJd
	BEcARo5zr8/70rAtcdaU4+srfhSojFk09sKX/vKcbsRqcx6YFbN+jxJI8jsS9iFyqMOEX92UB5g
	ibHPOyEErtzORwEb5JuJ7WnluhPMMRpOqXMluSmsitcPdb+NEUzGHeZkPRUpIrsdwdCjiZwVUiH
	0Ypf4ik+AEAZs9Z5ADkEvyme+gz7AYgG+JD6RQpeoBPNQoZaYhOC2qcR93O972Ad6pkCJ/1eGgB
	iutK2T0iclErVpmidJ8Foz5o7EoUvC4txYAAIduqKr8qBX3UfEhz5f6WXxYr2QRuSWg4TkEuvaj
	NL1DJx6FpbWQvOROazg7tyMvGCGv9N8eWlw==
X-Received: by 2002:a05:6a00:1f12:b0:89d:e6e2:b2a6 with SMTP id d2e1a72fcca58-8a089d37713mr858467b3a.45.1792564823812;
        Tue, 20 Oct 2026 23:40:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f12:b0:89d:e6e2:b2a6 with SMTP id d2e1a72fcca58-8a089d37713mr858448b3a.45.1792564823308;
        Tue, 20 Oct 2026 23:40:23 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a089611088sm441564b3a.54.2026.10.20.23.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 23:40:22 -0700 (PDT)
Message-ID: <5e649ec5-48f7-41c5-ba61-78fc7c26dba1@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:10:19 +0530
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
Subject: Re: [PATCH ath-next v2 03/17] wifi: ath12k: Add hardware parameter
 for QCN6432
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
 <20261016-mpp-bringup-v2-3-f510c33bfcf5@oss.qualcomm.com>
 <sashiko-outbox-173693@kernel.org>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-173693@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad85e58 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=TF8K1ITAIdH5bycUbigA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JkTn4KY4TrLu4eO3mePVnIf2PZsWQu2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX9F4SpTaGgmS/
 g25NHVncdAfTckqUn6nINx6tQ4oTWVK81b5aQI2LRKU+cgmEWCZ8Z9vQgaRFfzKsKCGjkk1SX6N
 m1c7QJZGfnrhIc/GNEhfKbWIukObOaOM4O7WWkn5LPeH2DSoyv1IYRNYCQZh5rA1ISqRESws06b
 cJ+gFcxRzi/aKdRCLzC/EIJhJVvg7yNZSkH+d8vY+/RCkW8G/etqdHDuYaXBUNigB1Jd7UZIODP
 nbkSolz0bYOpRDS1NXpchnLp/EcSgQreqv8dWws5JNq8wRRtw79FmxS43PzHLFuxRSTWg93iyWp
 VySc2rxo9By8hUQVsO+bqrsaB42GZReSylYDIFMq0yXwIN/TqbZ8Ibc3pWmPzTxQ6QilN9s7Txy
 TJUKm5lAXyFJpOfedMyT1JbTHs/88awLHhRmiER610yLWwyXL3yWFw0wGHEgdxJi5G+bRdNznS7
 pk8FO1wvjTDTbTYziUQ==
X-Proofpoint-GUID: JkTn4KY4TrLu4eO3mePVnIf2PZsWQu2y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfXzATvFtNMknFu
 /SvadL69eKmfJrArGkdrEeQpXeyllIJKUDf0RVQIKKhvX3hrl6pxM3OjbA9yW5dDyuYvJXzq0s6
 l5UwlTA7cS6+HBOwwQQuX0K43sTjHrs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210026



On 10/16/2026 9:11 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] wifi: ath12k: missing qmi_max_chunk_size for QCN6432 breaks memory allocation fallback
> --
> 
> commit 417c2f74682574a9e982b5753b7747e20b63cda7
> Author: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> 
> wifi: ath12k: Add hardware parameter for QCN6432
> 
> This commit adds hardware parameters for the QCN6432 WiFi device in the ath12k
> driver. It introduces a new hardware revision definition and configures the
> ath12k_hw_params structure for QCN6432 by reusing parameters from IPQ5332 and
> QCN9274.
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
>> index b1c17cc197dfd..494c7b3ae1acf 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
>> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
>> @@ -906,6 +906,91 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
> 
> [ ... ]
> 
>>  	},
>> +	{
>> +		.name = "qcn6432 hw1.0",
>> +		.hw_rev = ATH12K_HW_QCN6432_HW10,
> 
> [Severity: Medium]
> Does this struct initialization need to include .qmi_max_chunk_size?
> 
> If .qmi_max_chunk_size is not initialized, it will default to 0. During
> firmware memory allocation in ath12k_qmi_alloc_chunk(), if
> dma_alloc_coherent() fails, the driver falls back based on this threshold:
> 
> 	if (!vaddr) {
> 		if (chunk->size > ab->hw_params->qmi_max_chunk_size) {
> 			ab->qmi.target_mem_delayed = true;
> 			...
> 			ath12k_qmi_free_target_mem_chunk(ab);
> 			return -EAGAIN;
> 		}
> 		...
> 		return -ENOMEM;
> 	}
> 
> Because qmi_max_chunk_size is 0, any failed chunk size will be strictly
> greater than 0. Will this cause the driver to indefinitely return -EAGAIN,
> asking the firmware to supply progressively smaller chunk requests, rather
> than correctly terminating the failing QMI negotiation with -ENOMEM?
> 

QCN6432 uses fixed memory regions specified in the device tree for QMI memory
allocation and does not use dma_alloc_coherent() for this allocation path.
However, I will initialize .qmi_max_chunk_size for QCN6432 as well, since it
is a hardware parameter.

>> +		.fw = {
>> +			.dir = "QCN6432/hw1.0",
>> +			.board_size = 256 * 1024,
>> +			.cal_offset = 128 * 1024,
> 
> [ ... ]
> 

