Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979449;
	b=a130ArBljVfzMsXRX9XguKyx3L3UDqTnk/j/pBLCyswS8mMnu/KocJK5R55ltRGq0XF7
	 aNpemz7yYJTJ5SCInI/02rPkQ/R/rsJrTe38b6bSzWWAS/VTjlP7SsjNB84S/i7QCsOqU
	 5IoBbsMDTaI8gynq5h/iDMlkor2oRIrnVpPJozYKDS48tO/eC5XGbrsFElk5kmHJU6+sl
	 9NfHpVUgyGanxYDLbnE+ses1GsrVflX61VE0XXWOveL2huBZo+LSSZdwbY1z1NbXybizh
	 JLeaJ/7PKYvJZDkhOyd5R5tcrRZaVHfa6S0xOz+bkx1CdjL2gzAJFBwco4XAJTxQhRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CycAVimWvVR/ose7ROpn2vc5d6AcckbgRFZm/MxNjmA=;
	b=f1sYFn0Du/2tlVlsGlV1UOBBfIEp0dGXg2aJg3SFijRxPtgEES52xOL4dBLr+7cX9tiL
	 gbtvDmpkh9G+eDa6MQvPQIgyHBvoQVmeMA4K80VfUhSJLlDa0tl9Xb0//nKuWttku/Uqz
	 bi2+xJ33Kk05ghtn+brlRC65X271WYyrsbM6sw1w2x3P7D7cz7X7ryq/hHMfD4w5bRbFS
	 I9T56t7hTMaXC7hqesLQWXG15XodwrhnhafDTp17YYKDeSAaGnFXMD3C+t0mf8jVmL6dl
	 CnMiTwR64JEIzHgjlG3q5MX+2SRjowFXftE/atPH21ca1lKIp8qCLect52cc9rBPBeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HfZMNmGR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKdIaYfX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CDF606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5CDF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HfZMNmGR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKdIaYfX
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI40ap52186100
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:24:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CycAVimWvVR/ose7ROpn2vc5d6AcckbgRFZm/MxNjmA=; b=HfZMNmGREAB/rErT
	axxJQfVDCfhmTakEJ3d+IksA1UlvLlM9brjWa8sSmuDlrhfGwRCkpMuSVS/iTSMA
	yzhUXkckG0NB4NBtLZAPze2SJv4C4nSSSaeTS/ttqZQzGcxbOz3zC4T8ySblJVYt
	4hJUVf6JYTlYgq8fWr+5ovBhc4e2VZvOj5yKhmz4zdSx+1dG0bPdY0Z7tl6lPoQ8
	jNvt8PftGfcza+nZhoD65Ci5KUO2val8y3u+nPYg7jJngOSAH2qIRsYwB0oCg2Cc
	5kFm0xm13Dt+21iCYin6P1huS2J8Foyz9zHlojnF3R5d5/I1qT7F6Nx5RvXmPT6n
	bH+wcg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8hbbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:24:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efe331887aso4539935ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 21:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794979447; x=1795584247; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CycAVimWvVR/ose7ROpn2vc5d6AcckbgRFZm/MxNjmA=;
        b=JKdIaYfXuVuCdR+gMBL8/7XPgaVUbw186Wo7guq/BmXFjI77+fMfXNwhLMeK67Prf2
         ml2NrUBr9weJrYedYMwz1xfWbEXqF5o4PrUeQ5Lejcwx2PB84bxwWkl03KKanJ6Luwe+
         vpTTpHoqA7OXi0Zpd4Ic1LJDEeGdYMatghvS7vvmtIDu0/14wKvYg9cNmld15nDMlKbF
         /K+FJHqQ5CJvCfFJWpYtLM1vbB4OmnmSBBhJIz/2znYa9wQ7HDzmkY/a06kb6sD5t30i
         69LHdbPSpFc7fu/7szYGT2qscxs2bBtdYOk1dViK9cu6B0P3Vaw8axzjtUZXHWP+Y1hd
         Igig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979447; x=1795584247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CycAVimWvVR/ose7ROpn2vc5d6AcckbgRFZm/MxNjmA=;
        b=dwJ/dsL2SpxvY4Fd7U8hG4s4mYRrhgeFcSQ+FWeYcFFzklNvARelFmFeLX7VeIPLjj
         oF7fAAlC0XZSLc9pHSPjq+IZJ0+jd01tNBeV/2P3WrSBZRAjZ0/1ZHyPdV+VarOyJj52
         fVjEurT9PZT+mucm1L4jop8UrJabZIAu2jSrWGovh5S04By4TRffLk6a8l0mCx/DVKMW
         cJtanbICzPZAQwhJhp/QriuAHkcpjANnNazjVFnd6/7uSqC37aAiCo4/kikIT4eTimzS
         vndlh0oAC0eFRdxX8tGrmSkk4e9R+a0d7JCuremR8cxVeaXeo3IXRplosMmRq3znzH6t
         gBdw==
