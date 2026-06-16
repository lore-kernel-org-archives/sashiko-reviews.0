Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE262F12A5
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 09:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601616; cv=none; b=IeZNTtGXxYcbpaCCkBafbJA5+1EcBKGEt9vx7AtxZgzJ2ud6fT9yEutsXjIAnL+jJwgiLsWLZP//i4p9t3w22g7HIKg62XKX6TOU+KH6Dc1s0X6oyE9J0/Mt5cU101SIkRToGNtu7IKvvG4ywxNyVhTpDZpc16a2TaXUgnePIt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601616; c=relaxed/simple;
	bh=NAw2aTt156UXj/vzyCFj05vsi0gzzhKJtngHULTfHSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CRYMo+2Oz956wF8bFKhl3bmDF6dQjodVbmyR5PMBZ5TQfvQTKhbKVpgOX4pHTmt82+ZaBdmHy0hJtlK9tlU3KaF7EUtOb6C6yjnhHLFI83tnGk2htEw5WIqoqo1AanbeUekJ+eFcl5DM9JJ4LgFYdMI8Xbkfemlh/ihkmpTMSA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVxIgl5R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWY0m9tH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVxIgl5R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YWY0m9tH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G6fW1S2901569
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 09:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WKcJ5+YHj6LRiGZdkp7N7ktIBdN1t3qTPXNjJWfufDE=; b=dVxIgl5Ri3BAKhYX
	MHHYslKmY7BlwwAvoAe4rXyGnIoQYXROqE7wrq8eLDvV8U4JUpc/6r9zC1ROD+YQ
	xQ1VCk0MTA9WHQT9Rwo4sJK+ZE3ci3e6GNH/R74Lm9y6yTWQKfIWaXN4dGo1L+ye
	nPJMBHvPwUA3NLd6a5zy4yLCGDk2n8zkhChhvjlUjvap4URIG2W48SUCxkHatyZa
	z+4bBSeLhAI4wzKcCxl7W5+6xjG7A9vcw4bPPVdOi/z05FQBfsR/BEPxy2tsyARe
	4uRFv2t5jxzG8FuFLOmBAgX3bwFPaC8fEl/1cw5nNuW0htZ7BQ0CWOCKAUAoxl7l
	RKhBsw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1ep8nbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 09:20:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso111335835ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 02:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781601611; x=1782206411; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WKcJ5+YHj6LRiGZdkp7N7ktIBdN1t3qTPXNjJWfufDE=;
        b=YWY0m9tHN2s4+td5zfx1gmBPYZBjTIk+4P3EzKhwhfLxzHcokhobSqz999rqG5WubE
         W45TEmjFHlGOOSIAuudQmnQhSb9jD0GwcHRwZB1MqMSK5PFS8WZPmMYRKM/PyTD9K6oe
         h2sP1zIQyG0l6SKAPi7IGZHatoKl5wy4BkOlZm1IkwTKqd3xkHBOof9FyUKuns+FbETy
         ayYi7VhAGhTsUqEegkmiOT2911pD8yXAR8d4uhlZ7z2YpEMhjWT3Bv9elyX10rP8+fNa
         uJ0nE7rZg7pseFV2/eGsBXTnE7tPzb33mD6o/A6sgNSdbnNN2A54oTSIs5OmeILy2qMw
         WDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601611; x=1782206411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKcJ5+YHj6LRiGZdkp7N7ktIBdN1t3qTPXNjJWfufDE=;
        b=Pq5v7lK1W/Vqx7pe6UlKaVqrn4IHEOQRG/xp4KchyrGv5B4irXeX/7IJOee2Tu3g8k
         chjhQfb4njN1P7UI5LtSOaMxh26SlubDRoA3alyp+OY+Wn4oCU7laqa4Yum1yIGEUZc/
         K4IVdGgWTMJQwu594sejaiqYNc8ri2uBaYt4ln/+1MgAnpuJEU3Ch4j/0L9ir8sov0Zs
         PV3UsXzMVGyGmff6HueiBdlskTcywP8aEJHxgLJsVt+cysLSjPtWiDyt41Vi4Mqf1oLW
         5K07fWdVV2jjpp+IFWi1jNRoLzZjPhMyjpylzfP9GW095izNumxumg0HoHLd7j4ujhOw
         mEpA==
