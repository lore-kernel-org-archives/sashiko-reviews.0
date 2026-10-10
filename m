Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEA4399377
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 03:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791601236; cv=none; b=UIBbTZQb8zZ1yNm+UkjUkrlVdD+7VS74rZ++h45tam4RvM5mCO44LusdmheI06fez+z2EXHMiIiYm+dBe8s7blrWZ3QrGzAEiM7Q8EdywQDM+ju7Pl/q7M4quprUelV0ANSbx/emSGdNwpwa6BmCcnyC2/i3ulE+nn8iiTbFp0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791601236; c=relaxed/simple;
	bh=9E4ucci8nIPDrzlzliEd3oyN/nOwLsWSVKKoHRh6Xak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jw43unYD8LXsL4uLn8HLS763tb/CtAp4rz56GgdE7oAvgTEhgHk0sFzNU+3KiUDLXd6qbhCF4mRVguh6vcj/mQPaZKtwCplUXnkM2lHieXKppV9XsIgJwPPYTI2T0jHS4WnvD31bJlLVPZabudyPqwGdclwbOyUwrxy2+WxvSpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JbSjJX9r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SI/StD6P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JbSjJX9r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SI/StD6P"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2fR743283387
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 03:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gD0ERVfebnTT1rddUWcpPNF+flaDO5Uk16VHXeNxq9M=; b=JbSjJX9rbaSGDOns
	8KuVibu2M+dRDXtHsB50jwkhD5c68C8/MA3Vr7qlKxvx6kFHww/KGjeyVRiwAZgX
	jXMeacVqFJZMvHoSWgQbf6mrsSck3JQ2c9k4MThf0F6tBv/Vt4KMK6nNpfaOFWvN
	Kv5LCTO+pBuD6gvNNrsUWfgUKMFF1YkMSEAebZ+EmTdhZuBAVqxUjX01rlzCQnlT
	cAE4Dr3eAxyoFQKH0IWwxC1Nsk0BiAIoiPTIRyHoRw1NbszQJ/Nmm2I6hIBIJIrU
	xmuQKj8Aw+AAMyk7hcYoohjy87Nt3Q2yp7mT0yJO8HCGdpASar0DTAPbRTBQvmpA
	9GVw0A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cpgg1sk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 10 Oct 2026 03:00:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d001671a54so4269065ad.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 20:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791601232; x=1792206032; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gD0ERVfebnTT1rddUWcpPNF+flaDO5Uk16VHXeNxq9M=;
        b=SI/StD6PDi1wD2HOv6irVzr99w9zD+S9Zhi273RqMfdWrv5XgG+ay6TrCT9O4jkOB9
         PYUZE/+GqBiLnVMKkPlOrIV1B7AY/qoWjM356X/S4uupYZqms7zbZQtkJpkk/pzdYpDh
         VC+vV7MM2Hizm07ajGOwvChKKr+SxvdMKPKPqX5k8mVmgclH3Q+FsuVUb7YvxIEmE/eS
         +shpnaGfD5/+WCz9sRQBKzM7tZbDKwSF96LjJT5iheL3IY8NJByRI8LVmRM/7tAhEYEp
         DlEryXzKLZR3oPAeeV2RSaVTleSxqtOFZ5WWeoTAjHOWPGD7AyEQY33aQEnbr1zH88yH
         uUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791601232; x=1792206032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gD0ERVfebnTT1rddUWcpPNF+flaDO5Uk16VHXeNxq9M=;
        b=Y2Vq2k9veK/8FifsQdLORX+dVxKHR5N8Goak8PL3xI/RulXNYNLpjN13tFbKWH2vzh
         M1nXJtK2A/yl2t3YQ3yEpE12orAFQFSnUi7AVtZSp4hownza/Qu2RqKk6xD9hvBRCO58
         x4BsIrKaZk/uSVaO12cVCikVwqOx0BtdwlYX1k9j0lnAadBKfp0feWw6ap01lRi+4rUw
         X8n2AHhEx3AB441ZY4SjkLniAwxZ0WwtyxUPiATjIW374MqR10K4FZ5qUaTCV2m6APcd
         tZfbAOGmILLLUBw6+oLEksIv8L8gvml64SVczpH+NFmV8R/A92VzjvF2NKyLnyYFPtlO
         lPfQ==