X-Gm-Message-State: APuU4Z++YafkkXkk1LDOVfGIFjHAne3a0+YXXyCbgeSYEKbPdI7DlpXt
	M8Zc+A3gioPKaeRrQ6lX3QYw8keo+AAza69waWcDY+8pk6Kuj85gVcLJdVV0k9rQ7/rCU+mCRdD
	LQBSevk4ljlsqMOQwd3ZViakq6wQNB8EUzqLy/K/3lmsWma4JNHQ3+j0RO/L/0Da/UQCzEsfPSk
	ZglOg=
X-Gm-Gg: AZFdTZct/TbBjnEIxSc5vPmhPaP9qHXZpPYUT0ck+qCUpH6aAHoFkWSTZkqWUc5TXyM
	qyrCo+hnmAoIRtKbLFSCQOPRUJGVZQsA48hMnO2zkhdJLx8IcsLDl7VY4hqychBxWANcropBsNi
	91WmYW7ngdbO0sNlwv1EizT7zxOxVtCuB0A8UeUkw1ZywsbhiNrlRiaVUlBUZUPOdwXHjddvC06
	l/P2zH8ZNLMzXo6u2iCmQw8DYi70SOgga5ri4+FWo6kotY1GZvarcqMgqjusQCayUMKUN6FRf5V
	vtqAXVf01DejC3dppnoF6p6HUtg5zKOXgIVXg+eiZEWyWT4CfqlleY2ePTCBaZTB1TTiQ3knrLJ
	CB70MbV2jI6y5Vd+0YQQBMYSXl12lW4VidMls8K06G42ke8cGcNQdHhSsgtqc6sTdp8wYqBjLov
	zN5xEvsu3DcQ==
X-Received: by 2002:a17:903:a8f:b0:2e9:3ec9:5ad7 with SMTP id d9443c01a7336-2eff75255d2mr16056045ad.39.1794979446631;
        Tue, 17 Nov 2026 21:24:06 -0800 (PST)
X-Received: by 2002:a17:903:a8f:b0:2e9:3ec9:5ad7 with SMTP id d9443c01a7336-2eff75255d2mr16055865ad.39.1794979446097;
        Tue, 17 Nov 2026 21:24:06 -0800 (PST)
Received: from [10.152.203.150] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6115452sm6784635ad.16.2026.11.17.21.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 21:24:05 -0800 (PST)
Message-ID: <d98bb7d7-f1fe-4e25-939f-5ca247b32e44@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:54:02 +0530
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
Subject: Re: [PATCH ath-next 09/15] wifi: ath12k: add unified firmware image
 support for QCN9575
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-9-3f30fbc2bb69@oss.qualcomm.com>
 <sashiko-outbox-210895@kernel.org>
Content-Language: en-US
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210895@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jMbGnVRGjPhLNpfJ7KY2H93X84DeStQo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX1QB9uyoVNZmw
 oOAMK6FcuVz39EnLvJc/a6q2CJ4T4ry/Fv1Rqfw4P+w8Lxp5cD9b58tEtpgQTxEsmn2yNPzSW++
 ScPACY9vMBbaPClO2+BF2HW8T4ODZOY=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd3677 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SEhTcAk0GhFVYD1jnHkA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMSBTYWx0ZWRfX+tr5gyk/h+vx
 a42kyJVwkqiVE4WWNvQoilAvv9xLYy0ut/c5scVpFaOWwQAeQllYBojNEaCzx+oJmCJcKY9e4b5
 pqXODQ6CLIL3rdJdtTNzIRHnVijPtw8pG7IM7TtqyVM/15Ks1A0oETlq9hXKH7Kzkz+2tZW2lhr
 4xvdc3MzP8nFbUHyYnm+ApHh6h7bKbN/MdbkuLWPiaN/vvI3T41LBXAJaTGdbkCgDBes7MYhsFA
 ckgRp3q/ggweGrdYzQtuFup5Fy0UZUWue7SWKKbyqB3e9YknDU/mzPGUUmD+oLZROHCffAiVn/q
 52GM99yFeava2+8qJTkhoDBckUHosydVBWGAE4cebv6mFx3H4JZ8pbb76nwfgv1PilWEVYyJNYn
 D9wkCi3uB8lrTtaKMyMcsPh3B26YwiUQ2i7uO32GRXgX0xt382vJg1Gsct7TPhHwSaRiu0ogWQ5
 fiEPkkqV9mtl0Nri18g==