X-Gm-Message-State: AOJu0Yz5YjZIjpXBkg7kKYWCWCbGmAcprwll3hxZlGf60hD754blGB6+
	72TlVfN6v5ncr+uOxOgg0AbAQNwHlR2VAlQiiIlc7gCp05cLYFCAZCgWHGADqKPjwavrxBrBgQH
	w1yvrfjFK731eSKfTZ2gXkMYur2np9/ekJE+odvYJKvRBEB/XYXvBeBq1/2y1Sa3lzOFie0eLK/
	dzKZfoaA==
X-Gm-Gg: Acq92OHhBk9uY/CCwPALDNVwxfoCNhnPYjk3kCRA6kpam5f1fHG7A36kuh4JZdI9E3t
	btDm0n8DdLxCFauVwfqI+d0TB0bK5qjrLOvX+p5vB3CKimi1IjfEn5dwEdGLP/Jh4BVOKI6WBM6
	zOsr7OCbIPY+hrP9a1JBcCttUnb0e22ybnZychQQR6QesDCtXiTxHTpr/VhJ3+CarWbcE58glFQ
	o0t9r/KZhyiLMH14O35uOSHgpPfPFCLP7ep0D0erwpW5couRHKfSxLH6S4LopJClkW7fNZBitDu
	RU07Qf3b9yv53+YF7BstWRCOEYLTfEjeAzUnlXLYZeqlfDCszl/k68TPEnO/UzvGskqJGOtZfq3
	v0KFU5dWixm0oadqTavNfdenGsr7uajS0MQ0GlAIflbs++csSJjuxhehP0LkuDOKXrqSsF0HnOr
	yn2l6NEq2e+Q==
X-Received: by 2002:a17:902:e550:b0:2bf:2e93:c624 with SMTP id d9443c01a7336-2c69a1adf44mr30074065ad.27.1781601611318;
        Tue, 16 Jun 2026 02:20:11 -0700 (PDT)
X-Received: by 2002:a17:902:e550:b0:2bf:2e93:c624 with SMTP id d9443c01a7336-2c69a1adf44mr30073615ad.27.1781601610852;
        Tue, 16 Jun 2026 02:20:10 -0700 (PDT)
Received: from [10.133.33.52] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8c1f9sm130921925ad.59.2026.06.16.02.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 02:20:10 -0700 (PDT)
Message-ID: <15f7d54e-7cdc-4d88-a1b6-65c4ab99e76c@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 17:20:07 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] scsi: ufs: core: Add support for static TX
 Equalization settings
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
References: <20260615132834.2985346-3-can.guo@oss.qualcomm.com>
 <20260615134515.8D19A1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Can Guo <can.guo@oss.qualcomm.com>
In-Reply-To: <20260615134515.8D19A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I/ZVgtgg c=1 sm=1 tr=0 ts=6a31154c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aJQhKzKjLi4jenc1hegA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5MyBTYWx0ZWRfXyXenkH+7i2zb
 6gwpwnDqyRGoXRuOAWTILgOlUtF9bRQprFuTkPNC2kev+tNIbGq19bRr2n7NA1H5TaG+ig9CKfF
 3QBPp1rtUJUx2EXaoXgk7O/PV4O1MWU=