X-Gm-Message-State: AFq9FYJm884Jg7ISukSMh5Foz/KUG1mOg0gZmYFNVVmBJZEvYQcPzuZO
	GUSgHavNfuIrZsKtehQV3gbOubsScf+TKHrwZWsXVeLw4s2bovAygqO+dmzpy66GkocEiaNJYfz
	tmb4LcZQCwp4vR4oBx9eA+h5molND/sMe+fzsUKBPzUVdsMs1+oBJ8p8LdAKaI2gT4bLz2c68sp
	R7rLg=
X-Gm-Gg: AYBFou3SAHEWU2pZDowtt3g8+g2V4B0OFDPORF0kYZwqdI+Rw2VvwVbtU/z/0Th+Efh
	2LA4RYEZOiAkScQsRm5Czv4PPY2Ym1uMUmAaMsghVLiJ+W4Qhn2Js20r4wskEx5mGYdXRp4qPjR
	b7eS6vU6+W2uS7mmjUHMGjxJEWEpo/UDZZAsU4DaxG0y0LBfpZIJn5e0l/s5HHWHey1jo8s8Iom
	3LmMOIqcLFBWy5d+uWgSfLar/mF8L21Pf1T0Nqmz53P9XuH/PTR5pyp0q7+A9kpIi/lRkPRTW5J
	H5SYqFQFLbVhpuPTzNT8pDCHEeKsGMP4Hvt4SIe9+Nz+wY4B6XHb/sMaH5mSdLmsDYyvXMtV7pM
	hNaNec2erlihKdo+ju6OM85rB
X-Received: by 2002:a17:90b:384c:b0:3a7:aa1c:476b with SMTP id 98e67ed59e1d1-3ab3a747d90mr3583198a91.31.1791601232417;
        Fri, 09 Oct 2026 20:00:32 -0700 (PDT)
X-Received: by 2002:a17:90b:384c:b0:3a7:aa1c:476b with SMTP id 98e67ed59e1d1-3ab3a747d90mr3583167a91.31.1791601231914;
        Fri, 09 Oct 2026 20:00:31 -0700 (PDT)