X-Proofpoint-ORIG-GUID: jMbGnVRGjPhLNpfJ7KY2H93X84DeStQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180021



On 11/12/2026 3:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Medium] wifi: ath12k: memory leak of mhi_ctrl->irq in
>    ath12k_mhi_register() [1]
> --
> 
> commit 7e637beba6af9aa8998e9035d9033a359dbfb287
> Author: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
> 
> wifi: ath12k: add unified firmware image support for QCN9575
> 
> This commit adds unified firmware image support for QCN9575 by caching the
> OTP board ID in ath12k_mhi_register() and writing it to a PCIe scratch
> register with readback verification in ath12k_pci_power_up().
> 
>> diff --git a/drivers/net/wireless/ath/ath12k/mhi.c b/drivers/net/wireless/ath/ath12k/mhi.c
>> index 56e697fbdad52..90b7774ae6e8c 100644
>> --- a/drivers/net/wireless/ath/ath12k/mhi.c
>> +++ b/drivers/net/wireless/ath/ath12k/mhi.c
>> @@ -211,6 +211,8 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
>>   		if (!board_id || (board_id == OTP_INVALID_BOARD_ID)) {
>>   			ath12k_dbg(ab, ATH12K_DBG_BOOT,
>>   				   "failed to read board id\n");
>> +		} else if (ab->hw_params->fw.unified_fw_image) {
>> +			ab_pci->unified_fw_board_id = board_id;
>>   		} else if (board_id & OTP_VALID_DUALMAC_BOARD_ID_MASK) {
>>   			dualmac = true;
>>   			ath12k_dbg(ab, ATH12K_DBG_BOOT,
>> @@ -218,7 +220,7 @@ int ath12k_mhi_register(struct ath12k_pci *ab_pci)
>>   		}
>>   	}
>>   
>> -	if (dualmac) {
>> +	if (!ab->hw_params->fw.unified_fw_image && dualmac) {
>>   		if (ab->fw.amss_dualmac_data && ab->fw.amss_dualmac_len > 0) {
>>   			/* use MHI firmware file from firmware-N.bin */
>>   			mhi_ctrl->fw_data = ab->fw.amss_dualmac_data;
> 
> [Severity: Medium]
> This problem wasn't introduced by this patch, but does ath12k_mhi_register()
> leak mhi_ctrl->irq [1] if mhi_register_controller() fails?
> 
> ath12k_mhi_get_msi() allocates the irq array with kcalloc() and assigns it
> to mhi_ctrl->irq.  If mhi_register_controller() fails later in
> ath12k_mhi_register(), the free_controller error path only calls
> mhi_free_controller(), which does not free the driver-allocated irq array:
> 
> drivers/net/wireless/ath/ath12k/mhi.c:ath12k_mhi_register() {
> 	...
> 	ret = ath12k_mhi_get_msi(ab_pci);
> 	if (ret) {
> 		ath12k_err(ab, "failed to get msi for mhi\n");
> 		goto free_controller;
> 	}
> 	...
> 	ret = mhi_register_controller(mhi_ctrl, ab->hw_params->mhi_config);
> 	if (ret) {
> 		ath12k_err(ab, "failed to register to mhi bus, err = %d\n", ret);
> 		goto free_controller;
> 	}
> 
> 	return 0;
> 
> free_controller:
> 	mhi_free_controller(mhi_ctrl);
> 	ab_pci->mhi_ctrl = NULL;
> 	return ret;
> }
> 
> Calling kfree(mhi_ctrl->irq) on the error path before mhi_free_controller(),
> matching ath12k_mhi_unregister(), would avoid the leak.
> 
> [1] https://sashiko.dev/#/bug/linux-7faf2081-d31b-4759-a736-dcc2f8a00de5
> 

This is a pre-existing bug. I will fix it in a separate patch.