X-Proofpoint-ORIG-GUID: DG9J9HXTM-SxNb1K843Qzu6fzebmDqwm
X-Proofpoint-GUID: DG9J9HXTM-SxNb1K843Qzu6fzebmDqwm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5MyBTYWx0ZWRfX4udc1dRkk4HE
 AtadvwxfFquB64twDMVyC07Pdrf9MGpDKwV87QsO4YZbBRWshiySWqDnrvu/4U8p5JusdCTMIDP
 DbwVYSloxmQy3qlHyjqUDoDSvd13t7pLBvWoJDXbjB4nNpdazcoqHQ/z/U8DfiC90It9Pv0y85s
 4xt2+OcBzcRor337OJJW48PhhiceWXziORAxM+HPMlOzwvIUf7ZBzKY3dku9fDeIHv2rhUkXMUy
 QOgE/gZ9qLxp6NR2kj4tN1P35V00cczZxJarTHOJkix+uEXUQ9xqA2aEDdBb/WW4kcf+qe+RCGL
 1LxzaLHSd8DCpIPQJeJq3GssoCngSN3cUvNYZUdPKEsRIc4brD1BL/UmW4bW/+CYIGNuDkxjNer
 yEJHsYvUQ3OithSreCjpdCZzrJm6DCLuUKOWRYaX4+opB+4Hmz66MDA0k5mipIroQZeDAzveB4E
 pxIN70noKj4esd64ZGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 clxscore=1011 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160093



On 6/15/2026 9:45 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Calling `devm_kzalloc` with `GFP_KERNEL` while the UFS block device queue is quiesced can cause a direct reclaim deadlock.
> --
>
> commit ad55228fec48bc54dfc7ac781e567e213cf4a86e
> Author: Can Guo <can.guo@oss.qualcomm.com>
>
> scsi: ufs: core: Add support for static TX Equalization settings
>
> This patch parses board-specific static TX Equalization settings from
> Device Tree for each HS gear. It introduces a from_dt flag to track
> whether the settings came from the Device Tree and forces the TX EQTR
> procedure to run when those static settings need to be overridden.
>
>> diff --git a/drivers/ufs/core/ufs-txeq.c b/drivers/ufs/core/ufs-txeq.c
>> index aa64f2bf4f1ef..f06dc3c3492d1 100644
>> --- a/drivers/ufs/core/ufs-txeq.c
>> +++ b/drivers/ufs/core/ufs-txeq.c
>> @@ -1301,7 +1301,13 @@ int ufshcd_config_tx_eq_settings(struct ufs_hba *hba,
>>   	}
>>   
>>   	params = &hba->tx_eq_params[gear - 1];
>> -	if (!params->is_valid || force_tx_eqtr) {
>> +	/*
>> +	 * TX EQTR must run for the following cases:
>> +	 * 1. TX EQ settings are invalid.
>> +	 * 2. TX EQ settings are from Device Tree.
>> +	 * 3. TX EQTR procedure is forced.
>> +	 */
>> +	if (!params->is_valid || params->from_dt || force_tx_eqtr) {
>>   		int ret;
>>   
>>   		ret = ufshcd_tx_eqtr(hba, params, pwr_mode);
> [Severity: High]
> This is a pre-existing issue, but this patch further exposes it since the
> new from_dt flag condition can trigger ufshcd_tx_eqtr() during devfreq
> gear changes.
>
> Can calling devm_kzalloc() with GFP_KERNEL in ufshcd_tx_eqtr() cause a
> direct reclaim deadlock?
>
> During devfreq gear scaling, the UFS block device queue is first quiesced:
>
> ufshcd_clock_scaling_prepare() {
>      ...
>      blk_mq_quiesce_tagset(&hba->host->tag_set);
>      ...
> }
>
> Later in the scaling process, this condition is evaluated and can trigger
> the memory allocation:
>
> ufshcd_config_pwr_mode()
>    -> ufshcd_config_tx_eq_settings()
>      -> ufshcd_tx_eqtr()
>         params->eqtr_record = devm_kzalloc(hba->dev,
>                                            sizeof(*params->eqtr_record),
>                                            GFP_KERNEL);
>
> If memory reclaim is triggered by this GFP_KERNEL allocation, the system
> might attempt to flush dirty pages to the same UFS device. Since the queue
> is already quiesced, the flush would block indefinitely.
Good catch, a fix has been proposed as a separate patch:

https://lore.kernel.org/all/20260616090654.421850-1-can.guo@oss.qualcomm.com/

Thanks,
Can Guo.