Received: from [192.168.1.227] ([183.192.31.51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9633fsm7555871a91.6.2026.10.09.20.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 20:00:31 -0700 (PDT)
Message-ID: <be474e8f-1921-4789-a373-58321f9b94ba@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 11:00:28 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 02/11] net: ethernet: qualcomm: ppe: Fix
 multicast queue config table index
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
 <20261008-qcom_ipq5424_ppe-v1-2-16caf43e44ee@oss.qualcomm.com>
 <sashiko-outbox-165731@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-165731@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAxMSBTYWx0ZWRfX2n7JFeYkeX0g
 UDUzPKx0Vajgp98qSk5JL/X5JDmbwuHwtmTuJQ1mdaSDbobfWBhGbFywbAnhILZJVhtgYhj4Dhq
 RdLxOSZyxMW+3Xd5j5+JNj/xN0gctXc=
X-Authority-Analysis: v=2.4 cv=StoFe/O0 c=1 sm=1 tr=0 ts=6ac9aa51 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=N18iw5ntM+1D/B/PUaPCgg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=alxY7H8S5tj6ej4i5l4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: u176FqPlxKfudV6jBnQrCDcYYdDdV0ik
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAxMSBTYWx0ZWRfX14g75gqNf3J6
 VbswyLHJtNUSDHXBdZXQHpVwm5XDayi/ZhUkaxucum/z26BBSTmwaoiri1cNUMjiPk0LwsOvvt5
 3wojTS/xmXL6Iw64hg75+Z5INTor0fQgstjhNmNgmUSd5jEKDm6yvpMFbIITEItMNB18wBb5MbJ
 k2JguO+gt42tQ7fqSRnBKC371pihf//LsumNkPu6qO2CU03QNL5FH+Hcl2cjD2/NBkM7zNJoIkQ
 uW0iQkXEDtkeeMCrP5fB5w1igP2t4dyAdEtG2poHf+xrYOPfN6Ut23eofr1sxckCv0OxWqJL+vZ
 cjER/fKg4TpKXWEJo5+etJAyLXVjuh4E8E3yAhJzacN/BdzqFSQF8KzjNCLP6+cWRIZlG5JJKen
 Sc+KCx7+N58Tvil/LM8i1MnErn1Ifg/xP4N7a+UWILR92BEIxeq4EmaZDsXoAdTgcMLwTE1FtMv
 L3w9xrIa3SdUibTwMvg==
X-Proofpoint-GUID: u176FqPlxKfudV6jBnQrCDcYYdDdV0ik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100011



On 10/9/2026 10:52 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] net: ethernet: qualcomm: out-of-bounds regmap access due to incorrect multicast_queue_cfg size
> --
> 
> commit e63c30c06634bbba4d742f77aae5726bcf70fb62
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> net: ethernet: qualcomm: ppe: Fix multicast queue config table index
> 
> PPE queues 0-255 are unicast queues and queues from 256 onwards are
> multicast queues. The multicast queue configuration table has its own
> index, starting from 0 for the first multicast queue. The driver previously
> used the absolute queue ID as the index, which was out of range. This commit
> fixes it by converting the queue ID to the correct multicast table index.
> 
>> diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> index 125b73be92b13..8a553902ffad1 100644
>> --- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> +++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
>> @@ -1530,8 +1530,13 @@ static int ppe_config_qm(struct ppe_device *ppe_dev)
>>  				if (ret)
>>  					goto qm_config_fail;
>>  			} else {
>> +				/* The multicast queue table is indexed from 0 for
>> +				 * the first multicast queue, which follows the
>> +				 * unicast queues.
>> +				 */
>>  				reg = PPE_AC_MULTICAST_QUEUE_CFG_TBL_ADDR +
>> -				      PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC * queue_id;
>> +				      PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC *
>> +				      (queue_id - PPE_AC_UNICAST_QUEUE_CFG_TBL_ENTRIES);
>>  
>>  				ret = regmap_bulk_read(ppe_dev->regmap, reg,
>>  						       multicast_queue_cfg,
>>  						       ARRAY_SIZE(multicast_queue_cfg));
> 
> [Severity: Medium]
> In ppe_config_qm(), multicast_queue_cfg is declared as a 5-element array:
> 
>     u32 multicast_queue_cfg[5];
> 
> This means ARRAY_SIZE(multicast_queue_cfg) evaluates to 5 words (20 bytes).
> However, the hardware table entry increment
> (PPE_AC_MULTICAST_QUEUE_CFG_TBL_INC) is only 4 words (16 bytes).
> 
> Since this patch changes the index to correctly target the multicast queue
> configuration table, does this regmap_bulk_read() over-read by 1 word into
> the next queue's entry?
> 
> Additionally, a few lines later, regmap_bulk_write() also writes 5 words:
> 
>     ret = regmap_bulk_write(ppe_dev->regmap, reg,
>                             multicast_queue_cfg,
>                             ARRAY_SIZE(multicast_queue_cfg));
> 
> For the final queue in the loop, wouldn't writing 20 bytes overflow the
> 16-byte boundary and write 4 bytes past the end of the entire multicast
> queue configuration table?
> 
> Can this out-of-bounds register access trigger a bus error or system abort
> on the SoC?
> 

Each multicast queue config entry has only 3 words of configuration at a
16-byte stride. I will fix it in the next version by accessing only the
3 words of each entry.
